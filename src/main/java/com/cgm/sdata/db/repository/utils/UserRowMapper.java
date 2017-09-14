package com.cgm.sdata.db.repository.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.cgm.sdata.domain.User;
@SuppressWarnings("rawtypes")
public class UserRowMapper implements RowMapper {

    @Override
    public User mapRow(ResultSet rs, int line) throws SQLException {
        UserResultSetExtractor extractor = new UserResultSetExtractor();
        return extractor.extractData(rs);
    }
}
