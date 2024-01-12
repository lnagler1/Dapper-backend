package htl.steyr.backend.service;

import htl.steyr.backend.repository.UserRepository;
import htl.steyr.backend.model.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class TokenService {

    private PasswordEncoder encoder = new BCryptPasswordEncoder();
    private UserRepository userRepository;

    public TokenService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

  //public String generateToken(User u) {
  //    u.setToken(encoder.encode(u.getEmail()));
  //    u.setTokenLifetime(System.currentTimeMillis() + 60 * 10 * 5000);

  //    userRepository.save(u);

  //    return u.getToken();
  //}

    public String generatePassword(String password) {
        return encoder.encode(password);
    }
}
