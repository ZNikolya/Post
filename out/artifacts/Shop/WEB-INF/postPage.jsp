<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%@ page import="model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post</title>
</head>
<body>
<% Post post = (Post) session.getAttribute("post");%>
<%List<Category> allCategories = (List<Category>) request.getAttribute("allCategories");%>
<% User user = (User) session.getAttribute("user"); %>

<% if (user.getUserType() == UserType.MANAGER) {%>
<a href="/admin">Back</a>
<% } else {%>
<a href="/user"> Back </a>
<%}%>


<div>
    <br>
    All Posts: <br>
    <table border="1">
        <tr>
            <th>title</th>
            <th>text</th>
            <th>category</th>
            <th>user</th>
            <th>picture</th>
        </tr>
        <%
            if (post != null) {
                %>
        <tr>
            <td><%=post.getTitle()%>
            </td>
            <td><%=post.getText()%>
            </td>
            <td><%=post.getCategory().getName()%>
            </td>
            <td><% if (post.getPicUrl() != null) { %>
                <img src="/image?path=<%=post.getPicUrl()%>" width="30"/>
                <%}%>
            </td>
            <%
                }
            %>
        </tr>
    </table>

</div>
<div style="width: 30%; float: left">
    <div>
        <% if (user == null) {%>
        <a href="/login-view">Login</a>
        <%} else {%>
        <a href="/logout">Logout</a>
        <%}%>

    </div>
</div>


</body>
</html>
