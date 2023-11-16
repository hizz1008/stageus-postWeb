<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
  String title = request.getParameter("title");
  String content = request.getParameter("content");
  String id = (String)session.getAttribute("loggedInId");
  int account_idx = -1; // account_idx 초기값 설정

  if(id == null || id == ""){
    response.sendRedirect("../page/loginPage.jsp");
  }

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

    // 사용자의 account_idx 가져오기
    String sql = "SELECT idx FROM account WHERE id = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, id);
    ResultSet result = query.executeQuery();

    if (result.next()) {
      account_idx = result.getInt("idx");

      connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");
      String insertSql = "INSERT INTO content (account_idx, title, content) VALUES (?, ?, ?)";
      PreparedStatement insertQuery = connect.prepareStatement(insertSql);
      insertQuery.setInt(1, account_idx);
      insertQuery.setString(2, title);
      insertQuery.setString(3, content); // content를 문자열로 처리
      insertQuery.executeUpdate();
      response.sendRedirect("../index.jsp");
    }
%>
