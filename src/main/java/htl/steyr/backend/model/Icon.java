package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

@Entity
@Table(name = "icon")
@Getter
@Setter
public class Icon {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(name = "path")
    @NonNull
    private String path;

    @OneToOne
    @JoinColumn(name = "interest_id")
    private Interest interest;
}
