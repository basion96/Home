package controllers.fish;

import database.FishDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/aquariums/fish")
public class FishViewController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FishDatabase fishDB = new FishDatabase();
        ArrayList fish = fishDB.getFish();
        request.setAttribute("fish", fish);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/fishDatabase/fish/fishView.jsp");
        rd.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}