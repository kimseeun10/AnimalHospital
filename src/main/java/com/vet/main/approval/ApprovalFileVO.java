package com.vet.main.approval;

import com.vet.main.file.FileVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ApprovalFileVO extends FileVO {
	private Long apNo;
}
