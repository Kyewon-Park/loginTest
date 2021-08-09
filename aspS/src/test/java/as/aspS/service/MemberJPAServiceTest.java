package as.aspS.service;

import as.aspS.domain.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Transactional
class MemberJPAServiceTest {
    @Autowired
    MemberJPAService memberJPAService;

    @Test
    public void 회원가입() throws Exception {
        //given
        Member member = new Member("awesfs@mavaer.com", "pass","nameex");
        //when
        Member savedMember = memberJPAService.join(member);
        //then
//        assertEquals(member, memberJPAService.findOne(savedMember.getId()).get());

    }

}