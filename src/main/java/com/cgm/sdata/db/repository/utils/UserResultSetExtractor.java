package com.cgm.sdata.db.repository.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.ResultSetExtractor;

import com.cgm.sdata.domain.User;

/**
 * 
 * @author Vlad Ungureanu
 *
 */
public class UserResultSetExtractor implements ResultSetExtractor<User> {

	@Override
	public User extractData(ResultSet rs) throws SQLException {
		User cashDrawer = new User();
		cashDrawer.setUsername(rs.getString("username"));
		return cashDrawer;
	}

}
