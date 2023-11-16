<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  String title = (String) request.getAttribute("title");
  String content = (String) request.getAttribute("content");
%>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="../css/default.css">
  <link rel="stylesheet" href="../css/header.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/button.css">
  <link rel="stylesheet" href="../css/editContentPage.css">
  <title>User Info Page</title>
</head>
<body>
  <header class="header"></header>
  <main class="main">
    <form class="updateContentform" action="../action/updateEditContentAction.jsp">
      <label for="title">제목
        <input class="updateTitle" type="text" name="title" id="title">
      </label>
      
      <label for="content">내용
        <textarea class="updateContent" type="text" name="content" id="content" ></textarea>
      </label>

      <input class="btnStyle" type="submit" value="수정"></input>
    </form>
  </main>
  <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
  <script src="../javascript/notAccountBtnHeader.js"></script>
  <script>
    var title = "<%=title%>";
    var content = "<%=content%>";
    
    var titleElement = document.querySelector(".updateTitle");
    titleElement.value = title
    var contentElement = document.querySelector(".updateContent");
    contentElement.value = content
  </script>
</body>


