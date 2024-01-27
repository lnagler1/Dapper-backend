package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.StateResponseDto;
import htl.steyr.backend.service.CountryService;
import htl.steyr.backend.service.StateService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/state")
public class StateController {

    private StateService stateService;

    public StateController(StateService stateService) {
        this.stateService = stateService;
    }
    @GetMapping("/{countryId}")
    public ResponseEntity<List<StateResponseDto>> getState(@PathVariable Long countryId) {
        return new ResponseEntity<>(stateService.getState(countryId), HttpStatus.OK);
    }
}
