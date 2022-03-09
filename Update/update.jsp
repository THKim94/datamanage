<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%	request.setCharacterEncoding("UTF-8");%> <!-- ?몄퐫?? -->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
//String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ezen";
String userid = "root";
String password = "oracle";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>수정하기</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
  				$("p").click(function(){
    			$(this).hide();
  				});
			});
		</script>
        
	</head>
	<body>
		<%
		try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement=connection.createStatement();
		String id = (String)session.getAttribute("user_id");
		String sql ="select * from users where ID ='"+id+"';";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next())
		{
		%>
		<h2>수정하기</h2>
		<script src="emailcheck.js"></script>
		<form action="update_check.jsp" method="post">
			<fieldset>
			<legend> | 회원정보 | </legend>
				<label for="ID">ID :<%=resultSet.getString("ID") %> </label> 
				<br/>

				<label for="PWD">비밀번호 : </label>
				<input type="password" name="PWD" value="" placeholder="1234"><br/>

				<label for="NAME">성명 :<%=resultSet.getString("NAME") %> </label><br/>

				<label for="SSNUM">주민번호 :<%=resultSet.getString("SSNUM")%></label><br/>

				<label for="Email">이메일: </label>
					<input type="text" id="email_id" name="email_id" class="form_w200" value="" title="이메일 아이디" placeholder="이메일" maxlength="18" > @ 
					<input type="text" id="email_domain" name="email_domain" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"> 
					<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
   					 	<option value="">-선택-</option>
    					<option value="naver.com">naver.com</option>
    					<option value="gmail.com">gmail.com</option>
    					<option value="hanmail.net">hanmail.net</option>
    					<option value="hotmail.com">hotmail.com</option>
    					<option value="korea.com">korea.com</option>
    					<option value="nate.com">nate.com</option>
    					<option value="yahoo.com">yahoo.com</option>
					</select><br/>

				<label for="CNUM">전화번호 : </label>
				<input type="text" name="CNUMF" value="" size="3" maxlength="3" placeholder="000">-
				<input type="text" name="CNUMM" value="" size ="4" maxlength="4" placeholder="0000">-
				<input type="text" name="CNUML" value="" size="4" maxlength="4" placeholder="0000"><br/>

				<label for="PNUM">핸드폰: </label>
				<select name="PNUMF">
					<option value="">-선택-</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="019">019</option></select>-
				<input type="text" name="PNUMM" value="" size ="4" maxlength="4" placeholder="0000">-
				<input type="text" name="PNUML" value="" size="4" maxlength="4" placeholder="0000"><br/>

				<label for="GENDER">성별 :<%= resultSet.getString("GENDER")%> </label><br/>

				<label for="HABBY">취미 </label>
				<input type="checkbox" name="HOBBY" value="soccer" checked/ >축구
				<input type="checkbox" name="HOBBY" value="game" checked/ >게임
				<input type="checkbox" name="HOBBY" value="hiking" / >등산
				<input type="checkbox" name="HOBBY" value="fish" / >낚시
				<input type="checkbox" name="HOBBY" value="shopping" / >쇼핑<br/>

				<label for="INTRODUCE">자기소개 :</label>
				<input type="text" name="INTRODUCE" value="" placeholder="하나둘셋">
				<br/>
				<input type="submit" value="수정하기">
                <%
				}
				connection.close();
				}catch (Exception e) {
				e.printStackTrace();
				}
				
				%>
				
			</fieldset>
		</form>
	</body>
</html>