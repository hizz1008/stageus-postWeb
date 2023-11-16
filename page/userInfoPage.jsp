<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  // 포워드로 전달된 데이터 읽기
  String id = (String) request.getAttribute("id");
  String name = (String) request.getAttribute("name");
  String email = (String) request.getAttribute("email");  

  session.setAttribute("name", name);
  session.setAttribute("email", email);
%>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="../css/default.css">
  <link rel="stylesheet" href="../css/header.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/button.css">
  <link rel="stylesheet" href="../css/userInfoPage.css">
  <title>User Info Page</title>
</head>
<body>
  <header class="header"></header>
  <main class="main">
    <i id="userIcon" class="fa-solid fa-user"></i>
    <p class="id"></p>
    <p class="name"></p>
    <p class="email"></p>
    <section class="formSection">
      <form action="../page/editUserInfoPage.jsp" method="post">
        <input class="btnStyle btnMarginRight" type="submit" value="수정">
      </form>
      <form action="../action/deleteUserAction.jsp" method="post">
        <input class="btnStyle" type="submit" value="삭제">
      </form>
    </section>
  </main>
  <script src="../javascript/loggedInForm.js"></script>
  <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
  <script>
    var id = "<%=id%>";
    var name = "<%=name%>";
    var email = "<%=email%>";
    console.log(id,name,email)

    var idElement = document.querySelector(".id");
    idElement.textContent = "id : "+id;

    var nameElement = document.querySelector(".name");
    nameElement.textContent = "name : "+name;

    var emailElement = document.querySelector(".email");
    emailElement.textContent = "email : "+email;
  </script>
</body>


