function createHeader(){
  var header = document.querySelector(".header");
  var logoText = document.createElement("a")
  logoText.textContent = "Post Web"
  logoText.href = "../index.jsp"
  header.appendChild(logoText)
  var lightIcon = document.createElement("i")
  lightIcon.id = "lightIcon"
  lightIcon.className = "fa-regular fa-lightbulb"
  header.appendChild(lightIcon)
  var form = document.createElement("form");
  form.className = "form accountForm formStyle"
  header.appendChild(form)
  var userInfoBtn = document.createElement("input")
  userInfoBtn.className = "loginPageBtn btnStyle btnMarginRight"
  userInfoBtn.type = "submit"
  userInfoBtn.value = "로그인"
  form.appendChild(userInfoBtn)
  var logoutBtn = document.createElement("input")
  logoutBtn.className = "signupPageBtn btnStyle buleBtn"
  logoutBtn.type = "submit"
  logoutBtn.value = "회원가입"
  form.appendChild(logoutBtn)
}
createHeader()

var form = document.querySelector(".form")
var createContentPageBtn = document.querySelector(".createContentPageBtn")
createContentPageBtn.onclick = createContentEvent
function createContentEvent(e){
  e.preventDefault();
  form.action = "./action/loginCheckAction.jsp"
  form.submit()
}

var loginPageBtn = document.querySelector(".loginPageBtn")
loginPageBtn.onclick = loginPageEvent
function loginPageEvent(e){
  e.preventDefault();
  form.action = "./page/loginPage.jsp";
  form.submit()
}
var signupPageBtn = document.querySelector(".signupPageBtn")
signupPageBtn.onclick = signupPageEvent
function signupPageEvent(e){
  e.preventDefault();
  form.action = "./page/signupPage.jsp";
  form.submit()
}

lightIcon.onclick = lightIconEvent

function lightIconEvent(){
  if(document.body.style.color === "white"){
    document.body.style.color = "black"
  }
}