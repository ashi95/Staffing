<%-- 
    Document   : login
    Created on : 15 mars 2018, 19:36:36
    Author     : LENOVO T440S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>Login</title>

<style><%@include file="/WEB-INF/login.css" %></style>
    
</head>
<body>
<div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>DCHM<span> Staffing Tool</span></div>
		</div>
		<br>
<form method="post" action="control">
    <div class="login">

<input type="text" id="username" placeholder="username" name="username" value=""
size="20" maxlength="60" />
<br >

<input type="password" id="password"
name="password" placeholder="password "value="" size="20" maxlength="20" />
<br >
<div style="color: red; text-transform: uppercase;font-size:  150%;" >${erreur}</div>
<input type="submit" value="Connexion"
class="button" />
<br >
</div>
</div>
</form>
</body>
</html>
