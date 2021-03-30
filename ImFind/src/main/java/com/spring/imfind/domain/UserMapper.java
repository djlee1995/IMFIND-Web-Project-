package com.spring.imfind.domain;

import java.util.Optional;

import org.apache.ibatis.annotations.Select;

public interface UserMapper {
	
	public Optional<Member> findById(String id);
	
	@Select("Select * from member where id = #{id}")
	public Optional<Member> findById2(String id);

}
