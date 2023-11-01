package com.vet.main.medicine;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MedicineVO {
	
	private Long medicineNo;
	private String name;
	private Long stock;
	private Date medicineDate; 
	private Date expirationDate;
	
}
