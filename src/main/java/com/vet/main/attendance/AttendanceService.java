package com.vet.main.attendance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {

	@Autowired
	private AttendanceDAO attendanceDAO;
	
	// 리스트
	public List<AttendanceVO> getAttList(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.getAttList(attendanceVO);
	}
	
	// 출근시간
	public int setAttIn(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.setAttIn(attendanceVO);
	}
	
	// 퇴근시간
	public int setAttOut(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.setAttOut(attendanceVO);
	}
	
}
