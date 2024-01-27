package htl.steyr.backend.service;

import htl.steyr.backend.dto.response.StateResponseDto;
import htl.steyr.backend.model.State;
import htl.steyr.backend.repository.StateRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StateService {

    private StateRepository stateRepository;

    public StateService(StateRepository stateRepository) {
        this.stateRepository = stateRepository;
    }

    private static StateResponseDto map(State in) {
        StateResponseDto result = null;

        if (in != null) {
            result = new StateResponseDto(
                    in.getId(),
                    in.getName()
            );
        }
        return result;
    }

    public List<StateResponseDto> getState(Long countryId) {
        return stateRepository.findStateByCountry_Id(countryId).stream()
                .map(StateService::map)
                .toList();
    }
}
