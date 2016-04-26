<%
String saat = (String)request.getAttribute("saat");
String drad = (String)request.getAttribute("drad");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Randevu</title>
</head>
<body>
<%@include file="header.jsp" %>
<br><br><br><br>
<div class="container">
	<div class=jumbotron>
		<h2><p>Randevu kaydınız başarıyla gerçekleştirilmiştir.</p>
		<p>Doktorunuz <b>"<%=drad %></b>" dır</p>
		<p> Randevu saatiniz <b>"<%=saat %>"</b> dur</p>
			<p>Lütfen randevu saatinizden 10 dk önce hastanede olunuz.</p>
			<p><a href="cikisyap.jsp" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-log-out"></i> Çıkış Yap</a></p>
		</h2>
	</div>
</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>