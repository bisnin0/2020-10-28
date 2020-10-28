<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bitcamp.home.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitcamp.home.BoardDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1"/> 
<link rel="stylesheet" href="/webMVC/library/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="/webMVC/library/bootstrap.js"></script>
</head>
<body>
	<h1>DBCP(커넥션풀 : DataBase Connection Pool)</h1>
	<div>
		<ol>
		<%
			//============================DBCP 설정하고 테스트해보기.===================================
			//주의할점은 DBCP설정하고나면 서버를 새로 만들어야한다.
			//모델1으로 해본다. 모델2는 시간이 너무 걸려서
			BoardDAO dao = new BoardDAO();
			List<BoardVO> list = dao.getAllSelect();
			
			for(int i=0; i<list.size(); i++){
				BoardVO vo = list.get(i);
				//선택자 레코드 수 만큼 쭉 찍힌다.
				%>
					<li><%=vo.getNo()%>, <%=vo.getUserid()%>, <%=vo.getSubject()%></li>
				<%
			}
		%>
		</ol>
	</div>
</body>
</html>
<!-- 
DBCP 설정하기
1. Framework 준비하기
	http://commons.apache.org/에서 다운로드한다.
	
	dbcp - commons-dbcp2-2.8.0-bin.zip
	Collections - commons-collections4-4.4-bin.zip
	pool - commons-pool2-2.9.0-bin.zip
	다운로드
	
2. http://www.oracle.com/에서
	ojdbc6.jar받기 
	
	(이미받은게 있음)

3. 이클립스의 WEB-INF/lib, 톰캣/lib 둘 다에 복사
	commons-collections4-4.4.jar
	commons-dbcp2-2.8.0.jar
	commons-pool2-2.9.0.jar
	ojdbc6.jar
	
4. CLASSPATH 설정(에버노트 수업 72일차에있음)
	commons-collections4-4.4.jar
	commons-dbcp2-2.8.0.jar
	commons-pool2-2.9.0.jar
	ojdbc6.jar
	
5. 톰캣서버의 conf폴더/server.xml를 텍스트로 열고  <GlobalNamingResources> 찾기.
    <Resource
        name="jdbc/myoracle"
        auth="container"
        type="javax.sql.DataSource"
        driverClassName="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        username="scott"
        password="tiger"
        maxActive="20"
        maxIdle="10"
        maxWait="-1"
    />

        DBConnection으로 데이터베이스에 접속할때 했던 설정을 여기서 하는것.
        name에 쓰이는 속성은 이름이라 기억할수있는걸로 쓰기.변수가 되는 개념
        driverClassName은 DBconnection할때 썼던거
        url=오라클 서버주소
        maxActive=최대접속인원
        maxIdle=노는애들
        maxwait=기다리는애

6. 톰캣서버의 conf/context.xml의 <Context reloadable="true">태그에 추가
<Context reloadable="true">
    <ResourceLink
        global="jdbc/myoracle"
        name="jdbc/myoracle"
        type="oracle.jdbc.pool.OracleDataSource"/>
		
7. 이클립스의 WEB-INF/web.xml의 <web-app>태그에 추가하기. 톰캣에서 가져오면된다.
C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\ROOT\WEB-INF경로의 파일 이클립스 WEB-INF에 복사후 열기

  <resource-ref>
  	<description>Oracle Datasource example</description>
  	<res-ref-name>jdbc/myoracle</res-ref-name>
  	<res-type>javax.sql.DataSource</res-type>
  	<res-auth>Container</res-auth>
  </resource-ref>

8. 톰캣의 conf/context.xml파일을 이클립스의 META-INF에 복사후 이클립스에서 열고 server.xml에서 추가했던 내용 복사붙여넣기
    <Resource
        name="jdbc/myoracle"
        auth="container"
        type="javax.sql.DataSource"
        driverClassName="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        username="scott"
        password="tiger"
        maxActive="20"
        maxIdle="10"
        maxWait="-1"
    />

 -->