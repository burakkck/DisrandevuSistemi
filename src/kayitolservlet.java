

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/kayitolservlet")
public class kayitolservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public kayitolservlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String tc = request.getParameter("tc");
		String ad = request.getParameter("isim");
		String soyad = request.getParameter("soyad");
		String cinsiyet = request.getParameter("cinsiyet");
		String email = request.getParameter("mail");
		String telefon = request.getParameter("telefon");
		String annesoyad = request.getParameter("annesoyad");
		String parola = request.getParameter("parola");
		String gun = request.getParameter("gun");
		String ay = request.getParameter("ay");
		String yil = request.getParameter("yil");
		
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";
		//final String msj = "mesaj g�nderildi";
		
		
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			
			String insert = "insert into hasta(tc,ad,soyad,cinsiyet,mail,telefon,parola,gun,ay,yil,annekizsoyad)values(?,?,?,?,?,?,?,?,?,?,?)";
			java.sql.PreparedStatement psmt = conn.prepareStatement(insert);
			psmt.setString(1, tc);
			psmt.setString(2, ad);
			psmt.setString(3, soyad);
			psmt.setString(4, cinsiyet);
			psmt.setString(5, email);
			psmt.setString(6, telefon);
			psmt.setString(7, parola);
			psmt.setString(8, gun);
			psmt.setString(9, ay);
			psmt.setString(10, yil);
			psmt.setString(11, annesoyad);
			
			int insertQuery = psmt.executeUpdate();
			
			
			
			if(insertQuery != 0){
			
				
				
				response.sendRedirect("girisyap.jsp");
				
			}else{
				response.sendRedirect("kayitol.jsp");
			}
		} catch (Exception e) {
			//response.sendRedirect("yedek.jsp");
			out.println(e.getMessage());
		}
	}

}
