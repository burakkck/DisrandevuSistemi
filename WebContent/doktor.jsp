<%@page import="java.util.Calendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String drid = (String)session.getAttribute("dorid");
String drad = (String)session.getAttribute("dorad");
String drsoyad = (String)session.getAttribute("dorsoyad");
String drkullanici = (String)session.getAttribute("dorkullanici");
Calendar takvim = Calendar.getInstance();
int ay = takvim.get(Calendar.MONTH);
takvim.set(Calendar.MONTH, ay + 1);
String tarih = takvim.get(Calendar.DATE) + "." + takvim.get(Calendar.MONTH) +"." + takvim.get(Calendar.YEAR);
%>
<!DOCTYPE html>
<html >
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">	
		<title>Randevular</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body>
<%@ include file = "doktorheader.jsp" %>
<%if(drkullanici != null){ %>
<br><br><br>
<!-- Main -->
<div class="container">
  
  <!-- upper section -->
  <div class="row">
  	<div class="col-md-12">
	
  			
  		<%
			String bglntiSnf = "com.mysql.jdbc.Driver";
			String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu"; 
			
			try{
	            
	            
		           Class.forName(bglntiSnf);
		           Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
		            
		            String SELECT = "select hasta.ad, hasta.gun,hasta.ay,hasta.yil, hasta.soyad, hasta.tc, randevu.saat_saat from randevu inner join hasta on hasta.tc=randevu.hasta_tc where randevu.doktor_id ='"+ drid +"' and randevu.tarih='" + tarih + "' order by tarih DESC"; 
		           PreparedStatement psmt = conn.prepareStatement(SELECT);

		            
		          ResultSet rs = psmt.executeQuery();
		         
		 
		            %>
   
  
		<table class="table table-striped">
			<tr>
				<th><h4>TC</h4></th>
				<th><h4>Ad Soyad</h4></th>
				<th><h4>Doğum Tarihi</h4></th>
				<th><h4>Saat</h4></th>
				
			</tr>
			
			 <% while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("hasta.tc") %></td>
				<td><%=rs.getString("hasta.ad") +" " + rs.getString("hasta.soyad")%></td>
				<td>&nbsp&nbsp&nbsp<%=rs.getString("hasta.gun") +"." + rs.getString("hasta.ay") + "." + rs.getString("hasta.yil") %></td>
				<td><%=rs.getString("randevu.saat_saat") %></td>
				
			 <% } %>
					
				
			</tr>
			
		</table>
	
		 <%       
         
         }catch(SQLException e){
            out.println(e.getMessage());
        }catch(ClassNotFoundException e){
            out.println(e.getMessage());
        }
            
            %>
		
	</div>
</div>
</div>

<%}else{
	response.sendRedirect("doktorgiris.jsp");
  }%>
  
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>