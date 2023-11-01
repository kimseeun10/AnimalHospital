package com.vet.main.reservation.treatment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.vet.main.customer.CustomerVO;
import com.vet.main.emp.EmpVO;

@Service
public class TreatmentService {
	
	@Autowired
	private TreatmentDAO treatmentDAO; 
	
//	public List<Map<String,Object>> getScheduleList() throws Exception{
//		return treatmentDAO.getScheduleList();
//	};
	
	public List<TreatmentVO> getScheduleList() throws Exception{
		return treatmentDAO.getScheduleList();
	};
	
	public int setTreatmentAdd(TreatmentVO treatmentVO) throws Exception{
		return treatmentDAO.setTreatmentAdd(treatmentVO);
	}
	
	public List<CustomerVO> getCustomerList(String animalName) throws Exception{
		return treatmentDAO.getCustomerList(animalName);
	}
	
	public List<EmpVO> getEmpList() throws Exception{
		return treatmentDAO.getEmpList();
	}
	
	public TreatmentVO getDetail(TreatmentVO treatmentVO)throws Exception{
		return treatmentDAO.getDetail(treatmentVO);
	}
	
	public int setDelete(TreatmentVO treatmentVO)throws Exception{
		return treatmentDAO.setDelete(treatmentVO);
	}
	
	public int setUpdate(TreatmentVO treatmentVO)throws Exception{
		return treatmentDAO.setUpdate(treatmentVO);
	}
}
