package far;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.*;


public class FrontController extends HttpServlet {

	// URLs must have the form /polling/ControllerClass.action
	// the execute() method of the ControllerClass will be called
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String className = request.getServletPath().substring(1, request.getServletPath().indexOf(".action"));
		try {
			HttpSession session = request.getSession();
			if (session != null && session.getAttribute("user") == null) {
				Database db = Database.getDB();
				Customer user = db.findCustByID(Integer.parseInt(request.getRemoteUser()));
				System.out.println("didi goftam: "+request.getRemoteUser());
				System.out.println("userfamily FrontController: "+user.getFamily());
				System.out.println("username FrontController: "+user.getName());
				System.out.println("usercode FrontController: "+user.get_ID());
				System.out.println("userid FrontController: "+user.getID());
				System.out.println("useremail FrontController: "+user.getEmail());
				if (user != null) {
					session.setAttribute("user", user);
				}
			}

			Class ctrlClass = Class.forName("far." + className);
			Method m = ctrlClass.getMethod("execute", HttpServletRequest.class, HttpServletResponse.class);
			String forward = (String)m.invoke(ctrlClass.newInstance(), request, response);
			request.getRequestDispatcher(forward).forward(request, response);
		} catch (InvocationTargetException ex) {
			ex.printStackTrace();
			response.setContentType("text/html");
			if (ex.getTargetException() instanceof SQLException)
				response.getOutputStream().println("Error in accessing database!<p>Contact system administrator");
			else
				response.getOutputStream().println("Internal system error!<p>Contact system administrator");
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html");
			response.getOutputStream().println("Internal system error!<p>Contact system administrator");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
