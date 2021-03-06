package as.aspS.service;

import as.aspS.domain.Member;
import as.aspS.repository.MemberJPARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class MemberJPAService {
    public final MemberJPARepository memberJPARepository;

    @Transactional
    public Member join(Member member){
        validateDuplicateMember(member);
        return memberJPARepository.save(member);
    }

    public boolean validateDuplicateMember(Member member) {
        List<Member> findMembers = memberJPARepository.findByEmail(member.getEmail());
        if(!findMembers.isEmpty()){
            throw new IllegalStateException("이미 존재하는 회원입니다.");
        }
        else{
            return true;
        }
    }

    public List<Member> findMembers(){
        return memberJPARepository.findAll();
    }

    public Optional<Member> findById(Long memberId){
        return memberJPARepository.findById(memberId);
    }
    public Optional<Member> findByEmailAndPassword(String email, String password){
        return memberJPARepository.findByEmailAndPassword(email,password);
    }

}
