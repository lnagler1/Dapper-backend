package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

@Entity
@Table(name = "image")
@Getter
@Setter
public class Image {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(name = "path")
    @NonNull
    private String path;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
