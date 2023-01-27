package com.kh.icu.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.faq.model.service.FaqService;
import com.kh.icu.faq.model.vo.Faq;
import com.kh.icu.member.model.vo.Member;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqservice;
	@RequestMapping("faq.fq")
	public String faq(Model model) {
		List<Faq> list = faqservice.selectFaqList(); 
		
		model.addAttribute("list", list);
		
		return "faq/faqForm";
	}
	
	@RequestMapping("faqList.fq")
	public String faqList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model,
            @RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap();
			
		map = faqservice.selectList(currentPage);
		
		model.addAttribute("map", map);
		
		return "faq/faqListForm";
		}
	
	   @RequestMapping("enrollForm.fq")
	   public String faqEnrollForm(Model model,
	                           @RequestParam(value="mode", required =false, defaultValue = "insert") String mode,
	                           @RequestParam(value="fno", required =false, defaultValue = "0") int fno) {
	      
	      if(mode.equals("update")) {
	         
	         Faq f = faqservice.selectFaq(fno);
	         
	         model.addAttribute("f", f);
	      }
	      
	      
	      return "faq/faqEnrollForm";
	   }
	
	@RequestMapping("insert.fq")
	   public String insertFaq(Faq f, HttpSession session, Model model,
	                        @RequestParam(value="mode", required=false, defaultValue="insert") String mode,
	                        RedirectAttributes redirectAttributes) {
	      int result =0;
	      if(mode.equals("insert")) {
	         result = faqservice.insertFaq(f);
	      }else {
	         result = faqservice.updateFaq(f);
	      }
	      
	      if(result > 0) {
	    	  redirectAttributes.addFlashAttribute("flag2","showAlert2");
	         return "redirect:faqList.fq";
	      } else {
	         model.addAttribute("errorMsg", "게시글 등록 실패");
	         return "common/errorPage";
	      }
	      
	   }
	
	@RequestMapping("detail.fq/{fno}")
	   public ModelAndView selectFaq(@PathVariable("fno") int fno,
	                           HttpSession session,
	                           ModelAndView mv
	                           ) {
	     Faq f = faqservice.selectFaq(fno);
	     
	     if(f != null) {    
	    	 
         mv.addObject("f", f);
         mv.setViewName("faq/faqDetailView");
	         
	         
	      }else {
	         // 상세조회 실패
	         mv.addObject("errorMsg", "게시글 조회 실패");
	         mv.setViewName("common/errorPage");
	      }
	      
	      return mv;
	   }
	
	@RequestMapping("delete.fq")
	   public String deleteBoard(@RequestParam(value="fno", required =false, defaultValue = "0") int fno,
	                       HttpSession session, Model model,
	                       RedirectAttributes redirectAttributes) {
	      
	      int result = faqservice.deleteFaq(fno);
	      
	      if(result > 0) {
	    	  redirectAttributes.addFlashAttribute("flag","showAlert");
	         return "redirect:faqList.fq";
	      } else {
	         model.addAttribute("errorMsg", "FAQ 삭제 실패");
	         return "common/errorPage";
	      }
	   }
	
}
