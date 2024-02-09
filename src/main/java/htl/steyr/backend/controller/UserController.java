package htl.steyr.backend.controller;

import htl.steyr.backend.annotation.Permissions;
import htl.steyr.backend.dto.request.*;
import htl.steyr.backend.dto.response.UserProfileResponseDto;
import htl.steyr.backend.service.UserService;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/hallo")
    public ResponseEntity<String> hallo() {
        return new ResponseEntity<>("Hallo", HttpStatus.OK);
    }

    @PostMapping("/signup")
   public ResponseEntity<String> signup(@RequestBody UserSignupRequestDto user){
       try {
           String token = userService.registerUser(user);

           return new ResponseEntity<>(token, HttpStatus.OK);
       } catch (Exception e) {
           return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
       }
   }

   @PostMapping("/signin")
   public ResponseEntity<String> signin(@RequestBody UserSigninRequestDto user) {
           String token = userService.authenticate(user);
           if (token != null) {
               return ResponseEntity.status(HttpStatus.OK).body(token);
           } else {
               return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
           }
    }

   @PostMapping("/signout")
   public ResponseEntity<String> signout() {
       try {
           userService.signout();

           return new ResponseEntity<>("", HttpStatus.OK);
       } catch (Exception e) {
           return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
       }
   }

   @PutMapping("/bio/update")
   public ResponseEntity<String> changeBio(@RequestBody UserBioRequestDto bio) {
       try {
           userService.changeBio(bio);

           return new ResponseEntity<>("", HttpStatus.OK);
       } catch (Exception e) {
           return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
       }
   }

   @PutMapping("/quote/update")
   public ResponseEntity<String> changeQuote(@RequestBody UserQuoteRequestDto quote) {
       try {
           userService.changeQuote(quote);

           return new ResponseEntity<>("", HttpStatus.OK);
       } catch (Exception e) {
           return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
       }
   }

   @PutMapping("/username/update")
   public ResponseEntity<String> changeUsername(@RequestBody UserUsernameRequestDto username) {
       try {
           userService.changeUsername(username);

           return new ResponseEntity<>("", HttpStatus.OK);
       } catch (Exception e) {
           return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
       }
   }

   @GetMapping("/profile")
   @Permissions(guest = false, admin = true, user = true)
   public ResponseEntity<UserProfileResponseDto> getProfile() {
       try {
           UserProfileResponseDto profile = userService.getProfile();

           return new ResponseEntity<>(profile, HttpStatus.OK);
       } catch (Exception e) {
           return new ResponseEntity<>(null, HttpStatus.CONFLICT);
       }
   }
}
