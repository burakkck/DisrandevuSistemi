<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%
String bglntiSnf = "com.mysql.jdbc.Driver";
String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";

try {
String drid = (String)session.getAttribute("dorid");
Class.forName(bglntiSnf);
Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
String insert = "select id,kullaniciad,sifre  from doktor where id ='"+drid+"' ";
PreparedStatement psmtdr = conn.prepareStatement(insert);
ArrayList<String> kullanici = new ArrayList<String>();
ArrayList<String> sifre = new ArrayList<String>();
ResultSet rsdr = psmtdr.executeQuery();
while(rsdr.next()){
	kullanici.add(rsdr.getString("kullaniciad"));
	sifre.add(rsdr.getString("sifre"));
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ayarlar</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<script>
         function kontrol(){
             if(document.form.parola.value != document.form.tparola.value) alert("parolalar aynı değil");
             else if(document.form.kullanici.value=="") alert("Kullanıcı adınızı giriniz");
             else if(document.form.parola.value=="") alert("Kullanıcı şifrenizi giriniz");
             else if(document.form.tparola.value=="") alert("Kullanıcı şifrenizi tekrar giriniz");
             else document.index.submit();
             return false; 
         }    
</script>
<%@include file="doktorheader.jsp" %>
<br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Ayarlar</h2>
				<hr>

				<form action="DoktorAyarlarServlet" name="form" method="post" class="form-horizontal"
					accept-charset="UTF-8" onsubmit="return kontrol()" >

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Kullanıcı Adı </label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="kullanici"
								placeholder="Kullanıcı Adınızı Giriniz..." value="<%=kullanici.get(0)%>">
						</div>
					</div>			

					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Parola</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="parola"
								placeholder="Parolanızı Giriniz..." value="<%=sifre.get(0)%>">
						</div>
					</div>

					<div class="form-group">
						<label for="tpass" class="col-sm-2 control-label">Parola
							Tekrar</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="tparola"
								placeholder="Parolanızı Tekrar Giriniz..." value="<%=sifre.get(0)%>">
						</div>
					</div>



					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<button type="submit" class="btn btn-primary">Kaydet</button>
						</div>
					</div>



				</form>
				<br>
			</div>
		</div>
	</div>





	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

<% 
}catch (Exception e) {
	out.println(e.getMessage());
}
%>