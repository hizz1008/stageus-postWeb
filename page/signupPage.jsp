<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/index.css">
  <link rel="stylesheet" href="../css/default.css">
  <link rel="stylesheet" href="../css/header.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/login.css">
  <link rel="stylesheet" href="../css/button.css">
  <title>회원가입</title>
</head>
<body class="logInBody">
  <header class="header"></header>

  <main class="main logInMain">
    <i id="userIcon" class="fa-solid fa-user"></i>
    <form class="loginForm">

        <p>ID</p>
        <input class="id inputValue inputValueStyle" name="id" type="text">

        <p>PassWord</p>
        <input class="pw inputValue inputValueStyle" name="password" type="text">
    
        <p>Name</p>
        <input class="name inputValue inputValueStyle" name="name" type="text">
    
        <p>Email</p>
        <input class="email inputValue inputValueStyle" name="email" type="text">
    
      <input class="signupSubmit" type="submit" value="회원가입" onclick="signupSubmitEvent(event)">
    </form>
  </main>
  <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
  <script src="../javascript/notAccountBtnHeader.js"></script>
  <script src="../javascript/signupPage.js"></script>
</body>