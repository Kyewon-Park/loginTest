package as.aspS.repository;

import as.aspS.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberJPARepository extends JpaRepository<Member, Long> {
    Member findByEmailAndPassword(String email, String password);
    List<Member> findByEmail(String email);
}
