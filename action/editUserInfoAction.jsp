<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  // POST로 전달된 데이터 읽기
  String newId = request.getParameter("id");
  String newName = request.getParameter("name");
  String newEmail = request.getParameter("email");
  String existingId = (String) session.getAttribute("loggedInId");
  String existingName = (String) session.getAttribute("name");
  //드라이브 연결
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");
  
  //바꾸려는 아이디 검사
  String sql = "SELECT * FROM account WHERE id = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setString(1,existingId);
  ResultSet result = query.executeQuery();

  //존재 한다면 현재 아이디를 제외한 새로운 아이디가 중복되어있는지 검사
  if (result.next()) {
    String duplicateCheckSql = "SELECT * FROM account WHERE (id = ? OR name = ?) AND (id != ? OR name != ?)";
    PreparedStatement duplicateCheckQuery = connect.prepareStatement(duplicateCheckSql);
    duplicateCheckQuery.setString(1, newId);
    duplicateCheckQuery.setString(2, newName);
    duplicateCheckQuery.setString(3, existingId);
    duplicateCheckQuery.setString(4, existingName);

    ResultSet duplicateCheckResult = duplicateCheckQuery.executeQuery();

    //있다면 중복된 아이디 문구를 보여주는 페이지로 이동
    if (duplicateCheckResult.next()) {
      response.sendRedirect("../page/duplicateTruePage.jsp");
    }
    
    // 없다면 업데이트
    else {
      String updateSql = "UPDATE account SET id=?, name = ?, email = ? WHERE id = ?";
      PreparedStatement updateQuery = connect.prepareStatement(updateSql);
      updateQuery.setString(1, newId);
      updateQuery.setString(2, newName);
      updateQuery.setString(3, newEmail);
      updateQuery.setString(4, existingId);
      updateQuery.executeUpdate();

      //세션 업데이트
      session.removeAttribute("name");
      session.removeAttribute("email");
      session.removeAttribute("loggedInId");
      session.setAttribute("loggedInId", newId);

      request.setAttribute("id", newId);
      request.setAttribute("name", newName);
      request.setAttribute("email", newEmail);
            
      //데이터와 함께 다음 페이지 이동
      request.getRequestDispatcher("../page/userInfoPage.jsp").forward(request, response);
    }
  } else {
    response.sendRedirect("../index.jsp");
  }
%>