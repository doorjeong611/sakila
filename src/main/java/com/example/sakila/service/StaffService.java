package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

@Service 
@Transactional // 실패하면 알아서 롤백함
public class StaffService {
	// staffMapper는 인터페이스이므로 객체생성 불가 이의 자식의 객체가 스프링 빈에 들어가있음 (다형성)
	@Autowired StaffMapper staffMapper; // private해도 됨. 하지만 편하게 사용하기 위해 default로 설정함.
	
	// loginStaff
	public Staff login(Staff paramStaff) {
		
		return staffMapper.login(paramStaff);
	}
	
	// modifyStaff : active, role
	public int modifyStaff(Staff paramStaff) {
		
		return staffMapper.updateStaff(paramStaff);
	}

	// addStaff
	public int addStaff(Staff paramStaff) {
		
		return staffMapper.insertStaff(paramStaff);
	}

	// staffList
	public List<Staff> getStaffList(Map<String, Object> paramMap){
		return staffMapper.selectStaffList(paramMap);
	}

	// 마지막 페이지 구하기
	public int getLastPage(int rowPerPage) {
		int count = staffMapper.selectStaffCount();
		int lastPage = count/rowPerPage;
		
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}


	// staffOne
	public Map<String, Object> getStaffOne(int staffId){		
		return staffMapper.selectStaffOne(staffId);
	}

	// modifyStaff -> staffInfo
	public Staff getStaffInfo(int staffId) {
		return staffMapper.selectStaffInfo(staffId);
	}







}
