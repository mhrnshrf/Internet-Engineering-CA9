package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Deposit{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {
    int id, amount;
    try{
      id = Integer.parseInt(request.getRemoteUser());
        amount = Integer.parseInt(request.getParameter("amount"));
    }
    catch(NumberFormatException b){
      String er = "لطفا عدد وارد کنید";
      request.setAttribute("res", er);
      return "response.jsp";
    }

    String res = new String();
      Symbol s;

      if(!Customer.exist(id))
          res = "کاربری با این شناسه وجود ندارد";
      else{
          WaitingCustomer c = new WaitingCustomer(Customer.getCustomer(id), amount);
          WaitingCustomer.waitList.add(c);
          res = "درخواست شما در صف قرار گرفت";
      }

      request.setAttribute("res", res);

		return "response.jsp";
	}
}
