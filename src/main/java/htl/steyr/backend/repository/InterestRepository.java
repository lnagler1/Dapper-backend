package htl.steyr.backend.repository;

import htl.steyr.backend.model.Interest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InterestRepository extends JpaRepository<Interest, Long>{

    @Query
    List<Interest> findByCategoryId(Long categoryId);
}
