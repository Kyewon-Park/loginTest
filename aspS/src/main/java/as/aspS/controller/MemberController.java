package as.aspS.controller;

import as.aspS.domain.Member;
import as.aspS.repository.MemberJPARepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberController {
    @Autowired
    private MemberJPARepository memberJPARepository;

    @PostMapping("/register")
    public Member Register(@RequestBody Member member){
        return memberJPARepository.save(member);
    }

    @PostMapping("/login")
    public Member Login(@RequestBody Member member){
        return memberJPARepository.findByEmailAndPassword(
                member.getEmail(), member.getPassword()
        );
    }
}
