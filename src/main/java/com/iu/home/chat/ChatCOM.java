package com.iu.home.chat;

import org.springframework.stereotype.Component;

@Component
public class ChatCOM {
	
	public String getName(ChatDTO chatDTO)throws Exception{
		return chatDTO.getName();
	}

}
