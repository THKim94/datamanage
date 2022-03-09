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
		<title>탈퇴완료</title>
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
		String sql ="delete from users where ID ='"+id+"';";
		statement.executeUpdate(sql);
		//resultSet = statement.executeQuery(sql);
		%>
		<h2>탈퇴가 되었습니다.</h2>
                <%
				connection.close();
				}catch (Exception e) {
				e.printStackTrace();
				}
				
				%>
			</fieldset>
		</form>
        
	</body>
</html>