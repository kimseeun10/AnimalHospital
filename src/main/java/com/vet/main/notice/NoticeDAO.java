package com.vet.main.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	
	// 공지사항 리스트
	public List<NoticeVO> getNoticeList() throws Exception;

}
