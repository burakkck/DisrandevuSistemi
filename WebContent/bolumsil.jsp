<%String kullanici = (String)session.getAttribute("kullaniciad");%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">	
		<title>Admin Paneli</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapp.min.js"></script>
	</head>
	<body>
<%@ include file = "adminheader.jsp" %>
<%if(kullanici != null){ %>
<br><br><br>
<!-- Main -->
<div class="container">
  
  <!-- upper section -->
  <div class="row">
  	<div class="col-md-12">
		<div class="col-md-4">
      <!-- left -->
      <h3><i class=""></i> İşlemler</h3>
      <hr>
      
      <ul class="nav nav-stacked">
        <li><a href="doktorekle.jsp"><i ></i>  Doktor Ekle</a></li>
        <li><a href="doktorsil.jsp"><i ></i>  Doktor Sil</a></li>
        <li><a href="bolumekle.jsp"><i ></i>  Bölüm Ekle</a></li>
        <li><a href="bolumsil.jsp"><i ></i>  Bölüm Sil</a></li>
        <li><a href="hastasil.jsp"><i ></i>  Hasta Sil</a></li>

      </ul> 
      
      <hr>
      
  			</div>	
  		
  		<%
			String bglntiSnf = "com.mysql.jdbc.Driver";
			String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu"; 
			
			try{
	            
	            
		           Class.forName(bglntiSnf);
		           Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
		            
		            String SELECT = "select ad,id from bolum";
		           PreparedStatement psmt = conn.prepareStatement(SELECT);

		            
		          ResultSet rs = psmt.executeQuery();
		         
		 
		            %>
   <div class="col-md-8">
  
		<table class="table table-striped">
			<tr>
				<th><h4><label>Bölüm Adı</label></h4></th>
				<th ><h4 class="col-sm-offset-8">Sil</h4></th>
			</tr>
			
			 <% while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("bolum.ad") %></td>
				<td>
					<div class="col-sm-offset-7">
					<form action ="bolumsil" accept-charset="UTF-8">
					<input type="hidden" name="bolumid" value="<%=rs.getString("bolum.id") %>" />
					<button class="btn btn-danger" >Sil <i class="glyphicon glyphicon-trash"></i> </button>
					</form>
					 <% } %>
					</div>
				</td>	
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
</div>
  
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		<%}else{
			response.sendRedirect("admingir.jsp");
		  }%>
	</body>
</html>