package com.cgm.sdata.db.repository.contract;

import java.util.List;

import com.cgm.sdata.domain.User;

public interface UserDataStore {
	
	void storeUser(User user);
	List<User> readUser();
	
}
