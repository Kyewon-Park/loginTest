package as.aspS.controller;

import as.aspS.domain.Reservation;
import as.aspS.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReservationController {
    @Autowired
    ReservationService reservationService;

    @PostMapping("/reservation")
    public Long Reserve(@RequestBody Reservation reservation){
        return reservationService.save(reservation);
    }
}
