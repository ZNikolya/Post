package manager;

import db.DBConnectionProvider;
import model.Category;
import model.User;
import model.UserType;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CategoryManager {


    private Connection connection;

    public CategoryManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void add(Category category) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("insert into category(name) values (?)", Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1, category.getName());
        preparedStatement.executeUpdate();
        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
        if (generatedKeys.next()) {
            int anInt = generatedKeys.getInt(1);
            category.setId(anInt);
        }
    }

    public List<Category> getAllCategories() throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from category");
        List<Category> categories = new ArrayList<Category>();
        while (resultSet.next()) {
            Category category = new Category();
            category.setId(resultSet.getInt(1));
            category.setName(resultSet.getString(2));
            categories.add(category);
        }
        return categories;
    }

    public List<Category> getAllCategoriesByPostId(int postId) {
        PreparedStatement statement = null;
        List<Category> categories = new LinkedList<>();
        try {
            statement = connection.prepareStatement("SELECT * FROM category WHERE postId =?");
            statement.setInt(1, postId);
            ResultSet resultSet = statement.executeQuery();
            categories = getCategoriesFromResultSet(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    private List<Category> getCategoriesFromResultSet(ResultSet resultSet) throws SQLException {
        List<Category> categories = new LinkedList<>();
        while (resultSet.next()) {
            Category category = new Category();
            category.setId(resultSet.getInt("id"));
            category.setName(resultSet.getString("name"));

            categories.add(category);
        }
        return categories;
    }

    public Category getCategoryById(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM category WHERE id=?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));

                return category;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }

}
