<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canvi de contrasenya</title>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body id="body_p3">

<%
String user = "root";
String password = "1234";
String host = "localhost";
String db = "pruebam8";
String url = "jdbc:mysql://" + host + "/" + db;
Connection conn = null;
Statement statement = null;
ResultSet rs = null;
%>
<form method="post" action="captcha.jsp" id="form">
<label style="color:white; font-weight:bold; font-size:30px;">Introdueix l'usuari i la contrasenya antiga i nova.</label><br>
<div id="upper-f">
		<label style="color:gold;">Usuari a canviar: </label>
		<input type="text" name="nom" class="btns">
		<br>
		<label style="color:gold;">Contrasenya antiga: </label>
		<input type="password" name="passwddb1" class="btns">
		<label style="color:gold;">Contrasenya nova: </label>
		<input type="password" name="passwddb2" class="btns">
		<br>
		<label style="color:gold;">Marca si ets un robot: </label>
		<input type="radio" name="robot" value="si" class="btns"> SI
		<input type="radio" name="robot" value="no" class="btns"> NO
		<input type="submit" name="enviar" class="btns" style=" height:35px; color:gold;"></input>
	</div>
</form>
</body>
</html>