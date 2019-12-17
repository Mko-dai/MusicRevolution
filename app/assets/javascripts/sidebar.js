function CloseSidebar1() {

  var Sidebar1	= document.getElementById("sidebaradd");
  var Sidebar2	= document.getElementById("sidebarnone");
  if (Sidebar1.className == "index_sidebar1"){
    Sidebar2.className = "index_sidebar2"
    Sidebar1.className = "index_sidebar1_display_none";
    
  }else{
    Sidebar1.className = "index_sidebar1";
    Sidebar2.className = "index_sidebar1_display_none"
  }
};