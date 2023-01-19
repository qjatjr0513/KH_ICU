package com.kh.icu.common;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class Utils {
	
	private static Logger logger = LoggerFactory.getLogger(Utils.class);
	
	public static String saveFile(MultipartFile upfile, String savePath) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int random = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + random + ext;
		
		
//		try {
//			upfile.transferTo(new File(savePath+changeName));
//		} catch (IllegalStateException | IOException e) {
//			logger.error("에러발생!!");
//		}
		
		return changeName;
		
	}
	
	//크로스 사이트 스크립트 공격을 방지하기 위한 메소드
	public static String XSSHandling(String content) {
		if(content != null) {
			content.replaceAll("&", "%amp;");
			content.replaceAll("<", "&lt;");
			content.replaceAll(">", "&gt;");
			content.replaceAll("\"", "&quot;");
		}
		return content;
	}
	
	// 개행문자 처리
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}
	
	// 개행문자 해제
	public static String newLineClear(String content) {
		return content.replaceAll("<br>", "\n");
	}
	
	
	
	
	
	
	
	
	
	
	
}
