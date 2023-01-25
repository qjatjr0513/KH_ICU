package com.kh.icu.faq.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.icu.board.model.vo.Board;
import com.kh.icu.faq.model.service.FaqService;
import com.kh.icu.faq.model.vo.Faq;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqservice;
	@RequestMapping("faq.fq")
	public String faq() {
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
	    	  redirectAttributes.addFlashAttribute("flag","showAlert");
	         return "redirect:faqList.fq";
	      } else {
	         model.addAttribute("errorMsg", "게시글 등록 실패");
	         return "common/errorPage";
	      }
	      
	   }
	 
	
}
