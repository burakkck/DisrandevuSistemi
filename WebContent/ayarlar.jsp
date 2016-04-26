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
String tc = (String)session.getAttribute("tc");
try {
Class.forName(bglntiSnf);
Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
String insert = "select * from hasta where tc = ?";
PreparedStatement psmt = conn.prepareStatement(insert);
psmt.setString(1, tc);
ResultSet rs = psmt.executeQuery();
ArrayList<String> list = new ArrayList<String>();
while(rs.next()){
list.add(rs.getString("tc"));
list.add(rs.getString("ad"));
list.add(rs.getString("soyad"));
list.add(rs.getString("cinsiyet"));
list.add(rs.getString("mail"));
list.add(rs.getString("telefon"));
list.add(rs.getString("parola"));
list.add(rs.getString("gun"));
list.add(rs.getString("ay"));
list.add(rs.getString("yil"));
list.add(rs.getString("annekizsoyad"));
}
String erkek = null;
String kiz = null;

String cinsiyet = list.get(3);
if(cinsiyet.equals("Erkek")){
	erkek = "checked";
}else{
	kiz = "checked";
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
<%@include file ="header.jsp" %>
<br><br><br>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Ayarlar</h2>
				<hr>

				<form action="AyarlarServlet" method="post" class="form-horizontal"
					accept-charset="UTF-8">

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">TC Kimlik
							No </label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="tc"
								placeholder="TC Kimlik Numaranızı Giriniz..." value="<%=list.get(0)%>" disabled>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Ad</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="isim"
								placeholder="Adınızı Giriniz..." value="<%=list.get(1)%>">
						</div>
					</div>

					<div class="form-group">
						<label for="soyad" class="col-sm-2 control-label">Soyad</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="soyad"
								placeholder="Soyadınızı Giriniz..." value="<%=list.get(2)%>">
						</div>
					</div>

					<div class="form-group">
						<label for="sebep" class="col-sm-2 control-label">Cinsiyet</label>
						<div class="col-sm-6">
							<label class="radio-inline"> <input type="radio"
								name="cinsiyet" value="Erkek" checked="<%=erkek%>"> Erkek
							</label> <label class="radio-inline"> <input type="radio"
								name="cinsiyet" value="Kadın" <%=kiz %>="<%=kiz%>"> Kadın
							</label>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Doğum
							Tarihi</label>
						<div class="col-sm-6">
							<select name="gun" id="" class=""><option
									value="<%=list.get(7) %>" selected="1"><%=list.get(7) %></option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
								</select><select name="ay"
								id="month" class=""><option value="<%=list.get(8) %>" selected="1"><%=list.get(8) %></option>
								<option value="01">Oca</option>
								<option value="02">Şub</option>
								<option value="03">Mar</option>
								<option value="04">Nis</option>
								<option value="05">May</option>
								<option value="06">Haz</option>
								<option value="07">Tem</option>
								<option value="08">Ağu</option>
								<option value="09">Eyl</option>
								<option value="10">Eki</option>
								<option value="11">Kas</option>
								<option value="12">Ara</option>
								</select><select name="yil"
								id="year" class=""><option value="<%=list.get(9) %>" selected="1"><%=list.get(9) %></option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
								<option value="2009">2009</option>
								<option value="2008">2008</option>
								<option value="2007">2007</option>
								<option value="2006">2006</option>
								<option value="2005">2005</option>
								<option value="2004">2004</option>
								<option value="2003">2003</option>
								<option value="2002">2002</option>
								<option value="2001">2001</option>
								<option value="2000">2000</option>
								<option value="1999">1999</option>
								<option value="1998">1998</option>
								<option value="1997">1997</option>
								<option value="1996">1996</option>
								<option value="1995">1995</option>
								<option value="1994">1994</option>
								<option value="1993">1993</option>
								<option value="1992">1992</option>
								<option value="1991">1991</option>
								<option value="1990">1990</option>
								<option value="1989">1989</option>
								<option value="1988">1988</option>
								<option value="1987">1987</option>
								<option value="1986">1986</option>
								<option value="1985">1985</option>
								<option value="1984">1984</option>
								<option value="1983">1983</option>
								<option value="1982">1982</option>
								<option value="1981">1981</option>
								<option value="1980">1980</option>
								<option value="1979">1979</option>
								<option value="1978">1978</option>
								<option value="1977">1977</option>
								<option value="1976">1976</option>
								<option value="1975">1975</option>
								<option value="1974">1974</option>
								<option value="1973">1973</option>
								<option value="1972">1972</option>
								<option value="1971">1971</option>
								<option value="1970">1970</option>
								<option value="1969">1969</option>
								<option value="1968">1968</option>
								<option value="1967">1967</option>
								<option value="1966">1966</option>
								<option value="1965">1965</option>
								<option value="1964">1964</option>
								<option value="1963">1963</option>
								<option value="1962">1962</option>
								<option value="1961">1961</option>
								<option value="1960">1960</option>
								<option value="1959">1959</option>
								<option value="1958">1958</option>
								<option value="1957">1957</option>
								<option value="1956">1956</option>
								<option value="1955">1955</option>
								<option value="1954">1954</option>
								<option value="1953">1953</option>
								<option value="1952">1952</option>
								<option value="1951">1951</option>
								<option value="1950">1950</option>
								<option value="1949">1949</option>
								<option value="1948">1948</option>
								<option value="1947">1947</option>
								<option value="1946">1946</option>
								<option value="1945">1945</option>
								<option value="1944">1944</option>
								<option value="1943">1943</option>
								<option value="1942">1942</option>
								<option value="1941">1941</option>
								<option value="1940">1940</option>
								<option value="1939">1939</option>
								<option value="1938">1938</option>
								<option value="1937">1937</option>
								<option value="1936">1936</option>
								<option value="1935">1935</option>
								<option value="1934">1934</option>
								<option value="1933">1933</option>
								<option value="1932">1932</option>
								<option value="1931">1931</option>
								<option value="1930">1930</option>
								<option value="1929">1929</option>
								<option value="1928">1928</option>
								<option value="1927">1927</option>
								<option value="1926">1926</option>
								<option value="1925">1925</option>
								<option value="1924">1924</option>
								<option value="1923">1923</option>
								<option value="1922">1922</option>
								<option value="1921">1921</option>
								<option value="1920">1920</option>
								<option value="1919">1919</option>
								<option value="1918">1918</option>
								<option value="1917">1917</option>
								<option value="1916">1916</option>
								<option value="1915">1915</option>
								<option value="1914">1914</option>
								<option value="1913">1913</option>
								<option value="1912">1912</option>
								<option value="1911">1911</option>
								<option value="1910">1910</option>
								<option value="1909">1909</option>
								<option value="1908">1908</option>
								<option value="1907">1907</option>
								<option value="1906">1906</option>
								<option value="1905">1905</option></select>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">E-Mail</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="mail"
								placeholder="Mail Adresinizi Giriniz" value="<%=list.get(4)%>">
						</div>
					</div>

					<div class="form-group">
						<label for="number" class="col-sm-2 control-label">Telefon</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="telefon"
								placeholder="Telefon Numaranızı Giriniz..." value="<%=list.get(5)%>">
						</div>
					</div>
					
					<div class="form-group">
						<label for="number" class="col-sm-2 control-label">Anne Kızlık Soyadı</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="annesoyad"
								placeholder="Şifre Sıfırlama İçin Gerekli...!" value="<%=list.get(10)%>">
						</div>
					</div>

					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Parola</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="parola"
								placeholder="Parolanızı Giriniz..." value="<%=list.get(6)%>">
						</div>
					</div>

					<div class="form-group">
						<label for="tpass" class="col-sm-2 control-label">Parola
							Tekrar</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="tparola"
								placeholder="Parolanızı Tekrar Giriniz..." value="<%=list.get(6)%>">
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