<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="container">
	<%@ include file="../inc/top.jspf" %>
	<h1>자료실 목록</h1>
	<div></div>
	<div>
	<c:if test="${logStatus!=null || logStatus=='Y'}">
	<a href="<%=request.getContextPath()%>/data/dataWriteForm.do">자료올리기</a>
	</c:if>
	</div>
	

</div>
</body>
</html>

<!-- 
	파일 업로드(다운로드는 상관없다.)를 가능하게 하는 프레임워크
	
	http://servlets.com/에서
	왼쪽메뉴에 COS File Upload Library 클릭후
	cos-20.08.zip 다운로드하여 압축을 푼후
	
	cos.jar를 /WEB-INF/lib에 복사한다.
	









 -->