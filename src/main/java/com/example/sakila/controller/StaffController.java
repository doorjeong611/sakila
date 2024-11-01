package com.example.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	
	@Autowired StaffMapper staffMapper;
	
	// staffOne
	@GetMapping("/on/staffOne")
	public String staffOne(HttpSession session, Model model) {
		
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff", staff);
		
		log.debug(staff.toString());
		//log.debug(staff.get("storeAddress2").toString());
		
		
		return "on/staffOne";
	}
	
	
}
