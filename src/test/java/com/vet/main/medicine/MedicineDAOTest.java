package com.vet.main.medicine;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MedicineDAOTest {
	
	@Autowired
	private MedicineDAO medicineDAO;

	@Test
	void setAdd() throws Exception {
		for(int i=0; i<30; i++) {
			MedicineVO medicineVO = new MedicineVO();
			medicineVO.setName("medicine"+i);
			medicineVO.setStock(20L);
			int result = medicineDAO.setAdd(medicineVO);
			if(i%10 == 0) {
				Thread.sleep(500);
		}
	}
		System.out.print("Finish");
	}
}
