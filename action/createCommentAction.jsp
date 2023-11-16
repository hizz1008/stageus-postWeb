<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

  Class.forName("com.mysql.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  String loggedInId = (String) session.getAttribute("loggedInId");
  int idx = (int) session.getAttribute("pageIdx");

  String comment = request.getParameter("comment");

  int account_idx = -1;

    if(loggedInId == null || loggedInId == ""){
      response.sendRedirect("../page/loginPage.jsp");
    }else{
      String sql = "SELECT idx FROM account WHERE id = ?";
      PreparedStatement query = connect.prepareStatement(sql);
      query.setString(1, loggedInId);
      ResultSet result = query.executeQuery();
  
      if(result.next()){
        account_idx = result.getInt("idx");
        String insertSql = "INSERT INTO comment (content_idx, account_idx, comment) VALUES (?, ?, ?)";
        PreparedStatement insertQuery = connect.prepareStatement(insertSql);
        insertQuery.setInt(1, idx);
        insertQuery.setInt(2, account_idx);
        insertQuery.setString(3, comment);
  
        insertQuery.executeUpdate();
        response.sendRedirect("../action/getContentAction.jsp?idx=" + idx);
      }
    }
%>