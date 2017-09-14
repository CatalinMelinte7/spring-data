package com.cgm.sdata.repository;

import org.springframework.stereotype.Repository;

import com.cgm.sdata.domain.Message;

@Repository
public class MessageDAO  extends AbstractDAO<Message>{

	protected MessageDAO() {
		super(Message.class);
	}
}