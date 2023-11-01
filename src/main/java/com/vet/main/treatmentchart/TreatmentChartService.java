package com.vet.main.treatmentchart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TreatmentChartService {
	
	@Autowired
	private TreatmentChartDAO treatmentChartDAO;
	
	//진료차트목록
	public List<TreatmentChartVO> getList(Pager pager) throws Exception {
		Long totalCount = treatmentChartDAO.getTotal(pager);
		pager.makeNum(totalCount);
		pager.makeStartRow();
		
		return treatmentChartDAO.getList(pager);
	}
	
	//진료차트추가
	public int setAdd(TreatmentChartVO treatmentChartVO) throws Exception {
		int result = treatmentChartDAO.setAdd(treatmentChartVO);
		
		return result;
	}

}
