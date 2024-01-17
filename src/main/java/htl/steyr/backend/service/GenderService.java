package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.GenderRequestDto;
import htl.steyr.backend.model.Gender;
import htl.steyr.backend.repository.GenderRepository;
import org.springframework.stereotype.Service;

@Service
public class GenderService {

    private GenderRepository genderRepository;

    public GenderService(GenderRepository genderRepository) {
        this.genderRepository = genderRepository;
    }

    public Gender mapToGender(GenderRequestDto gender) {
        return genderRepository.findById(gender.id()).get();
    }
}
