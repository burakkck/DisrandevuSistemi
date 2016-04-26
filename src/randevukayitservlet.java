

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.websocket.Session;

/**
 * Servlet implementation class randevukayitservlet
 */
@WebServlet("/randevukayitservlet")
public class randevukayitservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public randevukayitservlet() {
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
		HttpSession session = request.getSession();
		String saat = request.getParameter("saat");
		String tarih = request.getParameter("tarih");
		String drid = request.getParameter("doktorid");
		String drad = request.getParameter("doktorad");
		String tc = (String)session.getAttribute("tc");
		
		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disrandevu","root","burak145+");
			String sql = "insert into randevu(doktor_id, hasta_tc, tarih, saat_saat) values (?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, drid);
			psmt.setString(2, tc);
			psmt.setString(3, tarih);
			psmt.setString(4, saat);
			int rs = psmt.executeUpdate();
			
			if (rs != 0) {
				request.setAttribute("saat", saat);
				request.setAttribute("drad", drad);
				request.getRequestDispatcher("randevumesaj.jsp").forward(request, response);
				
			}else{
				
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,
					e.getErrorCode() + " " + e.getMessage());
			e.printStackTrace();
		} 
	}

}
