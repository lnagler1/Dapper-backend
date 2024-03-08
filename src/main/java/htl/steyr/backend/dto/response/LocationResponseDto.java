package htl.steyr.backend.dto.response;

public record LocationResponseDto(
        Long id,
        CountryResponseDto country,
        StateResponseDto state,
        CityResponseDto city
) {
}
