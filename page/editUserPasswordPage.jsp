<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String alertMsg = (String) request.getAttribute("alertMsg");
alertMsg = (alertMsg != null) ? alertMsg : "";
%>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/default.css">
  <link rel="stylesheet" href="../css/header.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/button.css">
  <link rel="stylesheet" href="../css/login.css">
  <title>비밀번호 변경</title>
</head>
<body class="logInBody">
  <header class="header"></header>
  <main class=" main logInMain">
    <p class="alertMsgPTag"></p>
    <form class="loginForm" action="../action/editUserPasswordAction.jsp">
      <p>현재 비밀번호</p>
      <input class="inputValueStyle" type="text" name="currentPassword">
      <p>변경 비밀번호</p>
      <input class="inputValueStyle changeValue1" type="password">
      <input class="inputValueStyle changeValue2" type="password" name="newPassword">

      <input class="btnStyle changePasswordBtn" type="submit" value="수정">
    </form>
  </main>
  <script>
    var alertMsg = "<%=alertMsg%>";
  </script>
  <script src="../javascript/notAccountBtnHeader.js"></script>
  <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
  <script src="../javascript/editUserPasswordPage.js"></script>
</body>