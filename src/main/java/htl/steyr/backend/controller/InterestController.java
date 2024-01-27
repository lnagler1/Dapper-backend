package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.InterestResponseDto;
import htl.steyr.backend.service.InterestService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/interests")
public class InterestController {

    private InterestService interestService;

    public InterestController(InterestService interestService) {
        this.interestService = interestService;
    }

    @GetMapping("/get")
    public ResponseEntity<List<InterestResponseDto>> getInterest() {
        return new ResponseEntity<>(interestService.getInterest(), HttpStatus.OK);
    }
}
