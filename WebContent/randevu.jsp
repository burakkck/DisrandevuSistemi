<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disrandevu",
	"root", "burak145+");

String sorguBolum = "select id, ad from bolum";
PreparedStatement psmt =conn.prepareStatement(sorguBolum);
ResultSet rs = psmt.executeQuery();

String id = request.getAttribute("bolumid").toString();
int bolumid = Integer.valueOf(id);
String sorguDoktor = "select ad, soyad, bolum_id from doktor where bolum_id ='" + id + "';";
PreparedStatement psmtdr = conn.prepareStatement(sorguDoktor);
ResultSet rsdr = psmtdr.executeQuery();

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="doktorservlet" method="post" accept-charset="UTF-8">
		<select name="bolum">
		
			<option>Bölüm seç</option>
				<%while(rs.next()){ %>
					
					<option><%=rs.getString("ad") %></option>
				<%} %>
		</select><br>
		
		<select>
			<option>Doktor Seç</option>
			
			<%while(rsdr.next()){ %>
				<option><%=rs.getString("ad") %> <%=rs.getString("soyad") %></option>
			<%} %>
		</select>
		<input type="submit" value="gonder">
	</form>
	<form action="doktorservlet" method="post" accept-charset="UTF-8">
		<select>
			<option>
		
		</option>
		</select>
	</form>
</body>
</html>
<%
}catch(SQLException e){
	out.println(e.getMessage());
	}catch(ClassNotFoundException e){
	out.println(e.getMessage());
	}
%>