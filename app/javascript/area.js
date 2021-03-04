window.addEventListener('load', function(){
  const pullDownButton = document.getElementById("area-list")
  const pullDownParents = document.getElementById("pull-down-a")
  
  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
})