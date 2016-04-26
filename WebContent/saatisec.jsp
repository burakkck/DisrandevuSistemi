<%String hastatc = (String)session.getAttribute("tc"); %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%
ArrayList<String> time = new ArrayList<String>();
time = (ArrayList)request.getAttribute("time");
String [] Gunler = {"","Pazar","Pazartesi","Salı","Çarşamba","Perşembe","Cuma","Cumartesi"};
String[] Aylar = {"Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
        "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"};
Calendar takvim = Calendar.getInstance();
int bugununTarihi = takvim.get(Calendar.DATE);
takvim.set(Calendar.DATE, bugununTarihi + 1);
if(Gunler[takvim.get(Calendar.DAY_OF_WEEK)] == "Cumartesi"){
	takvim.set(Calendar.DATE, bugununTarihi + 3);
}else if(Gunler[takvim.get(Calendar.DAY_OF_WEEK)] == "Pazar"){
	takvim.set(Calendar.DATE, bugununTarihi + 2);
}
String tarih = takvim.get(Calendar.DATE) + " " + Aylar[takvim.get(Calendar.MONTH)] +" " + takvim.get(Calendar.YEAR)+" " + Gunler[takvim.get(Calendar.DAY_OF_WEEK)];
String trh = (String)request.getAttribute("tarih");
String drid = (String)request.getAttribute("drid");
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
<title>Saati Seç</title>
</head>
<body>
<%@include file="header.jsp" %>
<br><br><br>
<%if(hastatc != null){ %>
<div class="container">
		<div class="row">
		<form action="randevukayitservlet" method="post" accept-charset="UTF-8">
		<br><br>
		<div class="col-sm-offset-2 col-md-8"> 
		<div class="panel-group" id="accordion">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#section1"> <%=tarih %> <input type="hidden" name="tarih" value="<%=trh %>" >
							<input type="hidden" name="doktorid" value="<%=drid %>">
							<input type="hidden" name="doktorad" value="<%=drad %>">
							</a>
					</h4>
				</div>
				<div class="panel-collapse collapse in" id="section1">
					<div class="panel-body">
						<%for (int i = 0; i < time.size(); i++){ %>
						<li class="btn btn-default"><label class="radio-inline">
							<input type="radio" name="saat" class="btn btn-default" value="<%=time.get(i) %>"> <%=time.get(i) %>
						</label></li>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<input style="float: right;" type="submit" class="btn btn-primary" value="Randevu Al">
		</div>
		</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<%}else{
			response.sendRedirect("girisyap.jsp");
		  }%>
</body>
</html>