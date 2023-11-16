<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/post_web", "stageus", "1234");

  // 콘텐츠 값
  int contentAccountIdx = -1;
  String title = null;
  String content = null;
  String contentName = null;

  // 코멘트 값
  int commentAccountIdx = -1;
  int commentIdx = -1;
  String commentText = null;
  String commentName = null;
  ArrayList<Integer> commentAccountIdxList = new ArrayList<Integer>();
  ArrayList<Integer> commentIdxList = new ArrayList<Integer>();
  ArrayList<String> commentTextList = new ArrayList<String>();
  ArrayList<String> commentNameList = new ArrayList<String>();
  
  // "idx" 파라미터 값을 가져오기
  int pageIdx = Integer.parseInt(request.getParameter("idx"));
  session.setAttribute("pageIdx", pageIdx);

  String sql = "SELECT * FROM content WHERE idx = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, pageIdx);
  ResultSet result = query.executeQuery();



  if (result.next()) {
    contentAccountIdx = result.getInt("account_idx");
    title = result.getString("title");
    content = result.getString("content");

    request.setAttribute("contentAccountIdx", contentAccountIdx);
    request.setAttribute("title", title);
    request.setAttribute("content", content);
    request.setAttribute("contentAccountIdx", contentAccountIdx);

    String nameSql = "SELECT name FROM account WHERE idx = ?";
    PreparedStatement nameQuery = connect.prepareStatement(nameSql);
    nameQuery.setInt(1, contentAccountIdx);
    ResultSet nameResult = nameQuery.executeQuery();

    if (nameResult.next()) {
      contentName = nameResult.getString("name");
      request.setAttribute("contentName", contentName);
    }
  }

  String getCommentSql = "SELECT idx, account_idx, comment FROM comment WHERE content_idx = ?";
  PreparedStatement getCommentQuery = connect.prepareStatement(getCommentSql);
  getCommentQuery.setInt(1, pageIdx);
  ResultSet getCommentResult = getCommentQuery.executeQuery();
  while (getCommentResult.next()) {
    commentAccountIdx = getCommentResult.getInt("account_idx");
    commentText = getCommentResult.getString("comment");
    commentIdx  = getCommentResult.getInt("idx");
    commentAccountIdxList.add(commentAccountIdx);
    commentTextList.add("\"" + commentText + "\"");
    commentIdxList.add(commentIdx);
    


    String getCommentNameSql = "SELECT name FROM account WHERE idx = ?";
    PreparedStatement getCommentNameQuery = connect.prepareStatement(getCommentNameSql);
    getCommentNameQuery.setInt(1, commentAccountIdx);
    ResultSet getCommentNameResult = getCommentNameQuery.executeQuery();
    if (getCommentNameResult.next()) {
      commentName = getCommentNameResult.getString("name");
      commentNameList.add("\"" + commentName + "\"");
    }
  }
  request.setAttribute("commentNameList", commentNameList);
  request.setAttribute("commentTextList", commentTextList);
  request.setAttribute("commentAccountIdxList", commentAccountIdxList);
  request.setAttribute("commentIdxList", commentIdxList);
  request.getRequestDispatcher("../page/getContentPage.jsp").forward(request, response);
%>
