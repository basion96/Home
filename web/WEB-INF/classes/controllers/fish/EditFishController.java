package controllers.fish;

import database.FishDatabase;
import objects.Category;
import objects.Fish;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/aquariums/editFish")
public class EditFishController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!request.getParameterMap().containsKey("fish_id")) {
            response.sendRedirect(request.getContextPath() + "/404");
            return;
        }

        FishDatabase fdb = new FishDatabase();
        Fish fish = fdb.getSingleFish(Integer.parseInt(request.getParameter("fish_id")));
        request.setAttribute("fish", fish);

        try {
            List<Category> tanks = fdb.getTankList();
            request.setAttribute("tanks", tanks);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/fishDatabase/fish/editFish.jsp");
        rd.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FishDatabase fishDB = new FishDatabase();
        if (request.getParameterMap().containsKey("delete")) {
            fishDB.updateFish(Integer.parseInt(request.getParameter("delete")), null, null, 0, null, null, null, true);
            response.sendRedirect(request.getContextPath() + "/aquariums/fish?status=fishDeleted");
        }
        else {
            int fish_id = Integer.parseInt(request.getParameter("fish_id"));
            String fish_name = request.getParameter("fish_name");
            String sex = request.getParameter("sex");
            int amount = Integer.parseInt(request.getParameter("amount"));
            String tank_id = request.getParameter("tank_id");
            String description = request.getParameter("description");
            String image_url = request.getParameter("image_url");
            if(image_url.contains("https://drive.google.com/file/d/")){
                image_url = image_url.substring(image_url.indexOf("/d/")+3, image_url.indexOf("/view"));
                image_url = "https://drive.google.com/uc?id=" + image_url;
            }

            fishDB.updateFish(fish_id, fish_name, sex, amount, tank_id, image_url, description, false);
            response.sendRedirect(request.getContextPath() + "/aquariums/fish?status=updated");

        }
    }
}