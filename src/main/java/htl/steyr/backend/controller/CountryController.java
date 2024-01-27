package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.CountryResponseDto;
import htl.steyr.backend.repository.CountryRepository;
import htl.steyr.backend.service.CountryService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/country")
public class CountryController {

    private CountryService countryService;

    public CountryController(CountryService countryService) {
        this.countryService = countryService;
    }

    @GetMapping("/get")
    public ResponseEntity<List<CountryResponseDto>> getCountry() {
        return new ResponseEntity<>(countryService.getCountry(), HttpStatus.OK);
    }
}
