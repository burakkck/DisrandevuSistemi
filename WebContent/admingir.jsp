<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">  
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html;" >
	<title>Admin Girişi</title>
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
             if(document.form.kullanici.value=="") alert("Kullanıcı adınızı giriniz");
             else if(document.form.sifre.value=="") alert("Kullanıcı şifrenizi giriniz");
             else document.index.submit();
             return false; 
         }          
          
      </script>
	<br><br><br><br><br>
	<div class="container">
		<div class="row">
			<div class="" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>Admin Girişi</h2>
						</div>
						<div class="modal-body">
							<form action="adminkontrolservlet" name="form" method="post"  class="form-horizontal" onsubmit="return kontrol()">

								<div class="form-group">
									<label class="col-sm-3 control-label">Kullanıcı Adı :</label>
									<div class="col-sm-7">
										<input type="text" name="kullanici" class="form-control" placeholder="Kullanıcı Adınızı Giriniz">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Şifre :</label>
									<div class="col-sm-7">
										<input type="password" name="sifre" class="form-control" placeholder="şifrenizi giriniz">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-6">
										<button type="submit" class="btn btn-primary">Giriş Yap</button>
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