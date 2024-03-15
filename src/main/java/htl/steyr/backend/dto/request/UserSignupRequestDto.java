package htl.steyr.backend.dto.request;

import htl.steyr.backend.model.Gender;
import htl.steyr.backend.model.Location;
import htl.steyr.backend.model.Sexuality;

import java.util.Date;
import java.util.List;

public record    UserSignupRequestDto(
        String email,
        String password,
        boolean terms,
        Date birthday,
        int age,
        String username,
        String nickname,
        String snapchat,
        GenderRequestDto gender,
        LocationRequestDto location,
        List<InterestRequestDto> interest,
        SexualityRequestDto sexuality,
        LookingForRequestDto lookingFor

) {
}
