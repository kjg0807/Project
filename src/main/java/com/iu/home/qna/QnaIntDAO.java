package com.iu.home.qna;

import java.util.List;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;

public interface QnaIntDAO {
	//qna Interface
	
	public List<QnaDTO> getQnaList(ReviewsPager reviewsPager) throws Exception;
	
	public QnaDTO getQnaDetail(QnaDTO qnaDTO) throws Exception;
	
	public int setQnaAdd(QnaDTO qnaDTO) throws Exception;
	
	public int setQnaUpdate(QnaDTO qnaDTO) throws Exception;
	
	public int setQnaDelete(QnaDTO qnaDTO) throws Exception;
	
	public Long getCount(ReviewsPager reviewsPager) throws Exception;
	
	public int setReply(QnaDTO qnaDTO) throws Exception;
	
	public int setReplyAdd(QnaDTO qnaDTO) throws Exception;
	
	public int setStepUpdate(QnaDTO qnaDTO) throws Exception;
	
	public int setQnaHitsUpdate(QnaDTO qnaDTO) throws Exception;
	

}
