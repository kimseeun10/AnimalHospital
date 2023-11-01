package com.vet.main.approval;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class ApprovalLineVO {
	private Long apNo;
	private String userName;
	private String apPerson;
	private Long apState;
	private Date apContfimeDate;
}