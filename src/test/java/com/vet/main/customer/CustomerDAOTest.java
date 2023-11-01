package com.vet.main.customer;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CustomerDAOTest {
	
	@Autowired
	private CustomerDAO customerDAO;

	@Test
	void setAddTest() throws Exception {
		for(int i = 0; i<150; i++) {
			CustomerVO customerVO = new CustomerVO();
			customerVO.setAnimalName("animalName"+i);
			customerVO.setGender("남자");
			customerVO.setAge(2L);
			customerVO.setWeight(5L);
			customerVO.setKind("강아지");
			customerVO.setNeutering("no");
			customerVO.setName("test"+i);
			customerVO.setPhone("01099999999");
			customerVO.setAddress("서울특별시");
			int result = customerDAO.setAdd(customerVO);
			if(i%10 == 0) {
				Thread.sleep(500);
			}
		}
		System.out.print("Finish");
	}

}
