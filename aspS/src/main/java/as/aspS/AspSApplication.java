package as.aspS;

import as.aspS.domain.Member;
import as.aspS.repository.MemberJPARepository;
import as.aspS.service.MemberJPAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@CrossOrigin
public class AspSApplication {
	public static void main(String[] args) {
		SpringApplication.run(AspSApplication.class, args);
	}
}
