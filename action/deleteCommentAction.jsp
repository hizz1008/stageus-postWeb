<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  int editCommentIdx = Integer.parseInt(request.getParameter("commentIdx"));
  int pageIdx = (int) session.getAttribute("pageIdx");

  // 드라이브 연결
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  String sql = "DELETE FROM comment WHERE idx = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, editCommentIdx);
  int result = query.executeUpdate();

  if(result > 0){
    String idxParameter = "idx=" + pageIdx; 
    response.sendRedirect("../action/getContentAction.jsp?" + idxParameter);
  }
%>

int pageIdx = (int) session.getAttribute("pageIdx");
String loggedInId = (String) session.getAttribute("loggedInId");

