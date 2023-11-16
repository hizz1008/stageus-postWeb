<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234"); 

  int pageIdx = (int) session.getAttribute("pageIdx");
  String loggedInId = (String) session.getAttribute("loggedInId");

  String title = null;
  String content = null;
  int account_idx = -1;

  String sql = "SELECT * FROM content WHERE idx = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, pageIdx);
  ResultSet result = query.executeQuery();
  if(result.next()){
    title = result.getString("title");
    content = result.getString("content");
    account_idx = result.getInt("account_idx");
  }
  request.setAttribute("title", title);
  request.setAttribute("content", content);
  
  request.getRequestDispatcher("../page/editContentPage.jsp").forward(request, response);
%>
