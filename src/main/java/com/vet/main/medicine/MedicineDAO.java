package com.vet.main.medicine;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;

@Mapper
public interface MedicineDAO {
	
	public Long getTotal(Pager pager) throws Exception;

	//약품 목록
	public List<MedicineVO> getList(Pager pager) throws Exception;
	
	//약품 추가
	public int setAdd(MedicineVO medicineVO) throws Exception;
	
	//약품 상세
	public MedicineVO getDetail(MedicineVO medicineVO) throws Exception;
	
	//약품 수정
	public int setUpdate(MedicineVO medicineVO) throws Exception;
	
	//약품 삭제
	public int setDelete(MedicineVO medicineVO) throws Exception;
}
