package com.kh.icu.pay.model.service;

import java.util.Map;

import com.kh.icu.pay.model.vo.Pay;

public interface PayService{
	public int accountOfPayment(Pay p);
	
	public int selectPayManageListCount();
	
	public Map<String, Object> selectPayManageList(int currentPage);
	
	public int remitConfirm(int payNo);

	public int selectMyPayListCount(Pay p);
	
	public Map<String, Object> selectMyPayList(int currentPage, Pay p);
}
