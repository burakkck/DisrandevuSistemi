

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class saatservlet
 */
@WebServlet("/saatservlet")
public class saatservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saatservlet() {
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
		String [] Gunler = {"","Pazar","Pazartesi","Salı","Çarşamba","Perşembe","Cuma","Cumartesi"};
		String[] Aylar = {"Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
		        "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"};
		Calendar takvim = Calendar.getInstance();
		int bugununTarihi = takvim.get(Calendar.DATE);
		int ay = takvim.get(Calendar.MONTH);
		takvim.set(Calendar.MONTH, ay + 1);
		takvim.set(Calendar.DATE, bugununTarihi + 1);
		String tarih = takvim.get(Calendar.DATE) + "." + takvim.get(Calendar.MONTH) +"." + takvim.get(Calendar.YEAR);
		String doktor = request.getParameter("doktor");
		String liste[] = null;
		liste = doktor.split(" ");
		String doktorad = liste[1];
		String doktorsoyad = liste[2];
		Connection conn = null;
		ArrayList<String> saat = new ArrayList<String>(); 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/disrandevu",
							"root", "burak145+");
			String sql = "select saat.saat from saat where saat.saat not in (select randevu.saat_saat from randevu where randevu.doktor_id in(select doktor.id from doktor where doktor.ad ='" + doktorad + "' and doktor.soyad='" + doktorsoyad +"')and randevu.tarih='"+ tarih +"')";
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				saat.add(rs.getString("saat"));
			}
			String kod = "select id from doktor where ad = '" + doktorad +"' and soyad = '" + doktorsoyad +"'";
			PreparedStatement psmtid = conn.prepareStatement(kod);
			ResultSet rsid = psmtid.executeQuery();
			while (rsid.next()) {
				String id = rsid.getString("id");
				request.setAttribute("drid", id);
			}
			
			request.setAttribute("tarih", tarih);
			request.setAttribute("time", saat);
			request.setAttribute("drad", doktor);
			request.getRequestDispatcher("saatisec.jsp").forward( request, response);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,
					e.getErrorCode() + " " + e.getMessage());
			e.printStackTrace();
		} 
	}

}
