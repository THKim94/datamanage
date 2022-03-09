<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%	request.setCharacterEncoding("UTF-8");%> <!-- ?몄퐫?? -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Add employee</title>
	</head>
	<body>

		<h2>Would you like to add a new employee?</h2>

		<form action="./insert_ok.jsp" method="post">
			<fieldset>
			<legend> | Fill in the blanks | </legend>
			<label for="name">EMPNO : </label>
				<input type="text" name="EMPNO" value="0001"><br/>


				<label for="ENAME">ENAME : </label>
				<input type="text" name="ENAME" value="name"><br/>
				<label for="eGender">Gender : </label>
				<select name="eGender">
					<option value="male">male</option>
					<option value="female">female</option>
				</select><br/>
				<label for="SAL">SAL : </label>
				<input type="SAL" name="SAL" value="6000"><br/>
				<label for="JOB">JOB : </label>
				<select name="JOB">
					<option value="CEO">CEO</option>
					<option value="director">director</option>
					<option value="manager">manager</option>
					<option value="chief">chief</option>
					<option value="staff">staff</option>
				</select><br/>
				<input type="submit" value="Register">
				
			</fieldset>
		</form>
	</body>
</html>