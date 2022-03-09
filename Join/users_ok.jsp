<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%	request.setCharacterEncoding("UTF-8");%> <!-- 인코딩  -->
<%@ page import="java.sql.*"%>

<html>

<head>

<title>회원가입</title>

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


String ID =request.getParameter("ID");
String PWD =request.getParameter("PWD");
String NAME=request.getParameter("NAME");
String SSNUM = request.getParameter("SSNUM");
String SSNUM_PWD = request.getParameter("SSNUM_pwd");
String EMAIL_ID=request.getParameter("email_id");
String EMAIL_DOMAIN=request.getParameter("email_domain");
String CNUMF=request.getParameter("CNUMF");
String CNUMM=request.getParameter("CNUMM");
String CNUML=request.getParameter("CNUML");
String PNUMF=request.getParameter("PNUMF");
String PNUMM=request.getParameter("PNUMM");
String PNUML=request.getParameter("PNUML");
String GENDER=request.getParameter("GENDER");
String [] HABBY=request.getParameterValues("HOBBY");
String H ="";
String INTRODUCE=request.getParameter("INTRODUCE");
  /* out.println(ID);
   out.println(PWD);
   out.println(NAME);
   out.println(SSNUM);
   out.println(SSNUM_PWD);
   
   
   
   out.println(EMAIL_ID);
   out.println(EMAIL_DOMAIN);
   
   
   out.println(CNUMF);
   out.println(CNUMM);
   out.println(CNUML);
   out.println(PNUMF);
   out.println(PNUMM);
   out.println(PNUML);
   out.println(GENDER); */
   for (int i =0; i<HABBY.length;i++){
   
   H +=HABBY[i]+" ";
   
   }
   String PN=PNUMF+"-"+PNUMM+"-"+PNUML;
   /*out.println(H);
   out.println(INTRODUCE);*/
try {

  Class.forName("com.mysql.jdbc.Driver");

  // Load JDBC Class

  conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

  // Make Connection

 
String sql = "INSERT INTO users " + 
				"SET ID = " + "'"+ID +"'"+ "," +
				"PWD = '" +  PWD + "', " + 
				"NAME = " +"'"+  NAME +"'"+ ", " +
				"SSNUM = " +"'"+ String.format("%s-%s",SSNUM,SSNUM_PWD)+"'"+ ", " +
				"EMAIL = " + "'"+String.format("%s@%s",EMAIL_ID,EMAIL_DOMAIN)+"'"+ ", " +
				"CNUM = " + "'"+String.format("%s-%s-%s",CNUMF,CNUMM,CNUML)+"'" +", " +
				"PNUM = " + "'"+PN+"'" +", " +
				"GENDER = " +"'"+ GENDER+"'"+ ", " +
				"HABBY = " +"'"+ H +"'"+ ", " +
				"INTRODUCE = " + "'"+INTRODUCE +"'"+ ";";
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