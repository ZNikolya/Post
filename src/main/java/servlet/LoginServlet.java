package servlet;

import lombok.SneakyThrows;
import manager.UserManager;
import model.User;
import model.UserType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {

    @SneakyThrows
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserManager userManager = new UserManager();

        User user = userManager.getUserByUsernameAndPassword(email, password);
        if (user == null) {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            if (user.getUserType() == UserType.MANAGER) {
                resp.sendRedirect("/admin");
            } else {
                resp.sendRedirect("/user");
            }
        }
    }
}