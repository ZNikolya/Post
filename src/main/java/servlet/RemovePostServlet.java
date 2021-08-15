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



@WebServlet(urlPatterns = "/removePost")

public class RemovePostServlet extends HttpServlet {
    PostManager postManager = new PostManager();

    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        postManager.deletePostById(id);
        req.getSession().setAttribute("id", user.getId());
        resp.sendRedirect("/user");

    }
}
