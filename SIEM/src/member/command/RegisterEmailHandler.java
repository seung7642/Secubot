package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.model.User;
import member.service.MemberNotFoundException;
import member.service.RegisterCodeNotMatchException;
import member.service.RegisterEmailService;
import mvc.command.CommandHandler;

public class RegisterEmailHandler implements CommandHandler {

	private RegisterEmailService registerEmailService = new RegisterEmailService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String registerCode = req.getParameter("registerCode");
		String email = req.getParameter("email");
		
		try {
			User user = registerEmailService.register(email, registerCode);
			req.getSession().setAttribute("authUser", user);
			res.sendRedirect(req.getContextPath() + "/index.jsp");
			return null;
		} catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		} catch (RegisterCodeNotMatchException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}
}
