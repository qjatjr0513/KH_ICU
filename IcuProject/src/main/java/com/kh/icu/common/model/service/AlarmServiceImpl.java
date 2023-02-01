package com.kh.icu.common.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.icu.common.model.dao.AlarmDao;
import com.kh.icu.common.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private AlarmDao alarmDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertBoardAlarm(Alarm a) {
		return alarmDao.insertBoardAlarm(sqlSession, a);
	}
	
	@Override
	public List<Alarm> selectAlarmList(int memNo) {
		return alarmDao.selectAlarmList(sqlSession, memNo);
	}
}
