package controllers.tank;

import objects.Category;
import database.FishDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/aquariums/addTank")
@MultipartConfig
public class AddTankController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FishDatabase fdb = new FishDatabase();

        try{
            List<Category> water_types = fdb.getWaterTypeList();
            request.setAttribute("water_types", water_types);

            List<Category> water_temperature_types = fdb.getWaterTemperatureTypeList();
            request.setAttribute("water_temperature_types", water_temperature_types);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/fishDatabase/tanks/addTank.jsp");
            rd.forward(request, response);
        }catch (SQLException e){
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        FishDatabase fishDB = new FishDatabase();

        String tank_name = request.getParameter("tank_name");
        int tank_size = Integer.parseInt(request.getParameter("tank_size"));
        int water_type = Integer.parseInt(request.getParameter("water_type"));
        int water_temperature = Integer.parseInt(request.getParameter("water_temperature"));
        String description = request.getParameter("description");
        String image_url = request.getParameter("image_url");
        if(image_url.contains("https://drive.google.com/file/d/")){
            image_url = image_url.substring(image_url.indexOf("/d/")+3, image_url.indexOf("/view"));
            image_url = "https://drive.google.com/uc?id=" + image_url;
        }
        fishDB.addTank(tank_name, tank_size, water_type, water_temperature, description, image_url);
        response.sendRedirect(request.getContextPath()+"/aquariums/tanks?success");
    }
}