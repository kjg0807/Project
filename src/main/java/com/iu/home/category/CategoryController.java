package com.iu.home.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.shop.ShopDTO;

@Controller
@RequestMapping(value = "/category/*")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping(value = "add")
	public String setAdd()throws Exception{
		return "kdy/category/add";
	}
	@PostMapping(value = "add")
	public ModelAndView setAdd(CategoryDTO categoryDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = categoryService.setAdd(categoryDTO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping(value = "list")
	public String getList(Model model)throws Exception{
		List<CategoryDTO> ar = categoryService.getList();
		model.addAttribute("list", ar);
		return "kdy/category/list";
		}
	
//	@GetMapping(value = )
//	public ModelAndView getCategoryList(ShopDTO shopDTO)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		List<CategoryDTO> ar = categoryService.getCategoryList(shopDTO);
//		mv.addObject("categoryList", ar);
//		mv.setViewName("shop/listHTML");
//		return mv;
//		
//	}
	
	public ModelAndView setDelete(CategoryDTO categoryDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = categoryService.setDelete(categoryDTO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	public 

}
