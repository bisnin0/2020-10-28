package com.bitcamp.home;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConn{
	/*
	 DBCP 설정후 테스트하는중
	 //============================DBCP 설정하고 테스트해보기.===================================
	*/
	public List<BoardVO> getAllSelect(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			dbConn(); //연결되어있는 회선중에(20개가 돌아가게설정해놨다.) 하나를 가져온다.
					
			sql = "select no, userid, subject from freeboard order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setSubject(rs.getString(3));
				list.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("레코드 선택 에러.."+e.getMessage());
		}finally {
			dbClose();
		}
		
		
		return list;
		
	}
	
	
}
