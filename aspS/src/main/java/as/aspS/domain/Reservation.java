package as.aspS.domain;

import lombok.Getter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
@Getter
public class Reservation {
    @Id
    @GeneratedValue
    @Column(name = "reservation_id")
    private Long id;
    private LocalDate localDate;
    private Integer hour;
    private Long memberId;

    public Reservation() {
    }

    public Reservation(LocalDate localDate, Integer hour, Long memberId) {
        this.localDate = localDate;
        this.hour = hour;
        this.memberId = memberId;
    }
}
