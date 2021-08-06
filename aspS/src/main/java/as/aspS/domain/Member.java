package as.aspS.domain;

import lombok.Getter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Date;

@Entity //JPA가 관리하는 객체이며, db테이블과 매핑하여 쓸 것임.
@Getter
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "member_id")
    private Long id;
    @Column(unique = true, nullable = false)
    private String email;
    @Column(nullable = false)
    private String password;
    @Column(nullable = false)
    private String name;
    //@Temporal 생략 가능
    private LocalDate localDate;

    public Member() {
    }

    public Member(String email, String password, String name) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.localDate = LocalDate.now();
    }
}
