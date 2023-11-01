package com.vet.main.approval;

import java.net.http.HttpRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	
	@GetMapping("add/{apKind}")
	public String setApAdd(@PathVariable String apKind, ApprovalVO approvalVO, Model model, EmpVO empVO) throws Exception {
		empVO = approvalService.getApUser(empVO);
		
		log.info("====== empVO : {} ======", empVO);
				
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String date = now.format(formatter);

		model.addAttribute("emp", empVO);
		model.addAttribute("date", date);
		
		log.info("================= empVO : {} ====================", empVO);
		
		if(apKind.equals("poomAdd")) {			
			return "approval/poomAdd";
		} else if (apKind.equals("expenseAdd")) {
			return "approval/expenseAdd";
		} else if (apKind.equals("dayoffAdd")) {
			return "approval/dayoffAdd";
		} else if (apKind.equals("vacationAdd")) {
			return "approval/vacationAdd";
		} else if (apKind.equals("retireAdd")) {
			return "approval/retireAdd";
		}
	
		return null;
	}
	
	
	@PostMapping("add/{apKind}")
	public String setApAdd(@PathVariable String apKind, ApprovalVO approvalVO) throws Exception {
		
		log.info("==================== Poom Insert ======================");
		log.info("====== Poom : {} ======", approvalVO);
		
		if(apKind.equals("poomAdd")) {			
			
			int result = approvalService.setApPoomAdd(approvalVO);
			
		} else if (apKind.equals("expenseAdd")) {
			
			int result = approvalService.setApExpenseAdd(approvalVO);
			
		} else if (apKind.equals("dayoffAdd")) {
			
			int result = approvalService.setApDayoffAdd(approvalVO);
			
		} else if (apKind.equals("vacationAdd")) {
			
			int result = approvalService.setApVacationAdd(approvalVO);
			
		} else if (apKind.equals("retireAdd")) {
			
			int result = approvalService.setApRetireAdd(approvalVO);
		}
			
		return "redirect:../draftList/" + approvalVO.getUsername();
	}
	

	// 작성버튼 클릭 시 나오는 양식 선택 리스트
	@GetMapping("formatList")
	public String getFormatList() throws Exception {
		return "approval/formatList";
	}
	
	// 기안함 리스트
	@GetMapping("draftList/{username}")
	public String getDraftList(@PathVariable String username, Pager pager, Model model) throws Exception {
		List<ApprovalVO> ar = approvalService.getDraftList(pager);
		username = pager.getUsername();
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		log.info("=========== getDraftList : {} ===========", ar);
		
		return "approval/draftList";
	}
	
	@GetMapping("detail")
	public String getApDetail(ApprovalVO approvalVO, Model model, ApprovalExpenseVO expenseVO) throws Exception {

		approvalVO = approvalService.getApDetail(approvalVO);
		
		log.info("=============== detail 정보 : {} ================", approvalVO);
		
		if(approvalVO.getApKind().equals("품의서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/poomDetail";			
		} else if(approvalVO.getApKind().equals("지출결의서")) {
//			List<ApprovalExpenseVO> vos = approvalService.getExpenseDetail(expenseVO);
//			model.addAttribute("vos", vos);
			model.addAttribute("approvalVO", approvalVO);
			
			log.info("==================== expenseVO : {} ========================", expenseVO);
			return "approval/expenseDetail";	
		} else if(approvalVO.getApKind().equals("휴가신청서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/dayoffDetail";	
		} else if(approvalVO.getApKind().equals("휴직신청서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/vacationDetail";	
		} else if(approvalVO.getApKind().equals("퇴직결의서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/retireDetail";	
		}
		
		return null;	
	}
	
}
