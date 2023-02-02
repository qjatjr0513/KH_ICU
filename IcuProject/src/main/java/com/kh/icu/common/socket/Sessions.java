package com.kh.icu.common.socket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

public class Sessions {
	 static Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	 
	  static List<WebSocketSession> WSsessions = new ArrayList<>(); 
		
	  static public Map<String, WebSocketSession> userSessions = new HashMap<>();
}
