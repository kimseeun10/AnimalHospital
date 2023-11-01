package com.vet.main.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpVO;
import com.vet.main.file.FileVO;

@Mapper
public interface ApprovalDAO {

	// 기안작성폼에 기안자 정보 가져오기
	public EmpVO getApUser(EmpVO empVO) throws Exception;

	// 품의서 작성폼
	public int setApPoomAdd(ApprovalVO approvalVO) throws Exception;
	
	// 휴가신청서 작성폼
	public int setApDayoffAdd(ApprovalVO approvalVO) throws Exception;
	
	// 휴직신청서 작성폼
	public int setApVacationAdd(ApprovalVO approvalVO) throws Exception;
	
	// 퇴직신청서 작성폼
	public int setApRetireAdd(ApprovalVO approvalVO) throws Exception;
	
	// 지출결의서 작성폼
	public int setApExpenseAdd(ApprovalVO approvalVO) throws Exception;
	
//	public ApprovalVO getApExpenseDetail(ApprovalVO approvalVO) throws Exception;
	
	public int setExpenseAdd(ApprovalExpenseVO expenseVO) throws Exception;
	
//	public List<ApprovalExpenseVO> getExpenseDetail(ApprovalExpenseVO expenseVO) throws Exception;
	
	// 기안함 리스트
	public List<ApprovalVO> getDraftList(Pager pager) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public ApprovalVO getApDetail(ApprovalVO approvalVO) throws Exception;
	
	// file
	public int setApFileAdd(FileVO fileVO) throws Exception;
	

	
}
