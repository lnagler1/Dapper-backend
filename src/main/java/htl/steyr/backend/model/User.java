package htl.steyr.backend.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int height;
    private String email;
    private String password;
    private boolean terms;
    private Date birthday;
    private int age;
    private String firstname;
    private String lastname;
    private String username;
    private String nickname;
    private String snapchat;
    private String instagram;
    private String tiktok;
    private String quote;
    private String bio;
    private int dapCoin;

    // LookingFor ( the things the user is looking for in a Relationship ) of the user
    @ManyToOne
    @JoinColumn(name = "looking_for_id")
    private LookingFor lookingFor;

    // Gender of the user
    @ManyToOne
    @JoinColumn(name = "gender_id")
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
    @OneToMany(mappedBy = "user")
    private List<Image> images;

    // Mapped to the user who liked the user
    @OneToMany(mappedBy = "user")
    private List<Like> likes;

    // Mapped to the user who got liked
    @OneToMany(mappedBy = "likedUser")
    private List<Like> liked;

    // Mapped to the user who matched the user
    @OneToMany(mappedBy = "user")
    private List<Match> matches;

    // Mapped to the user who got matched
    @OneToMany(mappedBy = "matchedUser")
    private List<Match> matched;

    // List of the interests of the user
    @ManyToMany(mappedBy = "users")
    private List<Interest> interests;
}
