package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.DBUtill;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//��ȡע��Ļ�����Ϣ
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String studentid = request.getParameter("studentid");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		StringBuffer msg = new StringBuffer();
		PrintWriter out = response.getWriter();
		
		// �ж��û����������Ƿ�Ϊ��
		if(username == null || username.trim().equals("")) {
			msg.append("�������û�����java����");
			out.print(msg.toString());
			return;
		}
		if(password == null || password.trim().equals("")) {
			msg.append("����������(java)��");
			out.print(msg.toString());
			return;
		}
		if(studentid == null || studentid.trim().equals("")) {
			msg.append("������ѧ�ţ�java����");
			out.print(msg.toString());
			return;
		}
		if(phone == null || phone.trim().equals("")) {
			msg.append("�������ֻ��ţ�java����");
			out.print(msg.toString());
			return;
		}
		if(email == null || email.trim().equals("")) {
			msg.append("���������䣨java����");
			out.print(msg.toString());
			return;
		}
		
		//new DBUtill�Ķ���
		DBUtill db = new DBUtill();
		String Sql = "select count(username) from Logintable";
		Map<String, String> values = new HashMap<>();
		values.put("username", username);
		ResultSet rs = db.selectexecute(Sql, values);
		// isExistΪ���ݿ���������������
		int isExist = 0;
		try {
			while(rs.next()) {
				isExist = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//�û����Ƿ����
		if(isExist != 0) {
			msg.append("�û����Ѵ��ڣ�");
			out.print(msg.toString());
			return;
		}
		//��������
		Sql = "insert into Logintable values (?, ?)";
		db.insertexecute(Sql, new String[] {username, password});
		Sql = "insert into Studenttable values (?, ?, ?, ?)";
		db.insertexecute(Sql, new String[] {username, studentid, phone, email});
		System.out.println("insert success");
		
		// ���ص�¼ҳ��
		String url = "indexPage.jsp";
		msg.append("Redirect:"+url);
		out.print(msg.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
