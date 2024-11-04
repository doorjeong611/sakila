package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	
	@Autowired StaffMapper staffMapper;
	@Autowired StoreMapper storeMapper;
	@Autowired AddressMapper addressMapper;
	
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
	
	@GetMapping("/on/staffList")
	public String staffList(@RequestParam(defaultValue="1") int currentPage
							,@RequestParam(defaultValue="3") int rowPerPage
							, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		log.debug(map.toString());
		
		List<Staff> staffList = staffMapper.selectStaffList(map);
		log.debug(staffList.toString());
		
		int count = staffMapper.selectStaffCount();
		int lastPage = count/rowPerPage;
		
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		
		// model(staffList) 
		model.addAttribute("staffList", staffList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return"on/staffList";
	}

	
	// leftMenu a태그, staff 입력 폼으로 이동
	@GetMapping("/on/addStaff")
	public String addStaff(Model model, @RequestParam(defaultValue = "") String searchAddress) {
		
		log.debug("searchAddress---> "+ searchAddress);
		
		// model(StoreList)
		List<Map<String , Object>> storeList = storeMapper.selectStoreList();
		model.addAttribute("storeList", storeList);
		
		// model(addressList) <- 검색 후 
		if(!searchAddress.equals("") && searchAddress != null) {
			List<Address> addressList = addressMapper.selectAddressListBySearchWord(searchAddress);
			model.addAttribute("addressList", addressList);
			log.debug(addressList.toString());
		}
		
		return "on/addStaff";
		
	}
	
	// staff 입력 후 Action
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) {// 커맨드 객체 생성 -> 커맨드 객체.set(request.getParameter(""))
		// 단일로 받는다면? @RequestParam( name="staffId") int staffId
		
		// insert
		log.debug(staff.toString());
		
		int row = staffMapper.insertStaff(staff);
		log.debug("row---> " + row);
		
		if(row != 1) {// 실패시 다시 입력 폼으로
			return "on/addStaff";
		}
		
		return "redirect:/on/staffList";
	}
	
	
	// staffList -> active 수정
	@GetMapping("/on/modifyStaffActive")
	public String modifyStaffActive(Staff staff) {
		
		log.debug("변경 전 active---> "+staff.getActive());
		
		if(staff.getActive().equals("T")) {
			staff.setActive("F");
		}else {
			staff.setActive("T");
		}
		
		log.debug("변경 후 active---> "+staff.getActive());
		
		int row = staffMapper.updateStaff(staff); // 어떤 컬럼값을 수정하든지 mapper메서드는 하나만 사용.
			
		return "redirect:/on/staffList";
	}
	
	
	// staffList -> role 수정
	@GetMapping("/on/modifyStaffRole")
	public String modifyStaffRole(Staff staff) {
		
		log.debug("변경 전 role---> "+staff.getRole());
		
		if(staff.getRole().equals("Staff")) {
			staff.setRole("Manager");
			
		}else {
			staff.setRole("Staff");	
		}
		int row = staffMapper.updateStaff(staff);
		
		return "redirect:/on/staffList";
	}
	
	
	
	
	
	
	
	
}
