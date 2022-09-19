package com.iu.home.party;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartyDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.home.party.PartyDAO.";
	
	
}
