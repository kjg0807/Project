package com.iu.home.notice;

import java.util.List;

import com.iu.home.reviews.ReviewsDTO;
import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;


public interface NoticeIntDAO {
	//Notice Interface
	
	
	//Notice List
	public List<NoticeDTO> getNoticeList(ReviewsPager reviewsPager) throws Exception;
	
	//Notice Detail
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) throws Exception;
	
	//Notice Add
	public int setNoticeAdd(NoticeDTO noticeDTO) throws Exception;
	
	//Notice Update
	public int setNoticeUpdate(NoticeDTO noticeDTO) throws Exception;
	
	//Notice Delete
	public int setNoticeDelete(NoticeDTO noticeDTO) throws Exception;
	
	//Notice count
	public Long getCount(ReviewsPager reviewsPager) throws Exception;
	
	//Notice Hit
	public int setNoticeHitsUpdate(NoticeDTO noticeDTO) throws Exception;

}
