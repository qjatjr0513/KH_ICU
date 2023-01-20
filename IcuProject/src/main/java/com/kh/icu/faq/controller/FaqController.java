package com.kh.icu.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {

	@RequestMapping("faq.fa")
	public String faq() {
		return "faq/faqListForm";
	}
}
