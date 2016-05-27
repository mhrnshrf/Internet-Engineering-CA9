package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Others{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {

    int id = Integer.parseInt(request.getParameter("client"));
    Database db = Database.getDB();
    Customer user = db.findCustByID(id);

    request.getSession().setAttribute("other", user);
    // ArrayList<Profile> info = db.getProfilesByID(Integer.parseInt(request.getRemoteUser()));



		return "others.jsp";
	}
}
