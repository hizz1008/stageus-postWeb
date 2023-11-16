function validateId(id){
  var regex = /^[a-zA-Z0-9]+$/;
  return regex.test(id)
}


function signupSubmitEvent(e){
  e.preventDefault()
  var loginForm = document.querySelector(".loginForm")
  var userProfile = ["id","pw","name","email"]
  for (var i = 0; i < userProfile.length; i++){
    var value =  document.querySelector("."+userProfile[i]).value
    if(value == null || value === ""){
      return alert("모두 입력해주세요");
    }else if(userProfile[i] === "id" && !validateId(value)){
      return alert("올바른 형식의 아이디를 입력해주세요")
    }
  }
  loginForm.action = "../action/signupAction.jsp";
  loginForm.submit();
}