package com.vet.main.commons;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Pager {
	
	// 시작 인덱스 번호
	private Long startRow;
	
	// 가져올 갯수
	private Long lastRow;
	
	// 검색할 컬럼
	private String kind;
	
	// 검색어
	private String search;
	
	
	
	public Long getStartRow() {
		if(this.startRow == null || this.startRow < 0) {
			return 0L;
		}	// startRow는 적어도 null과 0미만은 올 수 없게 되었다.
		return this.startRow;
	}
	
	public Long getLastRow() {
		if(this.lastRow == null || this.lastRow < 0) {
			return 10L;
		}
		return this.getLastRow();
	}
	
	public String getSearch() {
		if(this.search == null) {
			return "";
		}
		return this.search;
	}
}