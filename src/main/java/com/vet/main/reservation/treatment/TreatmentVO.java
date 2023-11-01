package com.vet.main.reservation.treatment;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TreatmentVO {

	private Long treatmentNo;
	private Date treatmentDate;
	private LocalDateTime treatmentDatet;
	private Time treatmentTime;
	private Long customerNo;
	private Long empNo;
	private String animalName;
	private String name;	
	
}
