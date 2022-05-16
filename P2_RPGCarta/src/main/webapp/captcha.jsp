<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Captcha</title>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body id="body_p3">

<%
// Variables per fer la connexió
String user = "root";
String password = "1234";
String host = "localhost";
String db = "pruebam8";
String url = "jdbc:mysql://" + host + "/" + db;
Connection conn = null;
Statement statement = null;
ResultSet rs = null;




// Valors form
String nom = request.getParameter("nom");
String passwdold = request.getParameter("passwddb1");
String passwdnew = request.getParameter("passwddb2");

String rad = request.getParameter("robot");

if ("si".equals(rad)){
	%>
	<label style="color:white; font-weight:bold; font-size:30px;">Ets un robot :C, torna a intentar-ho</label><br><br>
	<label style="color:white; font-weight:bold; font-size:30px;">TORNA ENRERE</label><br>
	<button class="btna" style="margin:20px;"><a href="chpasswd.jsp">Canvia la contrasenya</a></button><%
}

if ("no".equals(rad)){
	try {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
		
		String sql = "SELECT * FROM inici_sessio where user like "+"'"+nom+"'";

		rs = statement.executeQuery(sql);
		rs.next();
		if (rs.getString("user").equals(nom) && rs.getString("passwd").equals(passwdold)){
			int sql2 = statement.executeUpdate("UPDATE inici_sessio set passwd = "+passwdnew+" where user like "+"'"+nom+"'");
			%><label style="color:white; font-weight:bold; font-size:30px;">La contrasenya s'ha canviat correctament</label><br><%			
		} else%><label style="color:white; font-weight:bold; font-size:30px;">L'usuari o la contrasenya no son correctes</label><br><%
	} catch (SQLException error) {
		out.print("Error de Conexión : " + error.toString());
	}
}



%>
</body>
</html>