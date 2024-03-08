package htl.steyr.backend.dto.response;

import java.util.List;

public record CategoryResponseDto(
        Long id,
        String name,
        List<InterestResponseDto> interests
        ) {
}
