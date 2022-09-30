package com.iu.home.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;

@Repository
public class NoticeDAO implements NoticeIntDAO{

	@Autowired
	private SqlSession sqlSession;
	public final String NAMESPACE = "com.iu.home.notice.NoticeDAO.";
	
	//공지사항 List
	@Override
	public List<NoticeDTO> getNoticeList(ReviewsPager reviewsPager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getNoticeList", reviewsPager);
	}

	//공지사항 detail
	@Override
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getNoticeDetail", noticeDTO);
	}

	//공지사항 Add
	@Override
	public int setNoticeAdd(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setNoticeAdd", noticeDTO);
	}

	
	//공지사항 Update
	@Override
	public int setNoticeUpdate(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setNoticeUpdate", noticeDTO);
	}
	
	//공지사항 Delete
	public int setNoticeDelete(NoticeDTO noticeDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setNoticeDelete", noticeDTO);
	}

	@Override
	public Long getCount(ReviewsPager reviewsPager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount", reviewsPager);
	}
	

}
