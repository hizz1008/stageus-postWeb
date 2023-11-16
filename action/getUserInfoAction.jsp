<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  String id = (String)session.getAttribute("loggedInId");
  String name = null; // 변수 미리 선언
  String email = null; // 변수 미리 선언

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

    // SQL문 작성 (동적으로 사용자의 ID를 검색)
    String sql = "SELECT id, name, email FROM account WHERE id = ?";
    
    // Query 생성
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, id);

    // SQL 실행
    ResultSet result = query.executeQuery();
    
    if (result.next()) {
        id = result.getString("id");
        name = result.getString("name");
        email = result.getString("email");
      
        //다음 페이지에 보낼 데이터
        request.setAttribute("id", id);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
              
        //데이터와 함께 다음 페이지 이동
        request.getRequestDispatcher("../page/userInfoPage.jsp").forward(request, response);
    }
    else{
      response.sendRedirect("../page/loginPage.jsp");
    }
%>
