package com.kh.icu.common.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.common.model.vo.Alarm;

@Repository
public class AlarmDao {
	
	public int insertBoardAlarm(SqlSession sqlSession, Alarm a) {
		return sqlSession.insert("alarmMapper.insertBoardAlarm", a);
	}
	
	public List<Alarm> selectAlarmList(SqlSession sqlSession, int memNo) {
		return sqlSession.selectList("alarmMapper.selectAlarmList", memNo);
	}
}
