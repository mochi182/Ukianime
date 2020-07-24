function openNav() {
    document.getElementById("sideNavigation").style.width = "220px";
    document.getElementsByTagName("body")[0].style.marginLeft = "220px";
}
 
function closeNav() {
    document.getElementById("sideNavigation").style.width = "0";
    document.getElementsByTagName("body")[0].style.marginLeft = "0";
}