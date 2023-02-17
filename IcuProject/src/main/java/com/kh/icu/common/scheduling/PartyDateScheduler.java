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
	

	
	@Scheduled(cron = "0 */10 * * * *")
	public void partyDateCheck() {
		List<Party> p = partyService.partyList();
		LocalDate today = LocalDate.now();
		ArrayList<Party> oneWeek = new ArrayList<Party>();
		
		for(int i=0; i < p.size(); i++) {
			LocalDate endDate = p.get(i).getEndDate().toLocalDate();
			if(endDate.isBefore(today)) {
				partyService.endParty(p.get(i).getPaNo());
			}
			else{
				Period pe = Period.between(today, endDate);
				if(pe.getDays() == 7 && p.get(i).getJoinNum() > 0) {
					oneWeek.add(p.get(i));
					for(int j=0; j < oneWeek.size(); j++) {
						int sendId = oneWeek.get(j).getPaName();
						String sendNickname = oneWeek.get(j).getPaMemNickname();
						String receiveNickname = oneWeek.get(j).getMemNickname();
						int receiveId = oneWeek.get(j).getMemNo();
						int paNo =  oneWeek.get(j).getPaNo();
						String message = "endParty,"+ sendId + ","  + sendNickname + ","  + receiveNickname + "," + receiveId + "," + paNo;
						TextMessage msg = new TextMessage(message);
						
						WebSocketSession receiveSession = Sessions.userSessions.get(receiveNickname);
						
						try {
							alramHandler.handleTextMessage(receiveSession, msg);
						} catch (Exception e) {
							e.printStackTrace();
						}					
					}					
					
				}
				
			}
		}

	}
}
