package htl.steyr.backend.repository;

import htl.steyr.backend.model.LookingFor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LookingForRepository extends JpaRepository<LookingFor, Long>{
}
