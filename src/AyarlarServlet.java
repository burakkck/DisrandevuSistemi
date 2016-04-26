

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
 * Servlet implementation class AyarlarServlet
 */
@WebServlet("/AyarlarServlet")
public class AyarlarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AyarlarServlet() {
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
		String tc = request.getParameter("tc");
		String ad = request.getParameter("isim");
		String soyad = request.getParameter("soyad");
		String cinsiyet = request.getParameter("cinsiyet");
		String email = request.getParameter("mail");
		String telefon = request.getParameter("telefon");
		String parola = request.getParameter("parola");
		String gun = request.getParameter("gun");
		String ay = request.getParameter("ay");
		String yil = request.getParameter("yil");
		String annesoyad = request.getParameter("annesoyad");
		HttpSession session = request.getSession();
		String bglntiSnf = "com.mysql.jdbc.Driver";
		String bglntiurl = "jdbc:mysql://localhost:3306/disrandevu";
		//final String msj = "mesaj g�nderildi";
		
		
		try {
			Class.forName(bglntiSnf);
			Connection conn = DriverManager.getConnection(bglntiurl,"root","burak145+");
			String hastatc = (String)session.getAttribute("tc");
			String update = "update hasta set ad = '"+ad+"',soyad = '"+soyad+"',cinsiyet = '"+cinsiyet+"',mail = '"+email+"',telefon = '"+telefon+"',parola = '"+parola+"',gun = '"+gun+"',ay = '"+ay+"',yil = '"+yil+"', annekizsoyad='"+annesoyad+"' where tc = '"+hastatc+"'"  ;
			java.sql.PreparedStatement psmt = conn.prepareStatement(update);
			
			/*psmt.setString(1, ad);
			psmt.setString(2, soyad);
			psmt.setString(3, cinsiyet);
			psmt.setString(4, email);
			psmt.setString(5, telefon);
			psmt.setString(6, parola);
			psmt.setString(7, gun);
			psmt.setString(8, ay);
			psmt.setString(9, yil);*/
			//psmt.setString(10, tc);
			
			int insertQuery = psmt.executeUpdate();

			
			
			if(insertQuery != 0){
			
				
				
				response.sendRedirect("girisyap.jsp");
				
			}else{
				response.sendRedirect("ayarlar.jsp");
			}
		} catch (Exception e) {
			//response.sendRedirect("yedek.jsp");
			out.println(e.getMessage());
		}
	
	}

}
