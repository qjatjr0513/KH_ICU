package com.kh.icu.common.socket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

public class Sessions {
	 static Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
}
