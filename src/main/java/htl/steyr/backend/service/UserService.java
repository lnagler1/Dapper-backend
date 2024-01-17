package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.GenderRequestDto;
import htl.steyr.backend.dto.request.UserSignupRequestDto;
import htl.steyr.backend.model.Gender;
import htl.steyr.backend.model.User;
import htl.steyr.backend.repository.UserRepository;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    private UserRepository userRepository;
    private TokenService tokenService;

    private static GenderService genderService;

    public UserService(UserRepository userRepository, TokenService tokenService, GenderService genderService) {
        this.userRepository = userRepository;
        this.tokenService = tokenService;
        this.genderService = genderService;
    }

    public static User map(UserSignupRequestDto in) {
        return new User(
                in.height(),
                in.email(),
                in.password(),
                in.terms(),
                in.birthday(),
                in.age(),
                in.username(),
                in.nickname(),
                in.snapchat(),
                genderService.mapToGender(in.gender())
        );
    }

   public String registerUser(UserSignupRequestDto userDto) {
       if (userRepository.existsByEmail(userDto.email())) {
           throw new DuplicateKeyException("Email is already registered");
       }
       User user = map(userDto);
       user.setPassword(passwordEncoder.encode(userDto.password()));
       userRepository.save(user);
       return tokenService.generateToken(user);
   }
}
