package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// /off/login.jsp
	Staff login(Staff staff);
	
	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	
	// /on/addStaff
	int insertStaff(Staff staff);
	
	// /on/staffLIst
	List<Staff> selectStaffList(Map<String, Object> map);
	
	// /on/staffLIst - 페이징
	int selectStaffCount();
	
	// /on/staffList - 해당 업데이트문 하나로 모든 컬럼을 개별수정이 가능함.
	int updateStaff(Staff staff);
	
	
	// /on/modifyStaff - staff정보 가져오기
	Staff selectStaffInfo(int staffId);
	
	
	
}
