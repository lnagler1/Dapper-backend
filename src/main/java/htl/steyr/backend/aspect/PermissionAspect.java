package htl.steyr.backend.aspect;

import htl.steyr.backend.annotation.Permissions;
import htl.steyr.backend.model.User;
import htl.steyr.backend.service.UserService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

@Aspect
@Component
public class PermissionAspect {
    private final UserService userService;

    public PermissionAspect(UserService userService) {
        this.userService = userService;
    }

    @Around("@annotation(htl.steyr.backend.annotation.Permissions)")
    public ResponseEntity<?> checkPermissions(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        Permissions permissions = method.getAnnotation(Permissions.class);

        String bearerToken = userService.getBearerToken();

        if ((bearerToken == null || bearerToken.isEmpty()) && !permissions.guest()) {
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
        }

        if (permissions.user()) {
            if (!isTokenValid(bearerToken, User.ROLE_USER)) {

                if (permissions.admin()) {
                    if (!isTokenValid(bearerToken, User.ROLE_ADMIN)) {
                        return new ResponseEntity<>(HttpStatus.FORBIDDEN);
                    }

                    return (ResponseEntity<?>) joinPoint.proceed(joinPoint.getArgs());
                }

                return new ResponseEntity<>(HttpStatus.FORBIDDEN);
            }
            return (ResponseEntity<?>) joinPoint.proceed(joinPoint.getArgs());
        }

        if (permissions.admin()) {
            if (!isTokenValid(bearerToken, User.ROLE_ADMIN)) {
                return new ResponseEntity<>(HttpStatus.FORBIDDEN);
            }

            return (ResponseEntity<?>) joinPoint.proceed(joinPoint.getArgs());
        }

        if (permissions.guest()) {
            return (ResponseEntity<?>) joinPoint.proceed(joinPoint.getArgs());
        }

        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    private boolean isTokenValid(String bearerToken, String role) {
        User u = userService.isTokenValid(bearerToken, role);

        if (bearerToken.isEmpty() || u == null) {
            return false;
        }

        userService.extendTokenLifetime(u);

        return true;
    }
}
