<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("UTF-8");%> <!-- 인코딩  -->
<%@ page import="java.sql.*"%>

<html>

<head>

<title>MySQL select 예제</title>

</head>

<body>

<%

 

String DB_URL = "jdbc:mysql://localhost/ezen";

// DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

 

String DB_USER = "root";

String DB_PASSWORD= "oracle";

// DB ID/PASSWORD

 

Connection conn;

Statement stmt;

ResultSet rs = null;


String EMPNO =request.getParameter("EMPNO");
String ENAME =request.getParameter("ENAME");
String JOB=request.getParameter("JOB");
String SAL=request.getParameter("SAL");
   out.println(EMPNO);
   out.println(ENAME);
   out.println(JOB );
   out.println(SAL );

try {

  Class.forName("com.mysql.jdbc.Driver");

  // Load JDBC Class

  conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

  // Make Connection

 
String sql = "INSERT INTO emp " + 
				"SET HireDate = NOW(), " + 
				"EMPNO = " +  EMPNO + ", " + 
				"ENAME = '" + ENAME + "', " + 
				"JOB = '" + JOB + "', " + 
				"SAL = " + SAL + ";";

  stmt = conn.createStatement();


stmt.executeUpdate(sql);
			
  stmt.close();

  conn.close();

 }

 catch(Exception e){

  out.print("Exception Error...");

  out.print(e.toString());

 }

 finally {

 }

%>

</body>

</html>