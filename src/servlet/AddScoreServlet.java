package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.DBUtill;

/**
 * Servlet implementation class AddScoreServlet
 */
@WebServlet("/AddScoreServlet")
public class AddScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddScoreServlet() {
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
		
		String name = request.getParameter("couresname");
		String id = request.getParameter("id");
		String score = request.getParameter("score");
		String studentid = request.getParameter("studentid");
		
		DBUtill db = new DBUtill();
		ResultSet rs = db.selectexecute("select scoreid from scoretable where classid="+name+" and studentid="+studentid, null);
		try {
			String sql;
			if(rs.next()) {
				sql = "update scoretable set score="+score+" where scoreid="+rs.getString("scoreid");
			}else {
				sql = "insert into scoretable (scoreid,classid, studentid, score) values ('"+id+"', "+name+", "+studentid+", "+score+")";
			}
			System.out.println(sql);
			if(db.updateexecute(sql) == 0) {
				response.sendRedirect("addScorePage.jsp");
			}else {
				response.sendRedirect("scoPage.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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