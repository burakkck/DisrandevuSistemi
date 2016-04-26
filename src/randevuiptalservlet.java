

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class randevuiptalservlet
 */
@WebServlet("/randevuiptalservlet")
public class randevuiptalservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public randevuiptalservlet() {
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
		PrintWriter out = response.getWriter();
		String id = request.getParameter("drid");
		String saat = request.getParameter("saat");
		String tc = (String)session.getAttribute("tc");
		out.println(id);
		out.println(saat);
		out.println(tc);
		String sql = "delete from randevu where doktor_id='" +id+ "' and saat_saat='"+saat+"' and hasta_tc='"+tc+"'";
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu"; 
		
		try{
            
            
	           Class.forName(bglntiSnf);
	           java.sql.Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
	           PreparedStatement psmt = conn.prepareStatement(sql);
	           int insertQuery = psmt.executeUpdate();
	           conn.close();
	           if(insertQuery != 0){
	   			
					
					
					response.sendRedirect("randevular.jsp");
					
				}else{
					response.sendRedirect("randevular.jsp");
				}
	            
		 }catch(SQLException e){
	            out.println(e.getMessage());
	        }catch(ClassNotFoundException e){
	            out.println(e.getMessage());
	        }
	}

}
