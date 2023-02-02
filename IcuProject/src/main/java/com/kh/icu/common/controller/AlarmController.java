package com.kh.icu.common.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.icu.common.model.service.AlarmService;
import com.kh.icu.common.model.vo.Alarm;
import com.kh.icu.party.model.vo.PartyJoin;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("alarm")
	@ResponseBody
	public String alram(int memNo, HttpSession session) {
		
		List<Alarm> alarmList = alarmService.selectAlarmList(memNo);
		session.setAttribute("alarmList", alarmList);
		
		// 1. 모델로 alarmList
		
		return "redirect:";
	}
	
}
