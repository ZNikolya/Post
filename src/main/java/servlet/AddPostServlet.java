package servlet;

import manager.PostManager;
import model.Post;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet(urlPatterns = "/addPostServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddPostServlet extends HttpServlet {
    PostManager postManager = new PostManager();
    private final String UPLOAD_DIR = "D:\\IdeaProjects\\Shop\\Post//web\\WEB-INF\\upload";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String title = req.getParameter("title");
        String text = req.getParameter("text");
        String categoryId = req.getParameter("categoryId");
        User user = (User) req.getSession().getAttribute("user");

        Post post = new Post();
        post.setTitle(title);
        post.setText(text);
        post.setCategoryId(Integer.parseInt(categoryId));
        post.setUserId(user.getId());

        for (Part part : req.getParts()) {
            if (getFileName(part) != null) {
                String fileName = System.currentTimeMillis() + getFileName(part);
                String fullFileName = UPLOAD_DIR + File.separator + fileName;
                part.write(fullFileName);
                post.setPicUrl(fileName);
            }
        }


        try {
            postManager.add(post);
            resp.sendRedirect("/admin");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename"))
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
        }
        return null;
    }
}


