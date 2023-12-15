package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "gender")
@Getter
@Setter
public class Gender {
    @Id
    private Long id;

    private String name;
    private boolean normal;

    @OneToMany(mappedBy = "gender")
    private List<User> users;
}
