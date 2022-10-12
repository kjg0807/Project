package com.iu.home.shop;

import java.util.List;

import javax.servlet.ServletContext;import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.member.MemberDTO;
import com.iu.home.menu.MenuDTO;
import com.iu.home.reviews.ReviewsDAO;
import com.iu.home.reviews.ReviewsDTO;
import com.iu.home.reviews.ReviewsService;
import com.iu.home.util.ReviewsPager;
import com.iu.home.util.ShopPager;

@Controller
@RequestMapping(value = "/shop/*")
public class ShopController {

   @Autowired
   private ShopService shopService;
   @Autowired
   private ReviewsService reviewsService;
   
   @PostMapping("add")
   @ResponseBody
   public ModelAndView setAdd(ShopDTO shopDTO, MultipartFile[] files,HttpSession session)throws Exception{
      ModelAndView mv = new ModelAndView();   
      MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
      shopDTO.setUserID(memberDTO.getUserID());
      int result = shopService.setAdd(shopDTO, files, session.getServletContext());
      mv.addObject("result", result);
      mv.setViewName("redirect:./listHTML");      
         return mv;      
   }

   @GetMapping(value = "listHTML")
   public ModelAndView getList(ShopPager shopPager)throws Exception{
      System.out.println("getList");
      ModelAndView mv = new ModelAndView();
      List<ShopDTO> ar = shopService.getList(shopPager);
      mv.addObject("list", ar);
      mv.addObject("shopPager", shopPager);
      mv.setViewName("kdy/shop/listHTML");
      return mv;
   }
   
   @GetMapping(value = "detailHTML")
   public ModelAndView getDetail(ShopDTO shopDTO, ReviewsDTO reviewsDTO, ReviewsPager reviewsPager)throws Exception{
      System.out.println();
      ModelAndView mv = new ModelAndView();
      shopService.setHitUpdate(shopDTO);
      List<ReviewsDTO> ar = reviewsService.getReviewsList(reviewsPager);
      
      shopDTO = shopService.getDetail(shopDTO);
      mv.setViewName("kdy/shop/detailHTML");
      mv.addObject("detail", shopDTO);
      mv.addObject("reviewsPager", reviewsPager);
      mv.addObject("list", ar);
      return mv;
   }
   
   @GetMapping(value = "update")
   public void setUpdate(ShopDTO shopDTO, Model model)throws Exception{
      shopDTO = shopService.getDetail(shopDTO);
      model.addAttribute("detail", shopDTO);
   }
   
   @PostMapping(value = "update")
   public ModelAndView setUpdate(ShopDTO shopDTO, MultipartFile[] files, HttpSession session)throws Exception{
      ModelAndView mv = new ModelAndView();
      int result = shopService.setUpdate(shopDTO, files, session.getServletContext());
      mv.setViewName("redirect:./detailHTML?shopNum="+shopDTO.getShopNum());
      return mv;
   }
   

   @GetMapping("delete")
   public ModelAndView setDelete(ShopDTO shopDTO)throws Exception{
      ModelAndView mv = new ModelAndView();
      int result = shopService.setDelete(shopDTO);
      mv.setViewName("redirect:./listHTML");
      return mv;
   }
//   @PostMapping("delete")
//   public String setDelete(HttpSession session)throws Exception{
//	   MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//	return "redirect:./listHTML";
//	   
//   }
//   ------------------------------------------------------------------------------------------------------------------------MENU
   @GetMapping(value = "addMenuHTML")
   public ModelAndView setAddMenu(Long shopNum) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.addObject("shopNum", shopNum);
      mv.setViewName("kdy/shop/detailHTML");
      return mv;
   }
   @PostMapping(value = "addMenuHTML")
   @ResponseBody
   public ModelAndView setAddMenu(ShopDTO shopDTO) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println("postAddMenu");
      System.out.println("getShopNum" + shopDTO.getShopNum());
      int result = shopService.setAddMenu(shopDTO);
      if (result == 1) {
         System.out.println("성공");
      } else {
         System.out.println("실패");
      }
      mv.addObject("detail", shopDTO);
      mv.setViewName("redirect:./detailHTML?shopNum=" + shopDTO.getShopNum());
      return mv;
   }

   @GetMapping(value = "updateMenu")
   public ModelAndView setUpdateMenu(Long shopNum, ShopDTO shopDTO) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.addObject("detail", shopNum);
      mv.addObject("detail", shopDTO);
      mv.setViewName("kdy/shop/updateMenu");
      return mv;
   }
   @PostMapping(value = "updateMenu")
   public ModelAndView setUddateMenu(ShopDTO shopDTO) throws Exception {
      ModelAndView mv = new ModelAndView();
      int result = shopService.setUpdateMenu(shopDTO);
      mv.setViewName("redirect:./detailHTML?shopNum=" + shopDTO.getShopNum());
      return mv;
   }
   
   @GetMapping("deleteMenu")
   public ModelAndView setDeleteMenu(ShopDTO shopDTO)throws Exception{
      ModelAndView mv = new ModelAndView();
      int result = shopService.setDeleteMenu(shopDTO);
      mv.setViewName("redirect:./detailHTML?menuNum="+shopDTO.getMenuNum()+"&shopNum="+shopDTO.getShopNum());
      return mv;
   }
//   ------------------------------------------------------------------------------------------------------------------------FILE
   @PostMapping("fileDelete")
   @ResponseBody
   public int setFileDelete(ShopFileDTO shopFileDTO, HttpSession session)throws Exception{
      int result = shopService.setFileDelete(shopFileDTO, session.getServletContext());
      return result;
   }
   
   

}