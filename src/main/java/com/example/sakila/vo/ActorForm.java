package com.example.sakila.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ActorForm {// 폼 양식에 맞춰 vo를 생성.
	
	private String firstName;
	private String lastName;
	private List<MultipartFile> actorFile;
	
	
	
}
