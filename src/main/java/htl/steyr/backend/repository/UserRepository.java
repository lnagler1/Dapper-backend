package htl.steyr.backend.repository;

import htl.steyr.backend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByEmail(String email);

    Optional<User> findUserByEmail(String email);

    Optional<User> findUserByTokenAndTokenLifetimeIsGreaterThanAndRole(
            String token,
            long l,
            String role
    );

    Optional<User> findUserByToken(String token);
}
