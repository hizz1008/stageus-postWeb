<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String id = (String) session.getAttribute("loggedInId");
  String name = (String) session.getAttribute("name");
  String email = (String) session.getAttribute("email");
%>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="../css/default.css">
  <link rel="stylesheet" href="../css/header.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/button.css">
  <link rel="stylesheet" href="../css/login.css">
  <title>User Info Page</title>
</head>
<body class="logInBody">
  <header class="header"></header>
  <main class="main logInMain">
    <form class="loginForm" action="../action/editUserInfoAction.jsp">


        <input class="id inputValueStyle" type="text" name="id" >
      
        <input class="name inputValueStyle" type="text" name="name" >
      
        <input class="email inputValueStyle" type="text" name="email" >
      
      <input class="btnStyle" type="submit" value="수정">
    </form>
    <a href="../page/editUserPasswordPage.jsp">비밀번호 변경</a>
  </main>
  <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
  <script src="../javascript/notAccountBtnHeader.js"></script>
  <script>
    var id = "<%=id%>";
    var name = "<%=name%>";
    var email = "<%=email%>";

    var idElement = document.querySelector(".id");
    idElement.value = id
    var nameElement = document.querySelector(".name");
    nameElement.value = name
    var emailElement = document.querySelector(".email");
    emailElement.value = email
  </script>
</body>


