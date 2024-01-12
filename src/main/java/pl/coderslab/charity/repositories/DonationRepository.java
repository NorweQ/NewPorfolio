package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.Donation;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query(value = "SELECT SUM(quantity) FROM donation",
            nativeQuery = true)
    Integer countQuantity();
    @Query(value = "SELECT COUNT(*) FROM donation",
            nativeQuery = true)
    Integer countDonations();
}
