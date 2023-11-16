var changePasswordBtn = document.querySelector(".changePasswordBtn")
changePasswordBtn.onclick = changePasswordEvent

function changePasswordEvent(e){
  e.preventDefault()
  var loginForm = document.querySelector(".loginForm")
  var changeValue1 = parseInt(document.querySelector(".changeValue1").value)
  var changeValue2 = parseInt(document.querySelector(".changeValue2").value)
  if(changeValue1 == changeValue2){
    loginForm.submit()
  }else{
    alert("변경하려는 비밀번호가 일치하지 않습니다")
  }
}
function alertMsgCheck(){
  var alertMsgPTag = document.querySelector(".alertMsgPTag")
  if(alertMsg == null || alertMsg === ""){
    alertMsgPTag.style.display = "none"
  }else{
    alertMsgPTag.textContent = alertMsg
  }
}
window.onload = alertMsgCheck()