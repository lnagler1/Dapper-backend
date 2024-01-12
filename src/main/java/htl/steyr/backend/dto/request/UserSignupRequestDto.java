package htl.steyr.backend.dto.request;

import htl.steyr.backend.model.Gender;
import htl.steyr.backend.model.Location;
import htl.steyr.backend.model.Sexuality;

import java.util.Date;

public record UserSignupRequestDto(
        int height,
        String email,
        String password,
        boolean terms,
        Date birthday,
        int age,
        String username,
        String nickname,
        String snapchat,
        String instagram,
        String tiktok,
        Gender gender,
        Sexuality sexuality,
        Location location
) {
}
