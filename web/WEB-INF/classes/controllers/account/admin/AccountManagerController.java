package controllers.account.admin;

import controllers.authentication.UserAuthenticator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminMenu/accountManager")
public class AccountManagerController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(!request.isUserInRole("admin")){
            response.sendRedirect(request.getContextPath() + "/403");
        }
        else{
            List<String> pendingUsers = new UserAuthenticator().getAllPendingUsers();
            request.setAttribute("userListLength", pendingUsers.size());
            request.setAttribute("users", pendingUsers);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/admin/AccountManager.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("PendingUser").equals("Accept")){
            new UserAuthenticator().verifyPendingUser(true, request.getParameter("username"), request.getParameter("role"));
        }
        else if(request.getParameter("PendingUser").equals("Deny")){
            new UserAuthenticator().verifyPendingUser(false, request.getParameter("username"), null);
        }
        request.setAttribute("users", new UserAuthenticator().getAllPendingUsers());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/admin/AccountManager.jsp");
        requestDispatcher.forward(request,response);
    }
}
