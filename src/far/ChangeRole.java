package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeRole{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {

    int id = Integer.parseInt(request.getParameter("client"));
    String role = request.getParameter("role");
    Database db = Database.getDB();
    Customer user = db.findCustByID(id);
    try{
      db.changeRole(user, role);
    }
    catch (Exception s){
      System.out.println("ChangeRole/execute: changeRole unsuccesful.");
      System.out.println(s.getMessage());
    }

    String res = "تغییر نقش صورت گرفت.";
    request.setAttribute("res", res);

		return "response.jsp";
	}
}
