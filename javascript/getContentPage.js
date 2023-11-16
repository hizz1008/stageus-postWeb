document.title = title

// get content
function getContent(){
  document.title = title;
  var titleBox = document.createElement("h1");
  var nameBox = document.createElement("p");
  var contentBox = document.createElement("p");

  var titleContainer = document.querySelector(".title");
  var nameContainer = document.querySelector(".name");
  var contentContainer = document.querySelector(".content");

  titleContainer.appendChild(titleBox);
  nameContainer.appendChild(nameBox);
  contentContainer.appendChild(contentBox);

  titleBox.textContent = title
  nameBox.textContent = contentName
  contentBox.textContent = content
}
getContent()


// get comment
var getCommentSection = document.querySelector(".getCommentSection")

function getComment(){
  for (var i = 0; i < commentsData.commentTextList.length; i++) {
    var comment = document.createElement("form");
    var commentName = document.createElement("p");
    var commentText = document.createElement("p");
  
    comment.classList = "getComment"
    commentText.className = "commentText"
  
    commentName.textContent = commentsData.commentNameList[i];
    commentText.textContent = commentsData.commentTextList[i];
  
    getCommentSection.appendChild(comment);
    comment.appendChild(commentName);
    comment.appendChild(commentText);
    if(userIdx === commentAccountIdxList[i]){
      var editCommentBtn = document.createElement("button");
      var editCommentInput = document.createElement("input");
      var editCommentIDx = document.createElement("input");
      var editCommentActionBtn = document.createElement("input");
      var deleteCommentBtn = document.createElement("input");
  
      editCommentBtn.className = "editCommentBtn"
      editCommentInput.className = "editCommentInput"
      editCommentActionBtn.className = "editCommentActionBtn"
  
      deleteCommentBtn.type = "submit"
      deleteCommentBtn.className = "deleteCommentBtn"
      deleteCommentBtn.value = "삭제"
      
      editCommentInput.type = "hidden";
      editCommentActionBtn.type = "hidden";
      editCommentIDx.type = "hidden";
      editCommentIDx.value = commentIdxList[i];
      editCommentIDx.name = "commentIdx"
      editCommentInput.value = commentText.textContent;
      editCommentActionBtn.value = "수정"
      editCommentBtn.textContent = "수정";
      editCommentBtn.onclick = editClickEvent;
      deleteCommentBtn.onclick = deleteClickEvent;
  
      comment.appendChild(editCommentInput)
      comment.appendChild(editCommentBtn)
      comment.appendChild(editCommentActionBtn)
      comment.appendChild(editCommentIDx)
  
      comment.appendChild(deleteCommentBtn)
    }
  }
}
getComment()


// Events
var editContentAction = document.querySelector(".editContentAction")
editContentAction.onclick = editContentEvent

var deleteContentAction = document.querySelector(".deleteContentAction")
deleteContentAction.onclick = deleteContentEvent

function editContentEvent(e){
  e.preventDefault();
  var contentForm = document.querySelector(".contentForm");
  contentForm.action = "../action/editContentAction.jsp";
  contentForm.submit();
}

function deleteContentEvent(e){
  e.preventDefault();
  var contentForm = document.querySelector(".contentForm");
  contentForm.action = "../action/deleteContentAction.jsp";
  contentForm.submit();
}





function editClickEvent(e){
  e.preventDefault();
  var comment = e.currentTarget.parentElement;
  comment.action = "../action/editCommentAction.jsp"
  var commentText = comment.querySelector(".commentText");
  var editCommentBtn = comment.querySelector(".editCommentBtn")
  var editCommentInput = comment.querySelector(".editCommentInput");
  var editCommentActionBtn = comment.querySelector(".editCommentActionBtn");
  editCommentInput.name = "editComment"
  if(commentText.style.display == "none"){
    commentText.style.display = "block";
    editCommentInput.type = "hidden";
    editCommentActionBtn.type = "hidden";
    editCommentBtn.style.display = "block"


  }else{
    commentText.style.display = "none";
    editCommentInput.type = "text";
    editCommentActionBtn.type = "submit";
    editCommentBtn.style.display = "none";
  }
}

function deleteClickEvent(e){
  e.preventDefault();
  var comment = e.currentTarget.parentElement;
  comment.action = "../action/deleteCommentAction.jsp";
  comment.submit();
}

var editForm = document.querySelector(".editForm")
var deleteForm = document.querySelector(".deleteForm")
var contentFormSection = document.querySelector(".contentFormSection")
if (userIdx === contentAccountIdx) {
  contentFormSection.style.display = "flex"
} else {
  contentFormSection.style.display = "none"
}
var contentForm = document.querySelector(".contentForm")
var contentDotUl = document.querySelector(".contentDotUl")

contentForm.onclick = contentFormEvent

function contentFormEvent(){
  if(contentDotUl.style.visibility === "visible"){
    contentDotUl.style.visibility = "hidden";
  }else{
    contentDotUl.style.visibility = "visible"
  }
}

// 유효성 검사
var commentSubmitBtn = document.querySelector(".commentSubmitBtn")
commentSubmitBtn.onclick = commentSubmitEvent

function commentSubmitEvent(e){
  e.preventDefault()
  var comment = document.querySelector(".comment")
  if(comment.value == null || comment.value === ""){
    alert("댓글을 입력해주세요")
  }else{
    var createCommentForm = document.querySelector(".createCommentForm")
    createCommentForm.submit()
  }
}