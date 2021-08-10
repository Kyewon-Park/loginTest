package as.aspS.controller;

import as.aspS.domain.Reservation;
import as.aspS.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@RestController
public class ReservationController {
    @Autowired
    ReservationService reservationService;

    @PostConstruct
    public void init(){
        LocalDate date = LocalDate.of(2021, Month.AUGUST, 9);
        Reservation reservation1 = new Reservation(date,13,32L);
        Reservation reservation2 = new Reservation(date,17,31L);
        reservationService.save(reservation1);
        reservationService.save(reservation2);
    }

    @PostMapping("/reservation")
    public Long Reserve(@RequestBody Reservation reservation){
        return reservationService.save(reservation);
    }

    @GetMapping("/reservation")
    public List<Reservation> getReservations(@RequestBody LocalDate localDate){
        return reservationService.findReservations(localDate);
    }
}
