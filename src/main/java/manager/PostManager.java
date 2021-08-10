package manager;

import db.DBConnectionProvider;
import javafx.geometry.Pos;
import model.Category;
import model.Post;
import model.User;
import model.UserType;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class PostManager {


    private Connection connection;
    private UserManager userManager = new UserManager();
    private CategoryManager categoryManager = new CategoryManager();

    public PostManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void add(Post post) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("insert into post(title,text,categoryId,userId,picUrl) values (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1, post.getTitle());
        preparedStatement.setString(2, post.getText());
        preparedStatement.setInt(3, post.getCategoryId());
        preparedStatement.setInt(4, post.getUserId());
        preparedStatement.setString(5, post.getPicUrl());
        preparedStatement.executeUpdate();
        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
        if (generatedKeys.next()) {
            int anInt = generatedKeys.getInt(1);
            post.setId(anInt);
        }
    }

    public List<Post> getAllPosts() throws SQLException {
        List<Post> posts = new LinkedList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM post");

            while (resultSet.next()) {
                int categoryId = resultSet.getInt("categoryId");
                int userId = resultSet.getInt("userId");
                Post post = new Post();
                post.setId(resultSet.getInt("id"));
                post.setTitle(resultSet.getString("title"));
                post.setText(resultSet.getString("text"));
                post.setUserId(userId);
                post.setCategoryId(categoryId);
                post.setPicUrl(resultSet.getString("picUrl"));
                post.setUser(userManager.getUserById(userId));
                post.setCategory(categoryManager.getCategoryById(categoryId));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public List<Post> getAllPostsByUserId(int userId) {
        PreparedStatement statement = null;
        List<Post> posts = new LinkedList<>();
        try {
            statement = connection.prepareStatement("SELECT * FROM post WHERE userId =?");
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            posts = getPostsFromResultSet(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }
    private List<Post> getPostsFromResultSet(ResultSet resultSet) throws SQLException {
        List<Post> posts = new LinkedList<>();
        while (resultSet.next()) {
            Post post = new Post();
            post.setId(resultSet.getInt("id"));
            post.setTitle(resultSet.getString("title"));
            post.setText(resultSet.getString("text"));
            post.setCategoryId(resultSet.getInt("categoryId"));
            post.setCategory(categoryManager.getCategoryById(post.getCategoryId()));
            post.setUserId(resultSet.getInt("userId"));
            post.setUser(userManager.getUserById(post.getUserId()));
            post.setPicUrl(resultSet.getString("picUrl"));
            posts.add(post);
        }
        return posts;
    }

    public Post getPostById(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM post WHERE id=?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Post post = new Post();
                post.setId(resultSet.getInt("id"));
                post.setTitle(resultSet.getString("title"));
                post.setText(resultSet.getString("text"));
                post.setCategoryId(Integer.parseInt(resultSet.getString("categoryId")));
                post.setUserId(Integer.parseInt(resultSet.getString("userId")));
//                post.setUser(userManager.getUserById(post.getUserId()));
//                post.setCategory(categoryManager.getCategoryById(post.getCategoryId()));
                post.setPicUrl(resultSet.getString("picUrl"));

                return post;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }
}
