package htl.steyr.backend.dto.request;

import java.util.Date;

public record UserRequestDto(int height, String email, String password, boolean terms, Date birthday, int age, String firstname, String lastname, String username, String nickname, String snapchat, String instagram, String tiktok, String quote, String bio, int dapCoin, Long lookingForId, Long genderId, Long sexualityId, Long locationId, Long religionId) {
}
