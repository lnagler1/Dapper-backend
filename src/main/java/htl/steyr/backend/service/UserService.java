package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.*;
import htl.steyr.backend.dto.response.UserProfileResponseDto;
import htl.steyr.backend.model.User;
import htl.steyr.backend.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;
import java.util.Optional;

@Service
public class UserService {

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    private UserRepository userRepository;
    private TokenService tokenService;

    private GenderService genderService;
    private CountryService countryService;
    private CityService cityService;
    private InterestService interestService;
    private SexualityService sexualityService;
    private LookingForService lookingForService;

    public UserService(UserRepository userRepository, TokenService tokenService, GenderService genderService, CountryService countryService, CityService cityService, InterestService interestService, SexualityService sexualityService, LookingForService lookingForService) {
        this.userRepository = userRepository;
        this.tokenService = tokenService;
        this.genderService = genderService;
        this.countryService = countryService;
        this.cityService = cityService;
        this.interestService = interestService;
        this.sexualityService = sexualityService;
        this.lookingForService = lookingForService;
    }

    public User map(UserSignupRequestDto in) {
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
                genderService.mapToGender(in.gender()),
                LocationService.map(in.location()),
                interestService.mapToInterest(in.interest()),
                sexualityService.mapToSexuality(in.sexuality()),
                lookingForService.mapToLookingFor(in.lookingFor())
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

    public String authenticate(UserSigninRequestDto userDto) {
        String token = null;
        Optional<User> result = userRepository.findUserByEmail(userDto.email());

        if (result.isPresent()) {
            User u = result.get();
            if (passwordEncoder.matches(userDto.password(), u.getPassword())) {
                token = tokenService.generateToken(u);
            }
        }
        return token;
    }

    public String getBearerToken() {
        HttpServletRequest request =
                ((ServletRequestAttributes) Objects
                        .requireNonNull(
                                RequestContextHolder
                                        .getRequestAttributes(
                                        )
                        )
                ).getRequest();

        if (request.getHeader("Authorization") != null) {
            return request.getHeader("Authorization").replace("Bearer ", "");
        }

        return null;
    }

    public User isTokenValid(String token, String role) {
        Optional<User> result =
                userRepository
                        .findUserByTokenAndTokenLifetimeIsGreaterThanAndRole(
                                token,
                                System.currentTimeMillis(),
                                role
                        );

        return result.orElse(null);
    }

    public void extendTokenLifetime(User u) {
        u.setTokenLifetime(System.currentTimeMillis() + 60 * 1000 * 10);
        userRepository.save(u);
    }

    public void signout() {
        String token = getBearerToken();
        if (token != null) {
            Optional<User> result = userRepository.findUserByToken(token);
            if (result.isPresent()) {
                User u = result.get();
                u.setToken(null);
                u.setTokenLifetime(0);
                userRepository.save(u);
            }
        }
    }

    public void changeBio(UserBioRequestDto bioDto) {
        Optional<User> user = userRepository.findUserByToken(getBearerToken());
        if (user.isPresent()) {
            User u = user.get();
            u.setBio(bioDto.bio());
            userRepository.save(u);
        }
    }

    public void changeQuote(UserQuoteRequestDto quoteDto) {
        Optional<User> user = userRepository.findUserByToken(getBearerToken());
        if (user.isPresent()) {
            User u = user.get();
            u.setQuote(quoteDto.quote());
            userRepository.save(u);
        }
    }

    public void changeUsername(UserUsernameRequestDto usernameDto) {
        Optional<User> user = userRepository.findUserByToken(getBearerToken());
        if (user.isPresent()) {
            User u = user.get();
            u.setUsername(usernameDto.username());
            userRepository.save(u);
        }
    }

    public UserProfileResponseDto getProfile() {
        Optional<User> user = userRepository.findUserByToken(getBearerToken());
        UserProfileResponseDto result = null;
        if (user.isPresent()) {
            User u = user.get();
            result = new UserProfileResponseDto(
                    u.getId(),
                    u.getUsername(),
                    u.getEmail(),
                    u.getAge()
            );
        }
        return result;
    }
}
