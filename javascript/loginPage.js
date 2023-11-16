var loginForm = document.querySelector(".loginForm");
var loginSubmit = document.querySelector(".loginSubmit");
var signupSubmit = document.querySelector(".signupSubmit");

loginSubmit.onclick = loginSubmitEvent
var idValue = document.querySelector(".idValue")
var passwordValue = document.querySelector(".passwordValue")
function validateId(id){
  var regex = /^[a-zA-Z0-9]+$/;
  return regex.test(id)
}
function loginSubmitEvent(e){
  e.preventDefault()
  if(idValue.value == "id" || !validateId(idValue.value)){
    return alert("올바른 형식의 아이디를 입력해주세요")
  }
  loginForm.action = "../action/loginAction.jsp"
  loginForm.submit()
}
signupSubmit.onclick = signupSubmitEvent
function signupSubmitEvent(e){
  e.preventDefault()
  loginForm.action = "./signupPage.jsp"
  loginForm.submit()
}

idValue.onfocus = idFocusEvent
idValue.onblur = idBlurEvent

passwordValue.onfocus = passwordFocusEvent
passwordValue.onblur = passwrodBlurEvent

function idFocusEvent(e){
  if(e.target.value == "id" ){
    e.target.value = ""        
  }else{
    return
  }
}
function idBlurEvent(e){
  if(e.target.value == ""){
    e.target.value = "id"
  }else{
    return
  }
}
function passwordFocusEvent(e){
  if(e.target.value == "password" ){
    e.target.value = "" 
    e.target.type = "password"
  }else{
    return
  }
}
function passwrodBlurEvent(e){
  if(e.target.value == ""){
    e.target.value = "password"
    e.target.type = "text";
  }else{
    return
  }
}