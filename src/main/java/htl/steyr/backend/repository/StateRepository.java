package htl.steyr.backend.repository;

import htl.steyr.backend.model.Country;
import htl.steyr.backend.model.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface StateRepository extends JpaRepository<State, Long>{
    List<State> findStateByCountry_Id(Long countryId);
}
