package servlet;

import manager.CategoryManager;
import model.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/addCategoryServlet")
public class AddCategoryServlet extends HttpServlet {

    CategoryManager categoryManager = new CategoryManager();


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Category category = new Category();
        category.setName(name);
        try {
            categoryManager.add(category);
            resp.sendRedirect("/admin");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
