package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
public class User {

    public static final String ROLE_USER = "ROLE_USER";
    public static final String ROLE_ADMIN = "ROLE_ADMIN";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    @NonNull
    private int height;

    @Column
    @NonNull
    private String email;

    @Column
    @NonNull
    private String password;

    @Column
    @NonNull
    private boolean terms;

    @Column
    @NonNull
    private Date birthday;

    @Column
    @NonNull
    private int age;

    @Column
    @NonNull
    private String username;

    @Column
    @NonNull
    private String nickname;

    @Column
    @NonNull
    private String snapchat;

    @Column
    private String instagram;

    @Column
    private String tiktok;

    @Column
    private String quote;

    @Column
    private String bio;

    @Column
    private int dapCoin;

    @Column
    private String token;

    @Column
    private long tokenLifetime;

    // LookingFor ( the things the user is looking for in a Relationship ) of the user
    @ManyToOne
    @JoinColumn(name = "looking_for_id")
    private LookingFor lookingFor;

    // Gender of the user
    @ManyToOne
    @JoinColumn(name = "gender_id")
    @NonNull
    private Gender gender;

    // Sexuality of the user
    @ManyToOne
    @JoinColumn(name = "sexuality_id")
    private Sexuality sexuality;

    // Location of the user
    @ManyToOne
    @JoinColumn(name = "location_id")
    private Location location;

    // Religion of the user
    @ManyToOne
    @JoinColumn(name = "religion_id")
    private Religion religion;

    // List of images of the user
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Image> images;

    // Mapped to the user who liked the user
    @OneToMany(mappedBy = "user")
    private List<LikeUser> likes;

    // Mapped to the user who got liked
    @OneToMany(mappedBy = "likedUser")
    private List<LikeUser> liked;

    // Mapped to the user who matched the user
    @OneToMany(mappedBy = "user")
    private List<Match> matches;

    // Mapped to the user who got matched
    @OneToMany(mappedBy = "matchedUser")
    private List<Match> matched;

    // List of the interests of the user
    @ManyToMany
    private List<Interest> interests;
}
