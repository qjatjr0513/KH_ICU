package com.kh.icu.common.model.service;

import java.util.List;

import com.kh.icu.common.model.vo.Alarm;

public interface AlarmService {
	
	public int insertBoardAlarm(Alarm a);
	
	public List<Alarm> selectAlarmList(int memNo);
}
