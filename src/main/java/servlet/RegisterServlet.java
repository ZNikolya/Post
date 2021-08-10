package servlet;

import manager.UserManager;
import model.User;
import model.UserType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/registerServlet")
public class RegisterServlet extends HttpServlet {

    UserManager userManager = new UserManager();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String type = req.getParameter("type");

        User user = User.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .password(password)
                .userType(UserType.valueOf(type))
                .build();

        try {
            userManager.add(user);
            resp.sendRedirect("/home");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
