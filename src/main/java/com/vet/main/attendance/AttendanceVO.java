package com.vet.main.attendance;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Setter
@Getter
@Slf4j
public class AttendanceVO {
	private Long attNo;
	private String username;
	private String attDate;
	private String attIn;
	private String attOut;
	private String attState;
	
	private String positionName;
	private String deptName;
	private String empName;
	private String state;
	
	private String hireDate;
}
