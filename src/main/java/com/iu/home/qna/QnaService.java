package com.iu.home.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;


@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	//qna List
	public List<QnaDTO> getQnaList(ReviewsPager reviewsPager) throws Exception{
		Long totalCount = qnaDAO.getCount(reviewsPager);
		reviewsPager.getNum(totalCount);
		reviewsPager.getRowNum();
		
		return qnaDAO.getQnaList(reviewsPager);
	}
	
	//qna Detail
	public QnaDTO getQnaDetail(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.getQnaDetail(qnaDTO);
	}
	
	//qna Add
	public int setQnaAdd(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setQnaAdd(qnaDTO);
	}
	
	//qna Update
	public int setQnaUpdate(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setQnaUpdate(qnaDTO);
	}
	
	//qna Delete
	public int setQnaDelete(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setQnaDelete(qnaDTO);
	}

	
	//qna Reply
	public int setReply(QnaDTO qnaDTO) throws Exception{
		
		QnaDTO qnaDTO2 = qnaDAO.getQnaDetail(qnaDTO);
		
		qnaDTO.setRef(qnaDTO2.getRef());
		qnaDTO.setStep(qnaDTO2.getStep()+1);
		qnaDTO.setDepth(qnaDTO2.getDepth()+1);
		
		qnaDAO.setStepUpdate(qnaDTO2);
		
		int result = qnaDAO.setReplyAdd(qnaDTO);
		
		return result;
	}
	
	//qna 조회수
	
	public int setQnaHitsUpdate(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setQnaHitsUpdate(qnaDTO);
	}
}
