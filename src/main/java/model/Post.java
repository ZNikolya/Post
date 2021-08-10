package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {

    private int id;
    private String title;
    private String text;
    private int categoryId;
    private int userId;
    private String picUrl;
    private User user;
    private Category category;


}
