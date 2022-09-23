package com.iu.home.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/menu/*")
public class MenuController {
	
	@Autowired
	 private MenuService menuService;
	
	@GetMapping(value = "list")
	public String getList(Model model)throws Exception{
		List<MenuDTO> ar = menuService.getList();
		model.addAttribute("list", ar);
		return "kdy/menu/list";
	}
	@GetMapping
	public String setAdd()throws Exception{
		return "kdy/menu/add";
	}
	@PostMapping
	public ModelAndView setAdd(MenuDTO menuDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = menuService.setAdd(menuDTO);
		
		mv.addObject("result", result);
		mv.setViewName("redirect:./listHTML");
		return mv;
	}
	
	

}
