package com.spring.imfind.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Member {

    @Id @GeneratedValue
    @Column(name = "id")
    private String id;

    private String pw;
	
	private String name;
	
	private String contact;
	
	private String email;

}
