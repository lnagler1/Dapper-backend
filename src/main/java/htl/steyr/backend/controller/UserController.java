package htl.steyr.backend.controller;

import htl.steyr.backend.dto.request.UserSignupRequestDto;
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
}
