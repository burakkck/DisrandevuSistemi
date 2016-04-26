

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

/**
 * Servlet implementation class AdminAyarlarServlet
 */
@WebServlet("/AdminAyarlarServlet")
public class AdminAyarlarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAyarlarServlet() {
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
		String kullanici = request.getParameter("kullanici");
		String sifre = request.getParameter("parola");
		
		
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";
				
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			HttpSession session = request.getSession();
			String kullaniciad = (String)session.getAttribute("kullaniciad");
			String update = "update admin set kullaniciad ='"+kullanici+"' , sifre = '"+ sifre +"' where kullaniciad = '"+kullaniciad+"'"  ;
			java.sql.PreparedStatement psmt = conn.prepareStatement(update);
			
			
			int insertQuery = psmt.executeUpdate();

			
			
			if(insertQuery != 0){
			
				
				
				response.sendRedirect("admingir.jsp");
				
			}else{
				response.sendRedirect("adminayarlar.jsp");
			}
		} catch (Exception e) {
			//response.sendRedirect("yedek.jsp");
			out.println(e.getMessage());
		}
	}

}
