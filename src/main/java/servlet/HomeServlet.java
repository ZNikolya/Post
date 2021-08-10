package servlet;

import manager.CategoryManager;
import manager.PostManager;
import model.Category;
import model.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostManager postManager = new PostManager();
        CategoryManager categoryManager = new CategoryManager();
        try {
            List<Post> allPosts = postManager.getAllPosts();
            List<Category> allCategories = categoryManager.getAllCategories();
            req.setAttribute("post", allPosts);
            req.setAttribute("categories", allCategories);
            req.getRequestDispatcher("/WEB-INF/home.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
