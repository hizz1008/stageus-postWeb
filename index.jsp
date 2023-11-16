<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%
    // 사용자가 로그인되었는지 확인 (세션에 사용자 정보가 있는지 확인)
    String loggedInId = (String) session.getAttribute("loggedInId");
%>
<!-- 임포트 하는 라이브러리 -->
<%
    session.removeAttribute("pageIdx");
    // JDBC 드라이버 클래스 로딩 및 DB 연결
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

    // SQL 쿼리 작성
    String sql = "SELECT idx, account_idx, title, create_date FROM content ORDER BY idx DESC;";
    PreparedStatement query = connect.prepareStatement(sql);
    ResultSet result = query.executeQuery();

    //데이터 정제
    ArrayList<String> titleList = new ArrayList<String>();
    ArrayList<String> dateList = new ArrayList<String>();
    ArrayList<Integer> account_idxList = new ArrayList<Integer>();
    ArrayList<String> nameList = new ArrayList<String>();
    ArrayList<Integer> idxList = new ArrayList<Integer>();

    // 1차 while문
    while (result.next()) {
      int account_idx = Integer.parseInt(result.getString("account_idx"));
      int idx = Integer.parseInt(result.getString("idx"));
      String title = result.getString("title");
      String date = result.getString("create_date");
      titleList.add("\"" + title + "\"");
      dateList.add("\"" + date + "\"");
      account_idxList.add(account_idx);
      idxList.add(idx);
    }

    int i = 0;
    // 2차 while문
    while (i < account_idxList.size()) {
      int idx = account_idxList.get(i);
      String nameSql = "SELECT name FROM account WHERE idx = ?";
      PreparedStatement nameQuery = connect.prepareStatement(nameSql);
      nameQuery.setInt(1, idx);
      ResultSet nameResult = nameQuery.executeQuery();
      if (nameResult.next()) {
        String name = nameResult.getString("name");
        nameList.add("\"" + name + "\"");
      }
    i++;
    }  
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/default.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/button.css">
    <title>Post Web</title>
</head>
<body>
    <header class="header">

    </header>
    <main class="main">
        <h1 class="postWebH1">게시글</h1>

        <section class="tableSection">
        </section>

        <form class="form contentForm">
          <input class="createContentPageBtn btnStyle" type="submit" value="게시글 작성" />
        </form>

    </main>
    <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
    <script>
      var loggedInId = "<%=session.getAttribute("loggedInId")%>";
      if (loggedInId == "null" || loggedInId === "") {
        var titleList = <%=titleList%>;
        var dateList = <%=dateList%>;
        var nameList = <%=nameList%>;
        var idxList = <%=idxList%>;

        var script = document.createElement("script");
        script.src = "./javascript/notLoginForm.js";
        document.body.appendChild(script);
      } else {
        var titleList = <%=titleList%>;
        var dateList = <%=dateList%>;
        var nameList = <%=nameList%>;
        var idxList = <%=idxList%>;

        var script = document.createElement("script");
        script.src = "./javascript/loggedInForm.js";
        document.body.appendChild(script);
      }
    </script>
    <script src="./javascript/getContent.js"></script>
</body>
</html>
