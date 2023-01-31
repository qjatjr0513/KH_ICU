package com.kh.icu.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class payController {
	
	@RequestMapping("payManage.pe")
	public String payManage() {
		return "pay/payManageList";
	}
}
