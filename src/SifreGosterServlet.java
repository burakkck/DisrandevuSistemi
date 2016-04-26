

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
import javax.swing.JOptionPane;

/**
 * Servlet implementation class SifreGosterServlet
 */
@WebServlet("/SifreGosterServlet")
public class SifreGosterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SifreGosterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
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
		String tc = request.getParameter("tc");
		String annesoyad = request.getParameter("annesoyad");
		
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			
			String sorgu = "select parola from hasta where tc='"+tc+"' and annekizsoyad='"+annesoyad+"'";
			PreparedStatement psmt = conn.prepareStatement(sorgu);
			
			ResultSet rs = psmt.executeQuery();
			
		
			
			if (rs.next()) {
				
				JOptionPane.showMessageDialog(null, "parolanız : " +rs.getString("parola"));
				response.sendRedirect("girisyap.jsp");
				
			}else{
				response.sendRedirect("sifremiunuttum.jsp");
				JOptionPane.showMessageDialog(null, "Girdiğiniz Değerler Yanlış");
			}
			
		} catch (Exception e) {
			out.println(e.getMessage());
		} 
	}

}
