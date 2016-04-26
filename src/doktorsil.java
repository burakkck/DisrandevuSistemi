

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

/**
 * Servlet implementation class doktorsil
 */
@WebServlet("/doktorsil")
public class doktorsil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doktorsil() {
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
		String id = request.getParameter("doktorid");
		String sql = "delete from doktor where id=?";
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu"; 
		
		try{
            
            
	           Class.forName(bglntiSnf);
	           java.sql.Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
	           PreparedStatement psmt = conn.prepareStatement(sql);
	           psmt.setString(1, id);
	           int insertQuery = psmt.executeUpdate();
	           conn.close();
	           if(insertQuery != 0){
	   			
					
					
					response.sendRedirect("admin.jsp");
					
				}else{
					response.sendRedirect("doktorsil.jsp");
				}
	            
		 }catch(SQLException e){
	            out.println(e.getMessage());
	        }catch(ClassNotFoundException e){
	            out.println(e.getMessage());
	        }
	}

}
