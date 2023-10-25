package com.vet.main.medicine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MedicineService {
	
	@Autowired
	private MedicineDAO medicineDAO;
	
	//약품목록
	public List<MedicineVO> getList(Pager pager) throws Exception {
		Long totalCount = medicineDAO.getTotal(pager);
		pager.makeNum(totalCount);
		pager.makeStartRow();
		return medicineDAO.getList(pager);
	}
	
	//약품추가
	public int setAdd(MedicineVO medicineVO) throws Exception {
		int result = medicineDAO.setAdd(medicineVO);
		
		return result;
	}

}
