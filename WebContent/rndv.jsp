<%String hastatc = (String)session.getAttribute("tc"); %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disrandevu","root","burak145+");
	String sorgu = "select id, ad from bolum";
	PreparedStatement psmt = conn.prepareStatement(sorgu);
	ResultSet rsBolum = psmt.executeQuery();
	
	String sql = "select id, unvan, ad, soyad, bolum_id from doktor";
	PreparedStatement psmt2 = conn.prepareStatement(sql);
	ResultSet rsDoktor = psmt2.executeQuery();

	ArrayList<Integer> bolumid = new ArrayList<Integer>();
	ArrayList<String> bolumad = new ArrayList<String>();
	ArrayList<Integer> drid = new ArrayList<Integer>();
	ArrayList<String> doktorad = new ArrayList<String>();
	ArrayList<String> doktorsoyad = new ArrayList<String>();
	ArrayList<Integer> drblmid = new ArrayList<Integer>();
	ArrayList<String> drunvn = new ArrayList<String>();
	while(rsBolum.next()){
		bolumid.add(rsBolum.getInt("id"));
		bolumad.add(rsBolum.getString("ad"));
	}
	while(rsDoktor.next()){
		drid.add(rsDoktor.getInt("id"));
		doktorad.add(rsDoktor.getString("ad"));
		doktorsoyad.add(rsDoktor.getString("soyad"));
		drblmid.add(rsDoktor.getInt("bolum_id"));
		drunvn.add(rsDoktor.getString("unvan"));
	}
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
<title>Randevu Al</title>
</head>
<body>

<script>
         function kontrol(){
             if(document.form.doktor.value=="") alert("Lütfen doktor seçin");
             else document.index.submit();
             return false; 
         }          
          
      </script>

<%@include file ="header.jsp" %>
<%if(hastatc != null){ %>
<br><br><br>
	<div class="container">
		<br>
		<br>
		<form action="saatservlet" name="form" method="post" accept-charset="UTF-8" onsubmit="return kontrol()">
			<div class="thumbnail">

				<div class="row">

					<div class="col-md-6 ">
						<h3><i class="fa fa-plus-square"></i></i> Bölüm</h3>
						<hr>
						<ul class="nav nav-pills nav-stacked">

							<% for(int deger = 0; deger < bolumad.size(); deger++){ %>
							<li><a class="list-group-item"
								href="#<%=bolumid.get(deger) %>" data-toggle="tab"><%=bolumad.get(deger) %><i
									style="float: right" class="glyphicon glyphicon-chevron-right"></i></a></li>
							<%} %>


						</ul>
					</div>

					<div class="col-md-6">
						<h3><i class="fa fa-user-md"></i> Doktor</h3>
						<hr>
						<div class="tab-content">

							<% for (int i = 0; i < bolumad.size(); i++){%>
							<div class="tab-pane" id="<%=bolumid.get(i) %>">
								<ul class="nav nav-pills nav-stacked">

									<%for(int j = 0; j < drid.size(); j++){
										if(drblmid.get(j) == bolumid.get(i)){%>
									<li class="list-group-item"><label class="radio-inline">
											<input type="radio" name="doktor" value="<%=drunvn.get(j) + " " + doktorad.get(j) + " " + doktorsoyad.get(j)%>" />
											<%=drunvn.get(j) + " " + doktorad.get(j) + " " + doktorsoyad.get(j) %>
									</label></li>
									<%}}%>


								</ul>
							</div>
							<%} %>

						</div>

					</div>

				</div>
			</div>
			<button style="float: right;" class="btn btn-primary btn-lg" type="submit">
				İleri <i class="fa fa-arrow-right"></i>
			</button>
		</form>
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
<% 
}catch (Exception e) {
			out.println(e.getMessage());
}
%>