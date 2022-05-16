<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body id="body_p3">
<header id="hvis" style="color:white;">
	<h1 class="titol">Visualitzar cartes</h1>
	<ul class="breadcrumb">
		<li><a href="index.jsp">Inici</a></li>
		<li>Visualitzar cartes</li>
	</ul>
	<br>
	<br>
	<%//  variables per fer la connexio:
	String user="root";
	String password="1234";
	String host="localhost";
	String db = "pruebam8";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	Statement num_registres=null;
	ResultSet rs = null;
	ResultSet num_reg=null;
	int inicio;
	
	//Limito la busqueda
	int TAMANO_PAGINA = 4;

	//examino la página a mostrar y el inicio del registro a mostrar
	String pag = request.getParameter("pagina");
	int pagina=Integer.parseInt(pag);
	if (pagina==0) {
	   	inicio = 0;
	    pagina=1;
	}
	else {
	    inicio = (pagina - 1) * TAMANO_PAGINA;
	}

	/**
	//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres.executeQuery("SELECT * FROM Cartas");
int num_total_registros=0;
while(num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("Nombre de registres trobats:"+num_total_registros+"<br>");
out.print("Es mostren pàgines de "+TAMANO_PAGINA+" registres cadascuna<br>");
out.print("Mostrant la pàgina "+pagina+" de "+total_paginas+"<p><br>");




//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1){
    for (int i=1;i<=total_paginas;i++){
       if (pagina == i)
          //si muestro el índice de la página actual, no coloco enlace
          out.print(pagina);
       else
          //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
          out.print(" <a href=visual.jsp?pagina="+i+">"+i+"</a> ");
    }
}
out.print("<br><br>");
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence="SELECT * from Cartas limit "+inicio+","+TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos la consulta
	while(rs.next()) {
	//mostramos los resultados obtenidos
	//out.println(rs.getString("ID_carta"));
	//String nom=request.getParameter("nom");
	
	
	String pv = rs.getString("PV_carta");
	int npv = Integer.parseInt(pv);
	String pm = rs.getString("PM_carta");
	int npm = Integer.parseInt(pm);
%>

</header>
<main id="mainvis">
		<div class="tabla-carta" >
			<table border="1" class="carta">
				<caption style="color: gold; font-size: 20px; font-weight: bold;">
					<%
				out.print(rs.getString("NOM_carta"));%>

				</caption>
				<caption style="color: gold; font-size: 18px;">
					<%out.print(rs.getString("RACE_carta")); %>
				</caption>
				<tr>
					<td rowspan="9"><img
						src="imgs/<%out.print(rs.getString("PIC_carta")); %>.png"
						width="150px"></td>
					<th><b>Carac.</b></th>
					<th><b>Valor</b></th>
				</tr>
				<tr>
					<td>
						<p>FUE:</p>
					</td>
					<td>
						<%out.print(rs.getString("FUE_carta")); %>
					</td>
				</tr>
				<tr>
					<td>
						<p>DES:</p>
					</td>
					<td>
						<%out.print(rs.getString("DES_carta")); %>
					</td>

				</tr>
				<tr>
					<td>
						<p>CON:</p>
					</td>
					<td>
						<%out.print(rs.getString("CON_carta")); %>
					</td>

				</tr>
				<tr>
					<td>
						<p>INT:</p>
					</td>
					<td>
						<%out.print(rs.getString("INT_carta")); %>
					</td>

				</tr>
				<tr>
					<td>
						<p>SAB:</p>
					</td>
					<td>
						<%out.print(rs.getString("SAB_carta")); %>
					</td>
				</tr>
				<tr>
					<td>
						<p>CAR:</p>
					</td>
					<td>
						<%out.print(rs.getString("CAR_carta")); %>
					</td>

				</tr>
				<tr>
					<td>
						<p>
							<b>P.V:</b>
							<%out.print(rs.getString("PV_carta")); %>

						</p>
					</td>
					<td colspan="3">
						<table width="<%out.print(npv * 100 / 160);%>%" bgcolor="red">
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
							<b>P.M:</b>
							<%out.print(rs.getString("PM_carta")); %>

						</p>
					</td>
					<td colspan="3">
						<table width="<%out.print(npm * 100 / 160); %>%" bgcolor="blue">
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		</main>
	<!--  	
	<br>
	<br>
	FUE:<br>
	DES:<br>
	CON:<br>
	INT:<br>
	SAB:<br>
	CAR:<br>
	PV:<br>
	<table width="<%out.print(rs.getString("PV_carta")); %>" bgcolor="red"><tr><td></td></tr></table>
	PM:<%out.print(rs.getString("PM_carta")); %><br>
	<table width="<%out.print(rs.getString("PM_carta")); %>" bgcolor="blue"><tr><td></td></tr></table>
	<br>
	
	<br>
	-->
	<%
	}
	//cerramos la conexión
	rs.close();
	} catch (SQLException error) {
	out.print("Error de Conexión : " + error.toString());
	}
	%>
</body>
</html>
