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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/postPage")
public class PostPageServlet extends HttpServlet {

    PostManager postManager = new PostManager();
    CategoryManager categoryManager = new CategoryManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Post postById = postManager.getPostById(id);
        List<Category> allCategoriesByPostId = categoryManager.getAllCategoriesByPostId(postById.getId());
        HttpSession session = req.getSession();
        session.setAttribute("post", postById);
        req.setAttribute("allCategories", allCategoriesByPostId);
        req.getRequestDispatcher("/WEB-INF/postPage.jsp").forward(req, resp);
    }
}
