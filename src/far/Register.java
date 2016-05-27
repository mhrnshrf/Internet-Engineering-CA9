package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {
    int id;
    String name, family, password, email;
    try{
        id = Integer.parseInt(request.getParameter("id"));
        name = request.getParameter("name");
        family = request.getParameter("family");
        password = request.getParameter("pwd");
        email = request.getParameter("email");
    }
    catch(NumberFormatException b){
    		String er = "شناسه کاربری معتبر نیست";
    		request.setAttribute("res", er);
        return "response.jsp";
    }
    String res = new String();
    if(!Customer.exist(id) && id != 1){
      Customer c = new Customer(0, id, name, family, password, email);
			Database.getDB().insertCust(c);
    	res = "کاربر جدید افزوده شد";
    }
    else
    	res = "شناسه تکراری است";

			request.setAttribute("res", res);

		return "response.jsp";
	}
}
