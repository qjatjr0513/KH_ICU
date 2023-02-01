package com.kh.icu.common.scheduling;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;

@Component
public class PartyDateScheduler {
	
	@Autowired
	private PartyService partyService;

	@Scheduled(cron = "0 */10 * * * *")
	public void partyDateCheck() {
		List<Party> p = partyService.partyList();
		LocalDate today = LocalDate.now();
		ArrayList<Integer> oneWeek = new ArrayList<Integer>();
		
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
					oneWeek.add(p.get(i).getPaNo());
				}
			}
		}
		System.out.println("일주일 남은 파티 : " +oneWeek);
		System.out.println("=========파티 날짜 조회 끝=========");
	}
}