package controllers.authentication;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class loginController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/WEB-INF/jsp/loginFail.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserAuthenticator auth = new UserAuthenticator();
        if(auth.validateLogin(request.getParameter("username"), request.getParameter("password"))){
            //DiscordBot discordBot = (DiscordBot) getServletContext().getAttribute("bot");
            //discordBot.sendMessage();
            HttpSession oldSession = request.getSession();
            if(oldSession!=null)
                oldSession.invalidate();

            HttpSession newSession = request.getSession(true);

            newSession.setAttribute("username", request.getParameter("username"));
            response.sendRedirect(request.getContextPath() + "/index");
        }
        else{
            response.sendRedirect(request.getContextPath() + "/loginPage?failedAttempt");
        }
    }
}