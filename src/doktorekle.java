

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
 * Servlet implementation class doktorekle
 */
@WebServlet("/doktorekle")
public class doktorekle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doktorekle() {
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
		
		
		String ad = request.getParameter("ad");
		String soyad = request.getParameter("soyad");
		String bolum = request.getParameter("bolum");
		String unvan = request.getParameter("unvan");
		String kullanici = request.getParameter("kullaniciad");
		String sifre = request.getParameter("sifre");
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";
//		String select = "select id from bolum where ad ='"+bolum+"';";
		
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			
			String insert = "insert into doktor(unvan,ad,soyad,bolum_id,kullaniciad,sifre)values(?,?,?,?,?,?)";
			java.sql.PreparedStatement psmt = conn.prepareStatement(insert);
//			PreparedStatement psmt2 = conn.prepareStatement(select);
			psmt.setString(1, unvan);
			psmt.setString(2, ad);
			psmt.setString(3, soyad);
			psmt.setString(4, bolum);
			psmt.setString(5, kullanici);
			psmt.setString(6, sifre);
		    int insertQuery = psmt.executeUpdate();
////			ResultSet rs2 = psmt2.executeQuery();
//			if (rs.next()) {
////				if(rs2.next()){
////				String bolid = rs.getString("bolum_id");
////			}
//			psmt.setString(1, ad);
//			psmt.setString(2, soyad);
//			psmt.setString(3, bolum);
//			//psmt2.setString(3,bolid );
//			}
////			int insertQuery = psmt.executeUpdate();
//			HttpSession session = request.getSession();
			
			
			if(insertQuery != 0){
			
				
				
				response.sendRedirect("admin.jsp");
				
			}else{
				response.sendRedirect("doktorekle.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}

	

}
