<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="body_p1">

	<form method="post" action="procesar.jsp" id="form">
	<div id="upper-f">
		<label style="color:gold;">Nom: </label>
		<input type="text" name="nom" class="btns">
	</div>
		<%!public int getValue() {
		int value = 0;
		int[] daus = { 0, 0, 0, 0 };
		for (int i = 0; i < 4; i++) {
			daus[i] = (int) (Math.random() * 6 + 1);
		}
		;
		Arrays.sort(daus);

		for (int i = 1; i < daus.length; i++) {
			value = daus[i] + value;
		}
		return value;
	};

	public int modFue(int a) {
		int mod = 0;
		switch (a) {
		case 0:
		case 1:
			break;
		case 2:
			mod = -2;
			break;
		case 3:
			mod = -2;
			break;
		case 4:
			mod = +2;
			break;
		default:
			break;
		}
		;
		return mod;
	}

	public int modDes(int a) {
		int mod = 0;
		switch (a) {
		case 0:
			mod = +2;
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			mod = +2;
			break;
		case 4:
			break;
		default:
			break;
		}
		;
		return mod;
	}

	public int modCon(int a) {
		int mod = 0;
		switch (a) {
		case 0:
			mod = -2;
			break;
		case 1:
			mod = +2;
			break;
		case 2:
			mod = +2;
			break;
		case 3:
			break;
		case 4:
			break;
		default:
			break;
		}
		;
		return mod;
	}

	public int modInt(int a) {
		int mod = 0;
		switch (a) {
		case 0:
			mod = +2;
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			break;
		case 4:
			mod = -2;
			break;
		default:
			break;
		}
		;
		return mod;
	}

	public int modSab(int a) {
		int mod = 0;
		switch (a) {
		case 0:
			break;
		case 1:
			mod = +2;
			break;
		case 2:
			break;
		case 3:
			break;
		case 4:
			break;
		default:
			break;
		}
		;
		return mod;
	}

	public int modCar(int a) {
		int mod = 0;
		switch (a) {
		case 0:
			break;
		case 1:
			mod = -2;
			break;
		case 2:
			mod = +2;
			break;
		case 3:
			break;
		case 4:
			mod = -2;
			break;
		default:
			break;
		}
		;
		return mod;
	}%>



		<%
		String[] raza = { "Elfs", "Nans", "Gnom", "Mitjans", "SemiOrc", "Humans" };
		int[] imgs = { 0, 1, 2, 3, 4, 5 };
		int Raza_aleat = (int) (Math.random() * raza.length);
		%>

		<div class="tabla-carta" style="margin-left:34%; margin-bottom:50px;">
		<table border="1" class="carta">
			<caption style="color:gold; font-size:20px; font-weight:bold;">
				<%
				out.print(raza[Raza_aleat]);
				%>
			</caption>
			<tr>
				<td rowspan="9"><img width="150px"
					src="imgs/<%out.print(imgs[Raza_aleat]);%>.png"></td>
				<th><b>Carac.</b></th>
				<th><b>Valor Base</b></th>
				<th><b>Mod.</b></th>
				<th><b>Valor Final</b></th>
			</tr>
			<tr>
				<td>
					<p>FUE:</p>
				</td>
				<td>
					<%
					int fue = getValue();
					out.print(fue);
					%>
				</td>
				<td>
					<%
					int modfue = modFue(Raza_aleat);
					out.print(modfue);
					%>
				</td>
				<td>
					<%
					int fue_final = fue + modfue;
					out.print(fue_final);
					%>
				</td>
			</tr>
			<tr>
				<td>
					<p>DES:</p>
				</td>
				<td>
					<%
					int des = getValue();
					out.print(des);
					%>
				</td>
				<td>
					<%
					int moddes = modDes(Raza_aleat);
					out.print(moddes);
					%>
				</td>
				<td>
					<%
					int des_final = des + moddes;
					out.print(des_final);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>CON:</p>
				</td>
				<td>
					<%
					int con = getValue();
					out.print(con);
					%>
				</td>
				<td>
					<%
					int modcon = modCon(Raza_aleat);
					out.print(modcon);
					%>
				</td>
				<td>
					<%
					int con_final = con + modcon;
					out.print(con_final);
					int vida = (con_final) * (int) (Math.random() * 8 + 1);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>INT:</p>
				</td>
				<td>
					<%
					int inte = getValue();
					out.print(inte);
					%>
				</td>
				<td>
					<%
					int modint = modInt(Raza_aleat);
					out.print(modint);
					%>
				</td>
				<td>
					<%
					int int_final = inte + modint;
					out.print(int_final);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>SAB:</p>
				</td>
				<td>
					<%
					int sab = getValue();
					out.print(sab);
					%>
				</td>
				<td>
					<%
					int modsab = modSab(Raza_aleat);
					out.print(modsab);
					%>
				</td>
				<td>
					<%
					int sab_final = sab + modsab;
					out.print(sab_final);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>CAR:</p>
				</td>
				<td>
					<%
					int car = getValue();
					out.print(car);
					%>
				</td>
				<td>
					<%
					int modcar = modCar(Raza_aleat);
					out.print(modcar);
					%>
				</td>
				<td>
					<%
					int car_final = car + modcar;
					out.print(car_final);
					%>
				</td>

			</tr>
			<tr>
				<td>
					<p>
						P.V (<%out.print(vida);%>
						)
					</p>
				</td>
				<td colspan="3">
					<table bgcolor="red" width="<%out.print(vida * 100 / 160);%>%">
						<tr>
							<td></td>
						</tr>
					</table> <!-- 160  > 100
		     vida > X    x=vida*100/160 -->
				</td>

			</tr>
			<tr>
				<%
				int mana = ((int_final + sab_final) / 2) * (int) (Math.random() * 4 + 1);
				%>
				<td>
					<p>
						P.M (<%out.print(mana); %>
						)
					</p>
				</td>
				<td colspan="3">
					<table bgcolor="blue" width="<%out.print(mana * 100 / 80);%>%">
						<tr>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			<input type="hidden" name="race" value="<%out.print(raza[Raza_aleat]);%>"></input>
			<input type="hidden" name="picture" value="<%out.print(imgs[Raza_aleat]);%>"></input>
			<input type="hidden" name="fue" value="<%out.print(fue_final);%>"></input>
			<input type="hidden" name="des" value="<%out.print(des_final);%>"></input>
			<input type="hidden" name="con" value="<%out.print(con_final);%>"></input>
			<input type="hidden" name="int" value="<%out.print(int_final);%>"></input>
			<input type="hidden" name="sab" value="<%out.print(sab_final);%>"></input>
			<input type="hidden" name="car" value="<%out.print(car_final);%>"></input>
			<input type="hidden" name="pv" value="<%out.print(vida);%>"></input>
			<input type="hidden" name="pm" value="<%out.print(mana);%>"></input>
		</table>		
		</div><br>
		<input type="submit" name="enviar" class="btns" style="width:10%; height:35px; color:gold;"></input>
	</form>
</body>
</html>