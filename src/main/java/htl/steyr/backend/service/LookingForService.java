package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.LookingForRequestDto;
import htl.steyr.backend.dto.response.LookingForResponseDto;
import htl.steyr.backend.model.LookingFor;
import htl.steyr.backend.repository.LookingForRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LookingForService {

    private LookingForRepository lookingForRepository;

    public LookingForService(LookingForRepository lookingForRepository) {
        this.lookingForRepository = lookingForRepository;
    }

    public LookingFor mapToLookingFor(LookingForRequestDto lookingFor) {
        return lookingForRepository.findById(lookingFor.id()).get();
    }

    private static LookingForResponseDto map(LookingFor in) {
        LookingForResponseDto result = null;

        if (in != null) {
            result = new LookingForResponseDto(
                    in.getId(),
                    in.getDescription()
            );
        }
        return result;
    }

    public List<LookingForResponseDto> getLookingFor() {
        return lookingForRepository.findAll().stream().
                map(LookingForService::map).
                toList();
    }
}
