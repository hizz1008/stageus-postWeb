<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSP 라이브러리 임포트하는 방법 -->
<!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
  request.setCharacterEncoding("utf-8");
  // 해당 데이터를 어떻게 가져올 것인지에 대한 인코딩 설정
  String id = request.getParameter("id");
  String password = request.getParameter("password");
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  // 받아온 데이터에 대한 명시

  // connector 파일 불러오기
  Class.forName("com.mysql.jdbc.Driver");
  
  // 데이터베이스 연결
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");
  // 경로, 아이디, 패스워드

  // 중복 아이디 확인을 위한 구문
  String duplicateCheck = "SELECT id, name FROM account WHERE id = ? OR name = ?";
  PreparedStatement query = connect.prepareStatement(duplicateCheck);
  query.setString(1, id);
  query.setString(2, name);
  ResultSet resultSet = query.executeQuery();
  if(resultSet.next()){
    response.sendRedirect("../page/duplicateTruePage.jsp");
  }else{
    String sql = "INSERT INTO account (id, password, name, email) VALUES (?, ?, ?, ?)";
    query = connect.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, password);
    query.setString(3, name);
    query.setString(4, email);
    // 쿼리 실행
    query.executeUpdate();

    session.setAttribute("loggedInId", id);
    response.sendRedirect("../index.jsp");
  }
%>
