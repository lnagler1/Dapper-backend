package htl.steyr.backend.dto.response;

import htl.steyr.backend.model.Icon;

public record InterestResponseDto(
        Long id,
        String name,
        Icon iconId
) {
}
