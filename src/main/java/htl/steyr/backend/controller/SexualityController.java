package htl.steyr.backend.controller;

import htl.steyr.backend.dto.request.SexualityRequestDto;
import htl.steyr.backend.dto.response.SexualityResponseDto;
import htl.steyr.backend.service.SexualityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sexuality")
public class SexualityController {

    private SexualityService sexualityService;

    public SexualityController(SexualityService sexualityService) {
        this.sexualityService = sexualityService;
    }

    @GetMapping("/get")
    public ResponseEntity<List<SexualityResponseDto>> getSexuality() {
        return new ResponseEntity<>(sexualityService.getSexuality(), HttpStatus.OK);
    }
}
