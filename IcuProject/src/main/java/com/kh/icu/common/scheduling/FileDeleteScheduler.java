package com.kh.icu.common.scheduling;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.icu.member.model.service.MemberService;

@Component
public class FileDeleteScheduler {
	
	 private Logger logger = LoggerFactory.getLogger(FileDeleteScheduler.class);
	 
	 @Autowired 
	 private MemberService meberservice;
	 
	 @Autowired
	 private ServletContext application; // 서버폴더경로를 얻어오기
	 
	 @Scheduled(fixedDelay = 5000)
	 public void deleteFile() {
		 
		 logger.info("파일 삭제 시작");
		 
	 }
}
