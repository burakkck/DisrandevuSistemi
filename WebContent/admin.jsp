<%String kullanici = (String)session.getAttribute("kullaniciad");%>
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
		<link href="css/style.css" rel="stylesheet">
		
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
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
	<div class="col-sm-3">
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
  
  </div>	
  	
  	


  
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		<%}else{
			response.sendRedirect("admingir.jsp");
		  }%>
	</body>
</html>