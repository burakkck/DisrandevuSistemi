<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="rndv.jsp" class="navbar-brand"><img style="height: 30px; width: 35px; position: 15" src="image/logo.png"> OMÜ RANDEVU SİSTEMİ</a>
		</div>
		
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
			
			</ul>
			<ul class="nav navbar-nav navbar-right">
				
					<%
					String ad = (String)session.getAttribute("dorad");
					String soyad = (String)session.getAttribute("dorsoyad");
					if(ad != null && soyad!= null){
						%>
						<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-user-md fa-lg"></i> <%=ad + " " + soyad %> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
           
           	 <li><a href="doktorayarlar.jsp"><i class="glyphicon glyphicon-cog"></i> Ayarlar</a></li>
            <li class="divider"></li>
            <li><a href="doktorcikis.jsp"><i class="glyphicon glyphicon-log-out"></i> Çıkış Yap</a></li>
          </ul>
        </li>
						<%
					}
					
					%>
				
				
			</ul>
		</div>
	</div>
</div>