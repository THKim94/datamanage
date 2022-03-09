<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%	request.setCharacterEncoding("UTF-8");%> <!-- ?몄퐫?? -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원가입</title>
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
		
		<h2>회원가입</h2>
		<script src="emailcheck.js"></script>
		<form action="users_ok.jsp" method="post">
			<fieldset>
			<legend> | 회원가입 | </legend>
				<label for="ID">ID : </label> 
				<input type="text" name="ID" value=""placeholder="Dave">
                <input type="button" value ="중복확인" onclick="openIdChk()">
                <input type ="hidden" name ="idDuplication" value="idUncheck"><br/>

				<label for="PWD">비밀번호 : </label>
				<input type="password" name="PWD" value="" placeholder="1234"><br/>

				<label for="NAME">성명 : </label>
				<input type="text" name="NAME" value="" placeholder="이정재"> <br/>

				<label for="SSNUM">주민번호 : </label>
				<input type="text" name="SSNUM" value="" placeholder="111111" size="6" maxlength="6">-
				<input type="password" name="SSNUM_pwd" value="" placeholder="1111111" size ="7" maxlength="7"><br/>

				
				
				
				
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

				<label for="GENDER">성별 : </label>
					<input type="radio" name="GENDER" value="male" checked/><label for="GENDERMAIL">남자</label>
					<input type="radio" name="GENDER" value="female"/><label for="GENDERFEMAIL">여자</label>
				<br/>

				<label for="HABBY">취미 </label>
				<input type="checkbox" name="HOBBY" value="soccer" checked/ >축구
				<input type="checkbox" name="HOBBY" value="game" checked/ >게임
				<input type="checkbox" name="HOBBY" value="hiking" / >등산
				<input type="checkbox" name="HOBBY" value="fish" / >낚시
				<input type="checkbox" name="HOBBY" value="shopping" / >쇼핑<br/>

				<label for="INTRODUCE">자기소개 :</label>
				<input type="text" name="INTRODUCE" value="" placeholder="하나둘셋">
				<br/>
				<input type="submit" value="회원가입">
				
			</fieldset>
		</form>
	</body>
</html>