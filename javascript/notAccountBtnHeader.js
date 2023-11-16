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
}
createHeader()

lightIcon.onclick = lightIconEvent

function lightIconEvent(){
  if(document.body.style.color === "white"){
    document.body.style.color = "black"
  }
}