<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  int userIdx = -1;
  String currentPassword = request.getParameter("currentPassword");
  String newPassword = request.getParameter("newPassword");

  String id = (String) session.getAttribute("loggedInId");

  // 드라이버 연결
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  String sql = "SELECT idx FROM account WHERE id = ? AND password = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setString(1, id);
  query.setString(2, currentPassword);
  ResultSet result = query.executeQuery();

  if (result.next()) {
    userIdx = result.getInt("idx");
    String changePasswordSql = "UPDATE account SET password = ? WHERE idx = ?";
    PreparedStatement changePasswordQuery = connect.prepareStatement(changePasswordSql);
    changePasswordQuery.setString(1, newPassword);
    changePasswordQuery.setInt(2, userIdx);
    changePasswordQuery.executeUpdate();

    String alertMsg = "비밀번호 변경이 완료 되었습니다";
    request.setAttribute("alertMsg", alertMsg);
    request.getRequestDispatcher("../page/editUserPasswordPage.jsp").forward(request, response);
  }else{
    String alertMsg = "현재 비밀번호가 일치하지 않습니다";
    request.setAttribute("alertMsg", alertMsg);

    request.getRequestDispatcher("../page/editUserPasswordPage.jsp").forward(request, response);
  }
%>
