package com.spring.imfind.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.imfind.Repository.MemberRepository;
import com.spring.imfind.domain.Member;

@Service
//스프링 트랜잭셔널 어노테이션에 쓸 기능이 더 많다
@Transactional(readOnly = true)
@Primary
public class MemberService {


	 private final MemberRepository memberRepository;
	
	 @Autowired // constructor injection. 생성 시점에 주입하므로 runtime 도중 바뀔 위험이 없다.
	 public MemberService(MemberRepository memberRepository) {
	     this.memberRepository = memberRepository;
	 } // 생성자가 1개면 @Autowired없어도 자동 주입 해준다.
		
	
	 /**
	  * 회원가입
	  * @param member
	  * @return
	  */
	 @Transactional // false가 디폴드
	 public String join(Member member) {
	     memberRepository.save(member);
	     return member.getId();
	 }
	
	
	 //@Transactional(readOnly = true)
	 public Member findOne(String memberId) {
	     return memberRepository.findOne(memberId);
	 }



}
