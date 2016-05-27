package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmDepo{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {


    // Database db = Database.getDB();
    // ArrayList<Profile> info = db.getProfilesByID(Integer.parseInt(request.getRemoteUser()));


    String[] accepts = request.getParameterValues("accepts");
    if(accepts != null)
    for (int i = 0; i < accepts.length; i++) {
      Customer.getCustomer(Integer.parseInt(accepts[i])).deposit(WaitingCustomer.findAmount(Integer.parseInt(accepts[i])));
      WaitingCustomer.waitList.remove(i);
    }

    String res;
    res = "انجام شد";

    request.setAttribute("res", res);

  return "response.jsp";
	}
}
