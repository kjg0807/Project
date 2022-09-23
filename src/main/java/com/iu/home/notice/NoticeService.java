package com.iu.home.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	//공지사항 List를 최신순(DESC)로 조회
	public List<NoticeDTO> getNoticeList(ReviewsPager reviewsPager) throws Exception{
		Long totalCount = noticeDAO.getCount(reviewsPager);
		reviewsPager.getNum(totalCount);
		reviewsPager.getRowNum();
		
		return noticeDAO.getNoticeList(reviewsPager);
	}
	
	//공지사항 디테일
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.getNoticeDetail(noticeDTO);
	}
	
	//공지사항 추가하기 (add)
	public int setNoticeAdd(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.setNoticeAdd(noticeDTO);
	}
	
	//공지사항 수정하기 (Update)
	public int setNoticeUpdate(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.setNoticeUpdate(noticeDTO);
	}
	
	//공지사항 삭제하기 (delete)
	public int setNoticeDelete(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.setNoticeDelete(noticeDTO);
	}
}
