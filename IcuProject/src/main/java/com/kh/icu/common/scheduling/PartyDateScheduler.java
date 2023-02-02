package com.kh.icu.common.scheduling;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;

@Component
public class PartyDateScheduler {
	
	@Autowired
	private PartyService partyService;
	
	
	@Autowired
	private AlramHandler alramHandler;
	

	
	@Scheduled(cron = "0 */1 * * * *")
	public void partyDateCheck() {
		List<Party> p = partyService.partyList();
		LocalDate today = LocalDate.now();
		ArrayList<Party> oneWeek = new ArrayList<Party>();
		
		System.out.println("=========파티 날짜 조회 시작=========");
		for(int i=0; i < p.size(); i++) {
			LocalDate endDate = p.get(i).getEndDate().toLocalDate();
			if(endDate.isEqual(today) || endDate.isBefore(today)) {
				partyService.endParty(p.get(i).getPaNo());
				System.out.println(p.get(i).getPaNo()+"번 파티 기한 종료");
			}
			else{
				Period pe = Period.between(today, endDate);
				System.out.println(p.get(i).getPaNo()+"번 파티 기한 : " +pe.getDays()+"일");
				if(pe.getDays() == 7) {
					oneWeek.add(p.get(i));
					
					int sendId = oneWeek.get(i).getPaName();
					String receiveNickname = oneWeek.get(i).getMemNickname();
					int receiveId = oneWeek.get(i).getMemNo();
					int paNo =  oneWeek.get(i).getPaNo();
					String message = "pay,"+ sendId + "," + receiveNickname + "," + receiveId + "," + paNo;
					System.out.println(message);
					TextMessage msg = new TextMessage(message);
				
					List<WebSocketSession> WSsessions = new ArrayList<>();
					Map<String, WebSocketSession> userSessions = new HashMap<>();
					WebSocketSession SenderSession = userSessions.get(receiveNickname);
					for(WebSocketSession s : WSsessions) {
							try {
								alramHandler.handleTextMessage(s, msg);
								s.sendMessage(msg);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						
					}
					
				}
				
			}
		}
		System.out.println("일주일 남은 파티 : " +oneWeek);
		System.out.println("=========파티 날짜 조회 끝=========");

	}
}
