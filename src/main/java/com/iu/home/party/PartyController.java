package com.iu.home.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.util.Pager;

@Controller
@RequestMapping(value = "/party/*")
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	
	@GetMapping(value="list")
	public ModelAndView getPartyList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<PartyListDTO> ar = partyService.getPartyList(pager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("party/list");
		return mv;
	}
	
}
