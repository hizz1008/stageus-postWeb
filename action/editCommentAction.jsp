<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
  String editComment = request.getParameter("editComment");
  int editCommentIdx = Integer.parseInt(request.getParameter("commentIdx"));
  String loggedInId = (String) session.getAttribute("loggedInId");
  int pageIdx = (int) session.getAttribute("pageIdx");
  int userIdx = -1;

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

    String getUserIdxSql = "SELECT idx FROM account WHERE id = ?";
    PreparedStatement getUserIdxQuery = connect.prepareStatement(getUserIdxSql);
    getUserIdxQuery.setString(1,loggedInId);
    ResultSet getUserIdxResult = getUserIdxQuery.executeQuery();

    if(getUserIdxResult.next()){
      userIdx = getUserIdxResult.getInt("idx");
    }

    String sql = "UPDATE comment set comment = ? WHERE idx = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,editComment);
    query.setInt(2,editCommentIdx);
    query.executeUpdate();

    String idxParameter = "idx=" + pageIdx; 
    response.sendRedirect("../action/getContentAction.jsp?" + idxParameter);
%>