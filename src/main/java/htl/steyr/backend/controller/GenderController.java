package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.GenderResponseDto;
import htl.steyr.backend.model.Gender;
import htl.steyr.backend.repository.GenderRepository;
import htl.steyr.backend.service.GenderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/genders")
public class GenderController {

    private GenderService genderService;

    public GenderController(GenderService genderService) {
        this.genderService = genderService;
    }

    @GetMapping("/get")
    public ResponseEntity<List<GenderResponseDto>> getGenders() {
        return new ResponseEntity<>(genderService.getGenders(), HttpStatus.OK);
    }
}
