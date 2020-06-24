package controllers.tank;

import database.FishDatabase;
import objects.Fish;
import objects.Tank;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/aquariums/tanks")
public class TankViewController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FishDatabase fishDB = new FishDatabase();
        ArrayList<Tank> tanks = fishDB.getTanks();
        ArrayList<Fish> fish = fishDB.getFish();
        request.setAttribute("fish", fish);
        request.setAttribute("tanks", tanks);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/fishDatabase/tanks/tankView.jsp");
        rd.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
