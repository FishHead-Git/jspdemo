package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.DBUtill;

/**
 * Servlet implementation class UpdatePersonServlet
 */
@WebServlet("/UpdatePersonServlet")
public class UpdatePersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePersonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		DBUtill db = new DBUtill();
		
		String sql = "update studenttable set studentname='"+name+"', phone='"+phone+"', email='"+email+"' where studentid='"+id+"'";
		
		System.out.println(sql);
		if(db.updateexecute(sql) == 0) {
			response.sendRedirect("updatePersonPage.jsp");
		}else {
			response.sendRedirect("peoPage.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
