package as.aspS.repository;

import as.aspS.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface MemberJPARepository extends JpaRepository<Member, Long> {
    Optional<Member> findByEmailAndPassword(String email, String password);
    List<Member> findByEmail(String email);
}
