package com.iu.home.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;

@Repository
public class QnaDAO implements QnaIntDAO{

	@Autowired
	private SqlSession sqlSession;
	public final String NAMESPACE = "com.iu.home.qna.QnaDAO.";
	
	//Qna List
	@Override
	public List<QnaDTO> getQnaList(ReviewsPager reviewsPager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getQnaList", reviewsPager);
	}

	
	//Qna Detail
	@Override
	public QnaDTO getQnaDetail(QnaDTO qnaDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getQnaDetail", qnaDTO);
	}


	//Qna Add
	@Override
	public int setQnaAdd(QnaDTO qnaDTO) throws Exception {
	
		return sqlSession.insert(NAMESPACE+"setQnaAdd", qnaDTO);
	}
	
	//Qna Update
	public int setQnaUpdate(QnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setQnaUpdate", qnaDTO);
	}
	
	//Qna Delete
	public int setQnaDelete(QnaDTO qnaDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setQnaDelete", qnaDTO);
	}

	
	//Qna Count
	@Override
	public Long getCount(ReviewsPager reviewsPager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount", reviewsPager);
	}
	
	//Qna Reply
	public int setReply(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setReply", qnaDTO);
	}


	@Override
	public int setReplyAdd(QnaDTO qnaDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setReplyAdd", qnaDTO);
	}


	@Override
	public int setStepUpdate(QnaDTO qnaDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setStepUpdate", qnaDTO);
	}


	@Override
	public int setQnaHitsUpdate(QnaDTO qnaDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setQnaHitsUpdate", qnaDTO);
	}
	
	

	
	
	
	

}
