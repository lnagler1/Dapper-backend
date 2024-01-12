package htl.steyr.backend.dto.request;

public record LocationRequestDto(
        CityRequestDto city,
        StateRequestDto state,
        CountryRequestDto country
) {
}
