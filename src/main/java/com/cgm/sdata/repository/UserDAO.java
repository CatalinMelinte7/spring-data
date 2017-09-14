package com.cgm.sdata.repository;

import org.springframework.stereotype.Repository;

import com.cgm.sdata.domain.User;


@Repository
public class UserDAO  extends AbstractDAO<User>{

	protected UserDAO() {
		super(User.class);
	}
}
