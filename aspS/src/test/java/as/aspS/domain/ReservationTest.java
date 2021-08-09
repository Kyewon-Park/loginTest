package as.aspS.domain;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReservationTest {
    @Test
    void test() {
        Reservation reservation = new Reservation(123L);
        System.out.println("reservation.getLdt() = " + reservation.getLdt());
    }
}