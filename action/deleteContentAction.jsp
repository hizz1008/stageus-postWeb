<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

  // 드라이브 연결
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  int pageIdx = (int) session.getAttribute("pageIdx");
  String loggedInId = (String) session.getAttribute("loggedInId");

  String sql = "DELETE FROM comment WHERE content_idx = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, pageIdx);
  int result = query.executeUpdate();

  String DeleteContentSql = "DELETE FROM content WHERE idx = ?";
  PreparedStatement DeleteContentQuery = connect.prepareStatement(DeleteContentSql);
  DeleteContentQuery.setInt(1, pageIdx);
  int DeleteContentResult = DeleteContentQuery.executeUpdate();

  if(DeleteContentResult > 0){
    session.removeAttribute("pageIdx");
    response.sendRedirect("../index.jsp");
  }
%>
