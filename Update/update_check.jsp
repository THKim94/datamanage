<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%	request.setCharacterEncoding("UTF-8");%> <!-- 인코딩  -->
<%@ page import="java.sql.*"%>

<html>

<head>

<title>수정완료</title>

</head>

<body>

<%

 

String DB_URL = "jdbc:mysql://localhost:3306/ezen";

// DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

 

String DB_USER = "root";

String DB_PASSWORD= "oracle";

// DB ID/PASSWORD

 

Connection conn;

Statement stmt;

ResultSet rs = null;

String ID = (String)session.getAttribute("user_id");
String PWD =request.getParameter("PWD");
String EMAIL_ID=request.getParameter("email_id");
String EMAIL_DOMAIN=request.getParameter("email_domain");
String CNUMF=request.getParameter("CNUMF");
String CNUMM=request.getParameter("CNUMM");
String CNUML=request.getParameter("CNUML");
String PNUMF=request.getParameter("PNUMF");
String PNUMM=request.getParameter("PNUMM");
String PNUML=request.getParameter("PNUML");
String [] HABBY=request.getParameterValues("HOBBY");
String H ="";
String INTRODUCE=request.getParameter("INTRODUCE");
   for (int i =0; i<HABBY.length;i++){
   
   H +=HABBY[i]+" ";
   
   }
try {

  Class.forName("com.mysql.jdbc.Driver");

  // Load JDBC Class

  conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

  // Make Connection

String sql = "update users " + 
				"SET PWD = '" +PWD+"'," +
				"EMAIL = '" + String.format("%s@%s",EMAIL_ID,EMAIL_DOMAIN)+ "', " +
				"CNUM = '" + String.format("%s-%s-%s",CNUMF,CNUMM,CNUML)+"', " +
				"PNUM = '" + String.format("%s-%s-%s",PNUMF,PNUMM,PNUML)+"', " +
				"HABBY = '" + H +"', " +
				"INTRODUCE = '" + INTRODUCE + " 'where id ='"+ID+"';";
	//out.println(sql);
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