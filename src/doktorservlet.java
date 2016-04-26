

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class doktorservlet
 */
@WebServlet("/doktorservlet")
public class doktorservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doktorservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String bolumad = request.getParameter("bolum");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/disrandevu",
							"root", "burak145+");
		
			//PreparedStatement psmtdoktor = conn.prepareStatement("select ad, soyad, bolum_id from doktor where bolum_id = (select id from bolum where bolum.ad = '" + bolumad +"')");
			String sorgu = "select id from bolum where bolum.ad = '" + bolumad +"';";
			PreparedStatement psmtdoktor = conn.prepareStatement(sorgu);
			ResultSet rs = psmtdoktor.executeQuery();
			ArrayList<String> doktor = new ArrayList<String>();
			 if (rs.next()) {
				int bolumid = rs.getInt("id");
				request.setAttribute("bolumid", bolumid);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/randevu.jsp");
				rd.forward(request, response);
			}
			
			/*
			while (rs.next()) {
				String doktorAd = rs.getString("ad");
				String doktorSoyad = (rs.getString("soyad"));
				String doktorAdSoyad = doktorAd + " " + doktorSoyad;
				doktor.add(doktorAdSoyad);
			}
			*/
			
			/*  if(rs.next()){
				int idBolum = rs.getInt("id");
				session.setAttribute("bolumid", idBolum);
			}
			*/
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,
					e.getErrorCode() + " " + e.getMessage());
			e.printStackTrace();
		}
		
		}
	}


