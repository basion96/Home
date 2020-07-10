package controllers.account;

import database.AccountDatabase;

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/createAccount.jsp");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {



        AccountDatabase accDB = new AccountDatabase();
        if(accDB.checkIfUsernameAvailable(request.getParameter("username"))){
            accDB.insertPendingUser(request.getParameter("username"), request.getParameter("password"));
            response.sendRedirect(request.getContextPath() + "/?status=pending");
        }
        else{
            request.setAttribute("username", request.getParameter("username"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/createAccount.jsp?error=1");
            dispatcher.forward(request, response);
        }
    }
}
