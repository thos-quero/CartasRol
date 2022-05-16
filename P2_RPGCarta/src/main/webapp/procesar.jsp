<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body id="body_p2">
	<%
	// variables per fer la connexio:
	String user = "root";
	String password = "1234";
	String host = "localhost";
	String db = "pruebam8";
	String url = "jdbc:mysql://" + host + "/" + db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;

	// recollim valors formulari:
	String userbd = request.getParameter("userbd");
	String passwdbd = request.getParameter("passwdbd");
	String nom = request.getParameter("nom");
	String race = request.getParameter("race");
	String picture = request.getParameter("picture");
	String fue = request.getParameter("fue");
	int nfue = Integer.parseInt(fue);
	String des = request.getParameter("des");
	int ndes = Integer.parseInt(des);
	String con = request.getParameter("con");
	int ncon = Integer.parseInt(con);
	String intt = request.getParameter("int");
	int nint = Integer.parseInt(intt);
	String sab = request.getParameter("sab");
	int nsab = Integer.parseInt(sab);
	String car = request.getParameter("car");
	int ncar = Integer.parseInt(car);
	String pv = request.getParameter("pv");
	int npv = Integer.parseInt(pv);
	String pm = request.getParameter("pm");
	int npm = Integer.parseInt(pm);

	try {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
		
		String sql = "SELECT * FROM inici_sessio where user like "+"'"+userbd+"'";

		rs = statement.executeQuery(sql);
		rs.next();
		if (!rs.getString("user").equals(userbd) || !rs.getString("passwd").equals(passwdbd)){
			response.sendRedirect("wrngpass.jsp");
		}

		int i = statement.executeUpdate(
		"insert into Cartas(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"
				+ nom + "','" + picture + "','" + race + "'," + nfue + "," + ndes + "," + ncon + "," + nint + ","
				+ sab + "," + car + "," + pv + "," + pm + ")");
		out.println("Data is successfully inserted!");
	} catch (SQLException error) {
		out.print("Error de Conexión : " + error.toString());
	}
	

	

	%>
	<div class="tabla-carta" style="margin-left:41%;">
	<table border="1" class="carta">
			<caption style="color:gold; font-size:20px; font-weight:bold;">
				<%
				out.print(nom);%>
				
			</caption>
			<caption style="color:gold;">
				<%
				out.print(race);
				%>
			</caption>
			<tr>
				<td rowspan="9"><img width="150px"
					src="imgs/<%out.print(picture);%>.png"></td>
				<th><b>Carac.</b></th>
				<th><b>Valor</b></th>
			</tr>
			<tr>
				<td>
					<p>FUE:</p>
				</td>
				<td>
					<%
					out.print(fue);
					%>
				</td>
			</tr>
			<tr>
				<td>
					<p>DES:</p>
				</td>
				<td>
					<%
					out.print(des);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>CON:</p>
				</td>
				<td>
					<% 
					out.print(con);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>INT:</p>
				</td>
				<td>
					<%
					out.print(intt);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>SAB:</p>
				</td>
				<td>
					<%
					out.print(sab);
					%>
				</td>
			</tr>
			<tr>
				<td>
					<p>CAR:</p>
				</td>
				<td>
					<%
					out.print(car);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>
						P.V (<%out.print(pv);%>)
						
					</p>
				</td>
				<td colspan="3">
					<table bgcolor="red" width="<%out.print(npv * 100 / 160);%>%">
						<tr>
							<td></td>
						</tr>
					</table> <!-- 160  > 100
		     vida > X    x=vida*100/160 -->
				</td>

			</tr>
			<tr>
				<td>
					<p>
						P.M (<%out.print(pm); %>)
					</p>
				</td>
				<td colspan="3">
					<table bgcolor="blue" width="<%out.print(npm * 100 / 80);%>%">
						<tr>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
	</div>
	<button class="btna">
		<a href="visual.jsp?pagina=0">Visualizar Carta</a>
	</button>