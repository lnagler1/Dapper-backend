package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.SexualityRequestDto;
import htl.steyr.backend.dto.response.SexualityResponseDto;
import htl.steyr.backend.model.Sexuality;
import htl.steyr.backend.repository.SexualityRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SexualityService {

    private SexualityRepository sexualityRepository;

    public SexualityService(SexualityRepository sexualityRepository) {
        this.sexualityRepository = sexualityRepository;
    }

    private static SexualityResponseDto map(Sexuality in) {
        SexualityResponseDto result = null;

        if (in != null) {
            result = new SexualityResponseDto(
                    in.getName()
            );
        }
        return result;
    }

    public List<SexualityResponseDto> getSexuality() {
        return sexualityRepository.findAll().stream().
                map(SexualityService::map).
                toList();
    }
}
