const SIDE_NAVIGATION_WIDTH = "320px";

function openNav() {
  document.getElementById("sideNavigation").style.width = SIDE_NAVIGATION_WIDTH;
  // Show page overlay
  document.getElementById("pageOverlay").style.width = "100%";
  document.getElementById("pageOverlay").style.opacity = "0.8";
}

function closeNav() {
  document.getElementById("sideNavigation").style.width = "0";
  document.getElementById("mainContent").style.paddingLeft = "0";
  // Hide page overlay
  document.getElementById("pageOverlay").style.width = "0%";
  document.getElementById("pageOverlay").style.opacity = "0";
}

window.addEventListener("scroll", function () {
  let scrollY = window.scrollY;
  if (scrollY >= 154) {
    document.getElementById("navBar").style.position = "fixed";
    document.getElementById("navBar").style.top = "0";

    document.getElementById("navBar").style.animationName = "navbar";
  } else {
    document.getElementById("navBar").style.position = "absolute";

    document.getElementById("navBar").style.animationName = "none";
  }
});
