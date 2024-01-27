package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.CityResponseDto;
import htl.steyr.backend.service.CityService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/city")
public class CityController {

    private CityService cityService;

    public CityController(CityService cityService) {
        this.cityService = cityService;
    }

    @GetMapping("/{stateId}")
    public List<CityResponseDto> getCity(@PathVariable Long stateId) {
        return cityService.getCity(stateId);
    }
}
