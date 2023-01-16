package com.kh.icu.common.sms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Controller
public class smsMessageController {
	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "ACd86a0a4d8a02c40bbcbaabf0674eaa49";
	public static final String AUTH_TOKEN = "f07f5f23e5d742fe3d3ea95cf6f334eb";


	@RequestMapping("sendMessage.do")
	@ResponseBody
	public int sendMessage(String phoneNum) {
		return sendSMS(phoneNum);
	}
	
	// SMS 전송
	  public static int sendSMS (String phoneNum) {

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    
	    // 휴대폰 인증번호 생성
	    int authNum = randomRange(100000, 999999);
	    
	    
	    // 전송대상 휴대폰 번호
	    String sendTarget = phoneNum;
	    
	    // 전송 메세지
	    String authMsg = "인증번호는 [" + authNum + "] 입니다." ;
	    
	    
	    Message message = Message.creator(
	    	// to
	    	new PhoneNumber(sendTarget),
	        // from
	    	new PhoneNumber("+17707621543"), 
	        // message
	    	authMsg).create();
	    
		return authNum;
		
	  }
	  
	// 인증번호 범위 지정
	  public static int randomRange(int n1, int n2) {
	    return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	  }
}
