<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 


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
             if(document.form.tc.value=="") alert("Kullanıcı adınızı giriniz");
             else if(document.form.annesoyad.value=="") alert("Kullanıcı şifrenizi giriniz");
             else document.index.submit();
             return false; 
         }    
</script>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<br><br><br>
				<h2>Şifre Sıfırla</h2>
				<hr>

				<form action="SifreGosterServlet" name="form" method="post" class="form-horizontal"
					accept-charset="UTF-8" onsubmit="return kontrol()" >

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">TC Kİmlik Numarası </label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="tc"
								placeholder="TC Kimlik Numaranızı Giriniz...">
						</div>
					</div>			

					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Anne Kızlık Oyadı</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="annesoyad"
								placeholder="Anne Kızlık Soyadınızı Giriniz...">
						</div>
					</div>

				


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<button type="submit" class="btn btn-primary">Gönder</button>
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
