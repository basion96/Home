package controllers.account;

import controllers.authentication.UserAuthenticator;
import objects.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/myAccount")
public class UserAccountController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("user", new UserAuthenticator().getUserDetails(request.getUserPrincipal().getName()));

        RequestDispatcher rd = request.getRequestDispatcher( "/WEB-INF/jsp/user/userAccount.jsp");
        rd.forward(request,response);
    }
}
