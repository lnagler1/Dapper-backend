package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.InterestRequestDto;
import htl.steyr.backend.dto.response.InterestResponseDto;
import htl.steyr.backend.model.Interest;
import htl.steyr.backend.repository.InterestRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InterestService {

    private static InterestRepository interestRepository;

    public InterestService(InterestRepository interestRepository) {
        this.interestRepository = interestRepository;
    }

    public static Interest map(InterestRequestDto in) {
        return interestRepository.findById(in.id()).get();
    }

    private static InterestResponseDto map(Interest in) {
        InterestResponseDto result = null;

        if (in != null) {
            result = new InterestResponseDto(
                    in.getId(),
                    in.getName(),
                    in.getIcon()
            );
        }
        return result;
    }

    public List<InterestResponseDto> getInterests() {
        return interestRepository.findAll().stream()
                .map(InterestService::map)
                .toList();
    }

    public List<InterestResponseDto> mapInterestsToCategory(List<Interest> interests) {
        return interests.stream()
                .map(InterestService::map)
                .toList();
    }
}
