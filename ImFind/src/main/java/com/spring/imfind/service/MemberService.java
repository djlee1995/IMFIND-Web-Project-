package com.spring.imfind.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.imfind.Repository.MemberRepository;
import com.spring.imfind.domain.Member;

@Service
//������ Ʈ����ų� ������̼ǿ� �� ����� �� ����
@Transactional(readOnly = true)
@Primary
public class MemberService {


	 private final MemberRepository memberRepository;
	
	 @Autowired // constructor injection. ���� ������ �����ϹǷ� runtime ���� �ٲ� ������ ����.
	 public MemberService(MemberRepository memberRepository) {
	     this.memberRepository = memberRepository;
	 } // �����ڰ� 1���� @Autowired��� �ڵ� ���� ���ش�.
		
	
	 /**
	  * ȸ������
	  * @param member
	  * @return
	  */
	 @Transactional // false�� ������
	 public String join(Member member) {
	     memberRepository.save(member);
	     return member.getId();
	 }
	
	
	 //@Transactional(readOnly = true)
	 public Member findOne(String memberId) {
	     return memberRepository.findOne(memberId);
	 }



}
