package as.aspS.service;

import as.aspS.domain.Member;
import as.aspS.repository.MemberRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Transactional
class MemberSerivceTest {
    @Autowired
    MemberSerivce memberSerivce;

    @Autowired
    MemberRepository memberRepository;

    @Test
    public void 회원가입() throws Exception {
        //given
        Member member = new Member("awesfs@mavaer.com", "asdpapsdf");
        //when
        Long savedId = memberSerivce.join(member);
        
        //then
        assertEquals(member, memberRepository.find(savedId));

    }


}