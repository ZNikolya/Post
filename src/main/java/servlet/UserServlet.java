package servlet;

import lombok.SneakyThrows;
import manager.PostManager;

import model.Post;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/user")
public class UserServlet  extends HttpServlet {

    @SneakyThrows
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        PostManager postManager = new PostManager();
        List<Post> allPosts = postManager.getAllPosts();
        List<Post> allPostsByUserId = postManager.getAllPostsByUserId(user.getId());
        req.setAttribute("posts", allPosts);
        req.setAttribute("post",allPostsByUserId);
        req.getRequestDispatcher("/WEB-INF/user.jsp").forward(req, resp);

    }
}
