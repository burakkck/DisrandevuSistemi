

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/hastagiris")
public class hastagiris extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public hastagiris() {
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
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";
		String tc = request.getParameter("tc");
		String parola = request.getParameter("parola");
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			
			String sorgu = "select tc, ad, soyad, parola from hasta where tc=? and parola=? ";
			PreparedStatement psmt = conn.prepareStatement(sorgu);
			psmt.setString(1, tc);
			psmt.setString(2, parola);
			ResultSet rs = psmt.executeQuery();
			
		
			
			while (rs.next()) {
				
				String tc_db = rs.getString("tc");
				String parola_db = rs.getString("parola");
				HttpSession session = request.getSession();
				session.setAttribute("tc", tc_db);
				String ad = rs.getString("ad");
				String soyad = rs.getString("soyad");
				session.setAttribute("ad", ad);
				session.setAttribute("soyad", soyad);
			
				response.sendRedirect("rndv.jsp");
			}
			response.sendRedirect("girisyap.jsp");
		} catch (Exception e) {
			out.println(e.getMessage());
		} 
	}

}
