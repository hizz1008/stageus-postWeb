<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  // POST로 전달된 데이터 읽기
  String newTitle = request.getParameter("title");
  String newContent = request.getParameter("content");

  int pageIdx = (int) session.getAttribute("pageIdx");
  String loggedInId = (String) session.getAttribute("loggedInId");

  // 드라이브 연결
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  // 현재 로그인된 유저 idx 검사
  int account_idx = -1;
  int pageFKIdx = -1;

  String sql = "SELECT idx FROM account WHERE id = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setString(1, loggedInId);
  ResultSet result = query.executeQuery();

  // 현재 유저 idx와 보고있는 게시물의 idx가 일치하는지 확인
  if (result.next()) {
    account_idx = result.getInt("idx");
    String checkSql = "SELECT account_idx FROM content WHERE idx = ?";
    PreparedStatement checkQuery = connect.prepareStatement(checkSql);
    checkQuery.setInt(1, pageIdx); // pageIdx를 사용하여 확인
    ResultSet checkResult = checkQuery.executeQuery();

    if (checkResult.next()) {
      pageFKIdx = checkResult.getInt("account_idx");
      account_idx = result.getInt("idx");
      if (pageFKIdx == account_idx) {
        String updateSql = "UPDATE content SET title=?, content = ? WHERE idx = ?";
        //AND를 사용하면 위 sql 체크 할 필요가 없음
        PreparedStatement updateQuery = connect.prepareStatement(updateSql);
        updateQuery.setString(1, newTitle);
        updateQuery.setString(2, newContent);
        updateQuery.setInt(3, pageIdx);
        updateQuery.executeUpdate();
        
        // 세션 업데이트
        session.removeAttribute("pageIdx");
        session.removeAttribute("account_idx");
        request.setAttribute("title", newTitle);
        request.setAttribute("content", newContent);
        
        // 데이터와 함께 다음 페이지 이동
        response.sendRedirect("../index.jsp");
      } else {
        response.sendRedirect("../index.jsp");
      }
    }
  } else {
    response.sendRedirect("../index.jsp");
  }
%>
