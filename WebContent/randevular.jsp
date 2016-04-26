<%@page import="java.util.Calendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String tc = (String)session.getAttribute("tc"); %>
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
<%@ include file = "header.jsp" %>
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
		           Calendar takvim = Calendar.getInstance();
		           int bugununTarihi = takvim.get(Calendar.DATE);
		           takvim.set(Calendar.DATE, bugununTarihi + 1);
		           int ay = takvim.get(Calendar.MONTH);
		   		   takvim.set(Calendar.MONTH, ay + 1);
		           String tarih = takvim.get(Calendar.DATE) + "." + takvim.get(Calendar.MONTH) +"." + takvim.get(Calendar.YEAR);
		          
		           String SELECT = "SELECT randevu.hasta_tc,bolum.ad,doktor.unvan,doktor.ad,doktor.soyad,randevu.tarih,randevu.saat_saat FROM randevu inner join doktor on randevu.doktor_id = doktor.id inner join saat on saat.saat = randevu.saat_saat inner join bolum on doktor.bolum_id = bolum.id where randevu.hasta_tc ='"+ tc +"'";
		            String alinan = "SELECT randevu.hasta_tc,bolum.ad,randevu.doktor_id,doktor.unvan,doktor.ad,doktor.soyad,randevu.tarih,randevu.saat_saat FROM randevu inner join doktor on randevu.doktor_id = doktor.id inner join saat on saat.saat = randevu.saat_saat inner join bolum on doktor.bolum_id = bolum.id where randevu.hasta_tc ='"+ tc +"' and tarih ='" +tarih+"'";
		            PreparedStatement psmt = conn.prepareStatement(SELECT);
		            PreparedStatement psmtalinan = conn.prepareStatement(alinan);

		           ResultSet rsalinan = psmtalinan.executeQuery(); 
		           ResultSet rs = psmt.executeQuery();
		         
		 
		            %>
		<h4>Alınan Randevular</h4><hr>
  		<table class="table table-striped">
			<tr>
				<th><h4>Hasta TC</h4></th>
				<th><h4>Bolum</h4></th>
				<th><h4>Doktor</h4></th>
				<th><h4>Tarih</h4></th>
				<th><h4>Saat</h4></th>
				<th><h4>İptal</h4></th>
			</tr>
			
			 <% while(rsalinan.next()){ %>
			 <form action="randevuiptalservlet" method="post">
			<tr>
				<td><%=rsalinan.getString("randevu.hasta_tc") %></td>
				<td><%=rsalinan.getString("bolum.ad") %></td>
				<td><%=rsalinan.getString("doktor.unvan") +" " + rsalinan.getString("doktor.ad")+" "+rsalinan.getString("doktor.soyad") %></td>
				<td><%=rsalinan.getString("randevu.tarih") %></td>
				<td><%=rsalinan.getString("randevu.saat_saat") %></td>
				<input type="hidden" name="saat" class="btn btn-danger" value="<%=rsalinan.getString("randevu.saat_saat") %>">
				<input type="hidden" name="drid" class="btn btn-danger" value="<%=rsalinan.getString("randevu.doktor_id") %>">
				<td><input type="submit" name="iptal" class="btn btn-danger" value="İptal"> </td>
			</form>
			 <% } %>
					
				
			</tr>
			
		</table>
  		<h4>Geçmiş Randevular</h4><hr>
		<table class="table table-striped">
			<tr>
				<th><h4>Hasta TC</h4></th>
				<th><h4>Bolum</h4></th>
				<th><h4>Doktor</h4></th>
				<th><h4>Tarih</h4></th>
				<th><h4>Saat</h4></th>
				
			</tr>
			
			 <% while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("randevu.hasta_tc") %></td>
				<td><%=rs.getString("bolum.ad") %></td>
				<td><%=rs.getString("doktor.unvan") +" " + rs.getString("doktor.ad")+" "+rs.getString("doktor.soyad") %></td>
				<td><%=rs.getString("randevu.tarih") %></td>
				<td><%=rs.getString("randevu.saat_saat") %></td>
				
			 <% } %>
					
				
			</tr>
			
		</table>
	</form>
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
  
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>