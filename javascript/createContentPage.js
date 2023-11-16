function submitEvent(e){
  e.preventDefault();

  var contentInput = document.querySelector(".createPostContent");
  var createPostTitleInput = document.querySelector(".createPostTitleInput")
  var title = createPostTitleInput.value
  var content = contentInput.value;
  if(title == null || title === ""){
    alert("제목을 입력해주세요")
  }
  else if(content == null || content === ""){
    alert("내용을 입력해주세요")
  }
  else{
    content = content.replace(/\n/g," ");
    contentInput.value = content;
  
    var createContentForm = document.querySelector(".createContentForm")
  
    createContentForm.submit()
  }
}