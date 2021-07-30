package as.aspS.controller;

import as.aspS.domain.Member;
import as.aspS.service.MemberJPAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Optional;

@RestController
public class MemberController {
    @Autowired
    private MemberJPAService memberJPAService;

    @PostConstruct
    public void init() {
        Member member1 = new Member("qw@qw","qw");
        Member member2 = new Member("qwe@qwe","qwe");
        Member member3 = new Member("qwer@qwer","qwer");
        memberJPAService.join(member1);
        memberJPAService.join(member2);
        memberJPAService.join(member3);
    }

    @PostMapping("/register")
    public Member Register(@RequestBody Member member) {
        return memberJPAService.join(member);
    }

    @PostMapping("/login")
    public Optional<Member> Login(@RequestBody Member member){
        return memberJPAService.findByEmailAndPassword(
                member.getEmail(), member.getPassword()
        );
    }

    @GetMapping("/members")
    public List<Member> getMembers(){
        return memberJPAService.findMembers();
    }
}