function createLoggedInHeader(){
  var header = document.querySelector(".header");
  var logoText = document.createElement("a")
  var baseUrl = "http://15.164.221.192:8080/postWeb/index.jsp"
  var baseUrl2 = "http://15.164.221.192:8080/postWeb/"
  var currentUrl = window.location.href

  logoText.textContent = "Post Web"
  if(currentUrl == baseUrl || currentUrl == baseUrl2){
    logoText.href = "./index.jsp"
  }else{
    logoText.href = "../index.jsp"
  }

  header.appendChild(logoText)

  var form = document.createElement("form");
  form.className = "form accountForm formStyle"
  header.appendChild(form)
  var userInfoBtn = document.createElement("input")
  userInfoBtn.className = "userInfoBtn btnStyle btnMarginRight"
  userInfoBtn.type = "submit"
  userInfoBtn.value = "내 정보"
  form.appendChild(userInfoBtn)
  var logoutBtn = document.createElement("input")
  logoutBtn.className = "logoutBtn btnStyle buleBtn btnMarginRight"
  logoutBtn.type = "submit"
  logoutBtn.value = "로그아웃"
  form.appendChild(logoutBtn)
  var lightIcon = document.createElement("i")
  lightIcon.id = "lightIcon"
  lightIcon.className = "fa-regular fa-lightbulb"
  form.appendChild(lightIcon)
}
createLoggedInHeader()
var form = document.querySelector(".accountForm")
var userInfoBtn = document.querySelector(".userInfoBtn")
userInfoBtn.onclick = userInfoBtnEvent
function userInfoBtnEvent(e){
  e.preventDefault();
  form.action = "./action/getUserInfoAction.jsp";
  form.submit()
}
var logoutBtn = document.querySelector(".logoutBtn")
logoutBtn.onclick = logoutBtnEvent
function logoutBtnEvent(e){
  e.preventDefault();
  form.action = "./action/logoutAction.jsp";
  form.submit()
}

var createContentPageBtn = document.querySelector(".createContentPageBtn")
createContentPageBtn.onclick = createContentEvent;
function createContentEvent(e){
  e.preventDefault();
  form.action = "./page/createContentPage.jsp"
  form.submit()
}