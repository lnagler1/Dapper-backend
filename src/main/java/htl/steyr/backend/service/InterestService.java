package htl.steyr.backend.service;

import htl.steyr.backend.dto.response.InterestResponseDto;
import htl.steyr.backend.model.Interest;
import htl.steyr.backend.repository.InterestRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InterestService {

    private InterestRepository interestRepository;

    public InterestService(InterestRepository interestRepository) {
        this.interestRepository = interestRepository;
    }

    private static InterestResponseDto map(Interest in) {
        InterestResponseDto result = null;

        if (in != null) {
            result = new InterestResponseDto(
                    in.getName(),
                    in.getIcon()
            );
        }
        return result;
    }

    public List<InterestResponseDto> getInterest() {
        return interestRepository.findAll().stream()
                .map(InterestService::map)
                .toList();
    }
}
