<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

    //현재 유저 idx
    int userIdx = -1;

    String title = (String) request.getAttribute("title");
    String content = (String) request.getAttribute("content");
    String contentName = (String) request.getAttribute("contentName");
    int contentAccountIdx = (int) request.getAttribute("contentAccountIdx");

    // 코멘트 값
    ArrayList<Integer> commentAccountIdxList = (ArrayList<Integer>) request.getAttribute("commentAccountIdxList");
    ArrayList<Integer> commentIdxList = (ArrayList<Integer>) request.getAttribute("commentIdxList");
    ArrayList<String> commentTextList = (ArrayList<String>) request.getAttribute("commentTextList");
    ArrayList<String> commentNameList = (ArrayList<String>) request.getAttribute("commentNameList");

    
      Class.forName("com.mysql.jdbc.Driver");
      Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

      if (session.getAttribute("loggedInId") != null) {
        String id = (String)session.getAttribute("loggedInId");
        String sql = "SELECT idx FROM account WHERE id = ?";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1, id);
        ResultSet result = query.executeQuery();
        if(result.next()){
          userIdx = result.getInt("idx");
        }
    }
%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/button.css">
    <link rel="stylesheet" href="../css/getContent.css">
</head>
<body>
  <header class="header">

  </header>
  <main class="main contentMain">
    <section class="contentFormSection">
      <form class="contentForm">
        <i id="contentDot" class="fa-solid fa-ellipsis-vertical"></i>
        </div>
      </form>
      <ul class="contentDotUl">
        <li class="editContentAction">수정</li>
        <li class="deleteContentAction">삭제</li>
      </ul>
    </section>
    <article class="title">
    </article>
    <article class="name">
    </article>
    <article class="content">
    </article>

    <section class="createCommentSection">
      <form action="../action/createCommentAction.jsp" class="createCommentForm">
        <input type="text" name="comment" class="comment">
        <input type="submit" class="btnStyle btnMarginLeft commentSubmitBtn" value="등록">
      </form>
    </section>

    <section class="getCommentSection">
    </section>
  </main>
  <script>
    var title = "<%=title%>";
    var content = "<%=content%>";
    var contentName = "<%=contentName%>";
    var contentAccountIdx = <%=contentAccountIdx%>;
    var commentAccountIdxList = <%=commentAccountIdxList%>;
    var commentIdxList = <%=commentIdxList%>;

    var userIdx = <%=userIdx%>;

    var commentsData = {
      commentTextList: <%=commentTextList%>,
      commentNameList: <%=commentNameList%>
    };
  </script>
  <script src="https://kit.fontawesome.com/e8e74eadbe.js" crossorigin="anonymous"></script>
  <script src="../javascript/notAccountBtnHeader.js"></script>
    <script src="../javascript/getContentPage.js"></script>

</body>