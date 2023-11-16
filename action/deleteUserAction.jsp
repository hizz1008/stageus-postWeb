<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

  // 드라이브 연결
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  String loggedInId = (String) session.getAttribute("loggedInId");
  
  int account_idx = -1;

  // 해당 유저 인덱스 번호 찾기
  String sql = "SELECT idx FROM account WHERE id = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setString(1, loggedInId);
  ResultSet result = query.executeQuery();

  if(result.next()){
    account_idx = result.getInt("idx");
    // 해당 유저의 모든 댓글 지우기
    String deletecommentSql = "DELETE FROM comment WHERE account_idx = ?";
    PreparedStatement deletecommentQuery = connect.prepareStatement(deletecommentSql);
    deletecommentQuery.setInt(1, account_idx);
    int deletecommentResult = deletecommentQuery.executeUpdate();
    // 해당 유저의 모든 콘텐츠 지우기
    
    String deleteContentSql = "DELETE FROM content WHERE account_idx = ?";
    PreparedStatement deleteContentQuery = connect.prepareStatement(deleteContentSql);
    deleteContentQuery.setInt(1, account_idx);
    int deleteContentResult = deleteContentQuery.executeUpdate();


    if(deleteContentResult >= 0){
      // 해당 유저 삭제
      String deleteUserSql = "DELETE FROM account WHERE id = ?";
      PreparedStatement deleteUserQuery = connect.prepareStatement(deleteUserSql);
      deleteUserQuery.setString(1, loggedInId);
      int deleteUserResult = deleteUserQuery.executeUpdate();
      if(deleteUserResult > 0){
        session = request.getSession();
        session.invalidate();
        response.sendRedirect("../index.jsp");
      }
    }
  }
%>