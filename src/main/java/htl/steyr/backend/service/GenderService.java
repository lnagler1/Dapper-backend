package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.GenderRequestDto;
import htl.steyr.backend.dto.response.GenderResponseDto;
import htl.steyr.backend.model.Gender;
import htl.steyr.backend.repository.GenderRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GenderService {

    private GenderRepository genderRepository;

    public GenderService(GenderRepository genderRepository) {
        this.genderRepository = genderRepository;
    }

    public Gender mapToGender(GenderRequestDto gender) {
        return genderRepository.findById(gender.id()).get();
    }

    public static GenderResponseDto map(Gender in) {
        GenderResponseDto result = null;

        if (in != null) {
            result = new GenderResponseDto(
                    in.getName(),
                    in.isBinary()
            );
        }
        return result;
    }

    public List<GenderResponseDto> getGenders() {
        return genderRepository.findAll().stream()
                .map(GenderService::map)
                .toList();
    }
}
