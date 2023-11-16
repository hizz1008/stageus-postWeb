<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/button.css">
    <link rel="stylesheet" href="../css/createContentPage.css">

    <title>게시글 작성</title>
  </head>
  <body>
    <header class="header"></header>
    <main class="main">
      <form class="createContentForm" action="../action/createContentAction.jsp"
      class="createPostForm">
        <article class="createPostArticle">
            <label for="title">제목
              <input name="title" class="createPostTitleInput" type="text" id="title" />
            </label>

        </article>
        <article class="createPostArticle">
            <label class="createPostLable" for="content">내용
              <textarea
              name="content"
              class="createPostContent"
              type="text"
              id="content"
            ></textarea>
            </label>
        </article>
        <input class="createPostBtn btnStyle" type="submit" value="등록" onclick="submitEvent(event)"/>
      </form>
      <footer></footer>
    </main>
    <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
    <script src="../javascript/notAccountBtnHeader.js"></script>
    <script src="../javascript/createContentPage.js"></script>
  </body>
</html>
