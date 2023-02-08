package com.kh.icu.member.model.service;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class GoogleLoginApi extends DefaultApi20{

protected GoogleLoginApi() {}
	
	private static class InstanceHolder{
		private static final GoogleLoginApi INSTANCE = new GoogleLoginApi();
	}
	
	public static GoogleLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}
	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return "https://oauth2.googleapis.com/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return "https://accounts.google.com/o/oauth2/v2/auth";
	}

}
