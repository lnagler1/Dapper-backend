package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "interests")
@Getter
@Setter
public class Interest {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(name = "name")
    @NonNull
    private String name;

    @OneToOne(mappedBy = "interest")
    private Icon icon;

    @ManyToMany
    private List<User> users;
}