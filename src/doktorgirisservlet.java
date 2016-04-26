

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

/**
 * Servlet implementation class doktorgirisservlet
 */
@WebServlet("/doktorgirisservlet")
public class doktorgirisservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doktorgirisservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			
			String kullaniciad = "select id, ad, soyad, kullaniciad, sifre from doktor";
			PreparedStatement psmt = conn.prepareStatement(kullaniciad);
			ResultSet rs = psmt.executeQuery();
			
			String kullanici_pmt = request.getParameter("kullanici");
			String sifre_pmt = request.getParameter("sifre");
			
			while (rs.next()) {
				String kullanici = rs.getString("kullaniciad");
				String sfr = rs.getString("sifre");
				String doktorad = rs.getString("ad");
				String doktorsoyad = rs.getString("soyad");
				String doktorid = rs.getString("id");
				
				if (kullanici.equals(kullanici_pmt) && sfr.equals(sifre_pmt)) {
					HttpSession session = request.getSession();
					session.setAttribute("dorad", doktorad);
					session.setAttribute("dorsoyad", doktorsoyad);
					session.setAttribute("dorid", doktorid);
					session.setAttribute("dorkullanici", kullanici);
					
					response.sendRedirect("doktor.jsp");
				}
			}
			response.sendRedirect("doktorgiris.jsp");
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}

}
