window.addEventListener('load', function(){
  const pullDownButton = document.getElementById("musical-instrument-list")
  const pullDownParents = document.getElementById("pull-down-b")
  
  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
})