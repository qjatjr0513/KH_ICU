package com.kh.icu.common.sms.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Controller
public class smsMessageController {

	  @RequestMapping(value = "sendMessage.do")
	  @ResponseBody
		public int sendMessage(HttpServletRequest request, String phoneNum) throws Exception {

		  String api_key = "NCSFBFI10CA2CJBD";
		  String api_secret = "PM4NT0AX4AUTDTCPP3ZU7LAC0RSV7CGZ";
		  Message coolsms = new Message(api_key, api_secret);

		  int authNum = randomRange(100000, 999999);
		  

		  HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", phoneNum);
			params.put("from", "010-6274-7684");
			params.put("type", "SMS");
			params.put("text", "[ICU] 인증번호 [" + authNum + "] 를 입력하세요.");
			params.put("app_version", "test app 1.2"); // application name and version

			
		  try {
		  JSONObject result = coolsms.send(params); // 보내기&전송결과받기

	    } catch (CoolsmsException e) {
	    }

		  return authNum;
		}
	  
	  
	// 인증번호 범위 지정
	  public static int randomRange(int n1, int n2) {
	    return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	  }
}
