package controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/finance/frontpage")
public class financeController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/finance/finance.jsp");
        rd.forward(request,response);
    }
}
