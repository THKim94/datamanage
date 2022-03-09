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
		<title>회원 정보</title>
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
		<h2>회원 정보</h2>
		<script src="emailcheck.js"></script>
        
		<form method="post">
			<fieldset>
			<legend> | 회원 정보 | </legend>
				<label for="ID">ID : </label> 
				<input type="text" name="ID" value=<%=resultSet.getString("ID") %>><br/>

				<label for="PWD">비밀번호 : </label>
				<input type="text" name="PWD" value="<%=resultSet.getString("PWD") %>" ><br/>

				<label for="NAME">성명 : </label>
				<input type="text" name="NAME" value="<%=resultSet.getString("NAME") %>" > <br/>

				<label for="SSNUM">주민번호 : </label>
				<input type="text" name="SSNUM" value="<%=resultSet.getString("SSNUM").substring(0,6) %>" size="6" maxlength="6">-
				<input type="text" name="SSNUM_pwd" value="<%=resultSet.getString("SSNUM").substring(7) %>" placeholder= size ="7" maxlength="7"><br/>

				
				
				
				<% String e = resultSet.getString("EMAIL");
				   String email[]=e.split("@");%>
				   
				<label for="Email">이메일: </label>
					<input type="text" id="email_id" name="email_id" class="form_w200" value="<%=email[0] %>" title="이메일 아이디"  maxlength="18" > @ 
					<input type="text" id="email_domain" name="email_domain" class="form_w200" value="<%=email[1] %>" title="이메일 도메인"  maxlength="18"> <br/>
				<% String c = resultSet.getString("CNUM");
				   String cnum[]=c.split("-");%>
				<label for="CNUM">전화번호 : </label>
				<input type="text" name="CNUMF" value="<%=cnum[0] %>" size="3" maxlength="3" placeholder="000">-
				<input type="text" name="CNUMM" value="<%=cnum[1] %>" size ="4" maxlength="4" placeholder="0000">-
				<input type="text" name="CNUML" value="<%=cnum[2] %>" size="4" maxlength="4" placeholder="0000"><br/>
				<% String p = resultSet.getString("PNUM");
				   String pnum[]=p.split("-");%>
				<label for="PNUM">핸드폰: </label>
				<input type="text" name="CNUMF" value="<%=pnum[0] %>" size="3" maxlength="3" placeholder="000">-
				<input type="text" name="PNUMM" value="<%=pnum[1] %>" size ="4" maxlength="4" placeholder="0000">-
				<input type="text" name="PNUML" value="<%=pnum[2] %>" size="4" maxlength="4" placeholder="0000"><br/>
				<% String g = resultSet.getString("GENDER");%>
				<label for="GENDER">성별 : </label>
                	<%if (g.equals("male")){%>
					<input type="radio" name="GENDER" value="male" checked /><label for="GENDERMAIL">남자</label>
                    <%}else{%>
					<input type="radio" name="GENDER" value="female" checked/><label for="GENDERFEMAIL">여자</label>
                    <%} %>
				<br/>
                <label for="HABBY">취미 </label>
				<% String H = resultSet.getString("HABBY");
				   String[] hobbys = H.split(" ");
				   for(int i=0;i<hobbys.length;i++)
				   { %>
                	<%if (hobbys[i].equals("soccer")){%>
					<input type="checkbox" name="HOBBY" value="soccer" checked/ >축구
                	<%}else if (hobbys[i].equals("game")){%>
					<input type="checkbox" name="HOBBY" value="game" checked/ >게임
                	<%}else if (hobbys[i].equals("hiking")){%>
					<input type="checkbox" name="HOBBY" value="hiking" checked/ >등산
                	<%}else if (hobbys[i].equals("fish")){%>
					<input type="checkbox" name="HOBBY" value="fish" checked/ >낚시
                	<%}else if (hobbys[i].equals("shopping")){%>
					<input type="checkbox" name="HOBBY" value="shopping"checked / >쇼핑
                	<%}
					}%>
                <br/>

				<label for="INTRODUCE">자기소개 :</label>
				<input type="text" name="INTRODUCE" value="<%=resultSet.getString("INTRODUCE") %>" >
				<br/>
				<button type="button" name="update" value="update" onClick="location.href='../Update/update.jsp'" >수정하기</button>
                <button type="button" name="delete" value="delete" onClick="location.href='../Delete/delete.jsp'" >탈퇴하기</button>
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