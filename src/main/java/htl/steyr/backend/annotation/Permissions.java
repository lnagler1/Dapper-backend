package htl.steyr.backend.annotation;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface Permissions {
    boolean admin();
    boolean user();
    boolean guest() default true;
}
