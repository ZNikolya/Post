package manager;

import db.DBConnectionProvider;
import model.Category;
import model.User;
import model.UserType;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class UserManager {


    private Connection connection;

    public UserManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void add(User user) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement("insert into user(name ,surname,email,password,type) values (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getSurname());
        preparedStatement.setString(3, user.getEmail());
        preparedStatement.setString(4, user.getPassword());
        preparedStatement.setString(5, user.getUserType().name());
        preparedStatement.executeUpdate();
        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
        if (generatedKeys.next()) {
            int id = generatedKeys.getInt(1);
            user.setId(id);
        }
    }

    public List<User> getAllUser() {
        Statement statement = null;
        List<User> users = new LinkedList<>();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user");

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setUserType(UserType.valueOf(resultSet.getString("type")));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User getUserByUsernameAndPassword(String email, String password) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("select * from user where email = ? and password = ?");
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            User user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("name"));
            user.setSurname(resultSet.getString("surname"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setUserType(UserType.valueOf(resultSet.getString("type")));
            return user;
        }
        return null;
    }
    public User getUserById(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE id=?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setUserType(UserType.valueOf(resultSet.getString("type")));
                return user;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }


}
