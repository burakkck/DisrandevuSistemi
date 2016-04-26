<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">  
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html;" >
	<title>Giriş Yap</title>
	<style type="text/css">
		body {
			background-image: url(image/1.jpg);
			background-repeat: no-repeat;
		}
	</style>
</head>
<body>
<script>
         function kontrol(){
             if(document.form.tc.value=="") alert("tc numaranızı giriniz");
             else if(document.form.parola.value=="") alert("Kullanıcı şifrenizi giriniz");
             else document.index.submit();
             return false; 
         }          
          
      </script>
	<br><br><br>
	<div class="container">
		<div class="row">
		<br><br>
			<div class="" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>Hasta Girişi</h2>
						</div>
						<div class="modal-body">
							<form action="hastagiris" method="post" name="form"  class="form-horizontal" onsubmit="return kontrol()" accept-charset="UTF-8">

								<div class="form-group">
									<label class="col-sm-3 control-label">TC Kimlik No :</label>
									<div class="col-sm-7">
										<input type="text" name="tc" id="inputEmail"  class="form-control" placeholder="TC kimlik numaranızı giriniz">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Şifre :</label>
									<div class="col-sm-7">
										<input type="password" name="parola" class="form-control" id="inputPassword" placeholder="şifrenizi giriniz">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-6">
										<button type="submit" class="btn btn-primary">Giriş Yap</button>
										<a href="kayitol.jsp" class="btn btn-danger">Kayıt Ol</a><br><br>
										<a href="sifremiunuttum.jsp">Şifremi Unuttum</a>
									</div>
								</div>
									<br>
							</form>
						</div>
						
						
						
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>