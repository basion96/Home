package controllers.fishDatabaseControllers.tank;

import database.FishDatabase;
import objects.Category;
import objects.Tank;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/aquariums/editTank")
public class EditTankController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        if(!request.getParameterMap().containsKey("tank_id")){
            response.sendRedirect(request.getContextPath()+"/404");
            return;
        }

        FishDatabase fdb = new FishDatabase();
        Tank tank = fdb.getSingleTank(Integer.parseInt(request.getParameter("tank_id")));
        request.setAttribute("tank", tank);

        try{
            List<Category> water_types = fdb.getWaterTypeList();
            request.setAttribute("water_types", water_types);

            List<Category> water_temperature_types = fdb.getWaterTemperatureTypeList();
            request.setAttribute("water_temperature_types", water_temperature_types);
        }catch (SQLException e){
            e.printStackTrace();
            throw new ServletException(e);
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/fishDatabase/tanks/editTank.jsp");
        rd.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        FishDatabase fishDB = new FishDatabase();
        if(request.getParameterMap().containsKey("delete")){
            fishDB.updateTank(Integer.parseInt(request.getParameter("delete")), null, 0, 0, 0, null, null, true);
            response.sendRedirect(request.getContextPath()+"/aquariums/tanks?tankDeleted");
        }
        else {
            int tank_id = Integer.parseInt(request.getParameter("tank_id"));
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
            fishDB.updateTank(tank_id, tank_name, tank_size, water_type, water_temperature, description, image_url, false);
            response.sendRedirect(request.getContextPath()+"/aquariums/tanks?success");
        }
    }
}
