package com.kh.icu.common.scheduling;

import java.time.LocalDate;
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

	//@Scheduled(fixedDelay = 5000)
	//@Scheduled(cron = "0 0 0/1 * * *")
	public void partyDateCheck() {
		List<Party> p = partyService.findPartyForm();
		LocalDate today = LocalDate.now();
		int result = 0;
		
		for(int i=0; i < p.size(); i++) {
			LocalDate endDate = p.get(i).getEndDate().toLocalDate();
			if(endDate.isEqual(today) || endDate.isAfter(today)) {
				
			}
		}
	}
}
