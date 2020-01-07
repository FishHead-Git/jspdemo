package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("doget");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
//		System.out.println("hello servlet");
		
		// 获取用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		System.out.println(username+"->"+password);
		StringBuffer msg = new StringBuffer();
		PrintWriter out = response.getWriter();
		
		// 判断用户名和密码是否为空
		if(username == null || username.trim().equals("")) {
			msg.append("请输入用户名（java）：");
			out.print(msg.toString());
			return;
		}
		if(password == null || password.trim().equals("")) {
			msg.append("请输入密码(java)：");
			out.print(msg.toString());
			return;
		}
		
		
		// 判断用户名和密码是否与写好的一致
		if("356".equals(username)&& "1234".equals(password)) {
			// 目标网页
			String url = "mainPage.jsp";
			msg.append("Redirect:"+url);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			out.print(msg.toString());
		}else {
			msg.append("登录失败");
			out.print(msg.toString());
			return;
		}
		// 返回结果
		out.close();
		
		
		// 重定向 回到indexPage.jsp
//		response.sendRedirect("indexPage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("dopost");
		doGet(request, response);
	}

}
