package htl.steyr.backend.repository;

import htl.steyr.backend.model.Sexuality;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SexualityRepository extends JpaRepository<Sexuality, Long> {
}
