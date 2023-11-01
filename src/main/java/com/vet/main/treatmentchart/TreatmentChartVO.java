package com.vet.main.treatmentchart;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TreatmentChartVO {
	
	private Long chartNo;
	private String title;
	private String contents;
	private String disease;
	private Date date;
	private Long ref;
	private Long step;
	private Long depth;
	private Long customerNo;
	private Long userName;
	private Long medicineNo;
//	private Long surgeryNo;
	
}
