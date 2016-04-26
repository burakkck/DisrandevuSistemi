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
	<script>
         function ekle(){
             if(document.form.ad.value=="") alert("bölüm adı giriniz");
             else document.index.submit();
             return false; 
         }          
          
      </script>
	
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
			String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu"; %>
   <div class="col-md-8">
  <form action="bolumekle" method="post" name="form" class="form-horizontal" accept-charset="UTF-8" onsubmit="return ekle()"> 
			<h3><b><center>Bölüm ekle</center></b></h3><hr class="col-sm-offset-2">
			<div class="form-group">
			<label class="col-sm-3 control-label">Bölüm Adı :</label>
			<div class="col-sm-7">
			<input type="text" name="ad" class="form-control" placeholder="Bölüm Adını Giriniz">
			</div>
				</div>
			
			<div class="form-group">
			<div class="col-sm-offset-3 col-sm-7">
			<button style="float: right;" type="submit" class="btn btn-info">Kaydet</button>							
			</div>
				</div>	
			</form>
  
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