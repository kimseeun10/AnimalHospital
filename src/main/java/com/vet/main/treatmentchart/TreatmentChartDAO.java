package com.vet.main.treatmentchart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;

@Mapper
public interface TreatmentChartDAO {
	
	//진료차트총합
	public Long getTotal(Pager pager) throws Exception;
	
	//진료차트목록
	public List<TreatmentChartVO> getList(Pager pager) throws Exception;
	
	//진료차트추가
	public int setAdd(TreatmentChartVO treatmentChartVO) throws Exception;

}
