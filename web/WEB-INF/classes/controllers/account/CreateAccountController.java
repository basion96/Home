package controllers.account;

import controllers.authentication.UserAuthenticator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createAccount")
public class CreateAccountController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/createAccount.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserAuthenticator accDB = new UserAuthenticator();
        if(!accDB.usernameExists(request.getParameter("username"), true)){
            accDB.insertPendingUser(request.getParameter("username"), request.getParameter("password"));
            response.sendRedirect(request.getContextPath() + "/index?status=pending");
        }
        else{
            request.setAttribute("username", request.getParameter("username"));
            response.sendRedirect(request.getContextPath() + "/createAccount?error=1");
        }
    }
}
