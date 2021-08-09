package as.aspS.service;

import as.aspS.domain.Reservation;
import as.aspS.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ReservationService {
    public final ReservationRepository reservationRepository;

    @Transactional
    public Long save(Reservation reservation){
        reservationRepository.save(reservation);
        return reservation.getId();
    }

    public Reservation find(Long id){
        return reservationRepository.find(id);
    }

    public List<Reservation> findReservations(LocalDateTime ldt){
        return reservationRepository.findAll(ldt);
    }
}
