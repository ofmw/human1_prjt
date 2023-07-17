package com.human.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

public class DBConnectionPool {

	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	//root-context.xml에 빈으로 등록해놓은 DataSource객체를 setter메소드방식으로 의존자동주입 받음
	@Autowired
	public void setConnection(DataSource dataSource) {
		
		try {
			conn = dataSource.getConnection();			
			System.out.println("DBCP 연결 성공");
		
		}catch(Exception e) {
			System.out.println("DBCP 연결 실패");
			e.printStackTrace();
		}
		
	}

}
