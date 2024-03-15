package htl.steyr.backend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/like")
public class LikeController {

    @GetMapping("/get/candidates")
    public ResponseEntity<String> getCandidates() {
        return new ResponseEntity<>("Lukas", HttpStatus.OK);
    }
}
