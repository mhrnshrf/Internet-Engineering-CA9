package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Info{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {


    Database db = Database.getDB();
    Customer user = db.findCustByID(Integer.parseInt(request.getRemoteUser()));

    request.getSession().setAttribute("user", user);
    // ArrayList<Profile> info = db.getProfilesByID(Integer.parseInt(request.getRemoteUser()));



		return "profile.jsp";
	}
}
