package far;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Order{
	public String execute(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException, java.sql.SQLException {
		int id, price, quantity;
		String instrument, type, bs;
		try{
				id = Integer.parseInt(request.getParameter("id"));
				instrument = request.getParameter("instrument");
				price = Integer.parseInt(request.getParameter("price"));
				quantity = Integer.parseInt(request.getParameter("quantity"));
				type = request.getParameter("type");
				bs = request.getParameter("bs");
		}
		catch(NumberFormatException b){
			String er = "لطفا عدد وارد کنید";
			request.setAttribute("res", er);
				return "response.jsp";
		}

		String res = new String();
			Symbol s;

			if (bs.equals("buy")) {
				if(!Customer.exist(id))
				res = "کاربری با این شناسه وجود ندارد";
				else if (!Symbol.exist(instrument))
						res = "شناسه نماد معتبر نیست";
				else if (Customer.getCustomer(id).getCash() < quantity*price)
						res = "موجودی کافی نیست";
				else{
						s = Symbol.getSymbol(instrument);
						res = s.updateList(id, instrument, price, quantity, type, "buy");
				}


			}
			else if (bs.equals("sell")) {
				if (id == 1) {
					if (Symbol.exist(instrument)) {
						s = Symbol.getSymbol(instrument);
					}
					else{
						s = new Symbol(instrument);
						Database.getDB().insertSymbol(s);
					}

					res = s.updateList(id, instrument, price, quantity, type, "sell");

				}
				else if (!Symbol.exist(instrument))
					res = "شناسه نماد معتبر نیست";
					else if(!Customer.exist(id))
						res = "کاربری با این شناسه وجود ندارد";
					else if (Customer.getCustomer(id).getShare(instrument) < quantity)
						res = "تعداد سهام کافی نیست";
					else{
						s = Symbol.getSymbol(instrument);
						res = s.updateList(id, instrument, price, quantity, type, "sell");
					}
			}



			request.setAttribute("res", res);

		return "response.jsp";
	}
}
