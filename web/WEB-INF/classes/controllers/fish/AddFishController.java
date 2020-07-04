package controllers.fish;

import objects.Category;
import database.FishDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/aquariums/addFish")
public class AddFishController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FishDatabase fdb = new FishDatabase();

        try{
            List<Category> tanks = fdb.getTankList();
            request.setAttribute("tanks", tanks);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/fishDatabase/fish/addFish.jsp");
            dispatcher.forward(request, response);
        }catch (SQLException e){
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        FishDatabase fishDB = new FishDatabase();
        //name
        String fish_name = request.getParameter("fish_name");
        //sex
        String sex = request.getParameter("sex");
        //amount
        int amount = Integer.parseInt(request.getParameter("amount"));
        //tank id
        String tank_id = request.getParameter("tank_id");
        //description
        String description = request.getParameter("description");

        //image and altering image url
        String image_url = request.getParameter("image_url");
        if(image_url.contains("https://drive.google.com/file/d/")){
            image_url = image_url.substring(image_url.indexOf("/d/")+3, image_url.indexOf("/view"));
            image_url = "https://drive.google.com/uc?id=" + image_url;
        }

        fishDB.addFish(fish_name, sex, amount, tank_id, image_url, description);
        response.sendRedirect(request.getContextPath()+"/aquariums/fish?status=added");
    }
}
