package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Status{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {


    String name;
    name = request.getParameter("instrument");
    Symbol s = Symbol.getSymbol(name);
    if(s == null){
        String er = "این نماد موجود نیست";
        request.setAttribute("res", er);
        return "response.jsp";
    }
    request.setAttribute("sym", s);



		return "queue.jsp";
	}
}
