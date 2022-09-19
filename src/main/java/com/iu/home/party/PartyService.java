package com.iu.home.party;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartyService {
	
	@Autowired
	private PartyDAO partyDAO;

}
