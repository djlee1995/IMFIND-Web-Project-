package imfind.test.member;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.spring.imfind.Repository.MemberRepository;
import com.spring.imfind.domain.Member;
import com.spring.imfind.service.MemberService;

//@RunWith(SpringRunner.class)
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class MemberInsertTest {
	
    @Autowired MemberService memberService;
    @Autowired MemberRepository memberRepository;
    @PersistenceContext EntityManager em;

	
	@Test
	public void mybatis() {
		Member vo = new Member();
		
		vo.setId("userA");
		vo.setName("LEE");
		vo.setPw("123");
		vo.setContact("010");
		vo.setEmail("naver");
		memberService.join(vo);
	}
    @Test
    public void 회원가입() throws Exception {

        //given
        Member member = new Member();
        member.setName("kim");

        //when
        String savedId = memberService.join(member);

        //then
        em.flush(); // insert쿼리 진행행
        assertEquals(member, memberRepository.findOne(savedId));
    }

}

