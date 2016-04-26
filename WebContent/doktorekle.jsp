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
		<link href="css/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapp.min.js"></script>
	</head>
	<body>
	<script>
function ekle(){
			 if (document.forum.unvan.value=="" ) alert("Doktor ünvanını giriniz!");
			 else if (document.forum.ad.value=="" ) alert("Doktor adını giriniz");
       		 else if (document.forum.soyad.value=="" ) alert("Doktor soyadını giriniz!");
            
//              else if (document.forum.bolum.value=="" ) alert("Doktor bölümünü giriniz!");
             else  document.kayitol.submit()  ;
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
    <form action="doktorekle" method="post" name="forum" class="form-horizontal" accept-charset="UTF-8" onsubmit="return ekle()"> 
            <h3><b><center>Doktor Ekle</center></b></h3><hr class="col-sm-offset-2">
			<div class="form-group">
			<label class="col-sm-4 control-label">Ünvan :</label>
			<div class="col-sm-7">
			<input type="text" name="unvan" class="form-control" placeholder="Doktor Ünvanını Giriniz">
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-4 control-label">Ad :</label>
			<div class="col-sm-7">
			<input type="text" name="ad" class="form-control" placeholder="Doktor Adını Giriniz">
			</div>
			    </div>
			<div class="form-group">
				<label class="col-sm-4 control-label">Soyad :</label>
				<div class="col-sm-7">
					<input type="text" name="soyad" class="form-control" placeholder="Doktor Soyadını Giriniz">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">Kullanıcı Adı :</label>
				<div class="col-sm-7">
					<input type="text" name="kullaniciad" class="form-control" placeholder="Kullanıcı Adını Giriniz">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">Şifre :</label>
				<div class="col-sm-7">
					<input type="text" name="sifre" class="form-control" placeholder="Şifresini Giriniz">
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-4 control-label">Bölüm :</label>
			<div class="col-sm-7">
			<%
			Class.forName(bglntiSnf);
		           Connection connn = DriverManager.getConnection(bglntiurl,"root","burak145+");
		            
		            String SELECT1 = "select ad,id from bolum";
		           PreparedStatement psmt1 = connn.prepareStatement(SELECT1);

		            
		          ResultSet rs1 = psmt1.executeQuery();
		         
		 
		            %>
			
			 <select class="form-control" name="bolum" id="select">
               <option >Bölüm Seçiniz</option>
               <% while(rs1.next()){ %>
               <option value=<%=rs1.getInt("bolum.id") %> ><%=rs1.getString("bolum.ad") %></option>
               <% } %>
             </select>  
			</div>
				</div>
			<div class="form-group">
			<div class="col-sm-offset-4 col-sm-7">
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