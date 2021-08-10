package as.aspS.repository;

import as.aspS.domain.Reservation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReservationRepository {
    private final EntityManager em;
    public void save(Reservation reservation){
        em.persist(reservation);
    }
    public Reservation find(Long id){
        return em.find(Reservation.class, id);
    }
    public List<Reservation> findAll(LocalDate ld){
        return em.createQuery("select r from Reservation r where r.ld = :ld", Reservation.class)
                .setParameter("ld", ld)
                .getResultList();
    }
}
