package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.LookingForResponseDto;
import htl.steyr.backend.service.LookingForService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/lookingfor")
public class LookingForController {

    private LookingForService lookingForService;

    public LookingForController(LookingForService lookingForService) {
        this.lookingForService = lookingForService;
    }

    @GetMapping("/get")
    public ResponseEntity<List<LookingForResponseDto>> getLookingFor() {
        return new ResponseEntity<>(lookingForService.getLookingFor(), HttpStatus.OK);
    }
}
