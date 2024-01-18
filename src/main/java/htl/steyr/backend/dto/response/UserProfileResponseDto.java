package htl.steyr.backend.dto.response;

public record UserProfileResponseDto(
        Long id,
        String username,
        String email,
        Integer age
        // ADD the rest of the fields later
) {
}
