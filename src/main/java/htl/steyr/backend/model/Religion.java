package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "religion")
@Getter
@Setter
public class Religion {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(name = "name")
    @NonNull
    private String name;

    @OneToMany(mappedBy = "religion")
    private List<User> users;

}
