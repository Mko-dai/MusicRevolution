function CloseSidebar() {
  // トップページのサイドバー非表示処理  
  
  var Sidebar1	= document.getElementById("sidebaradd");
  var Main1 = document.getElementById("mainadd");

  if (Sidebar1.className == "index_sidebar1"){
    Sidebar1.className = "display_none";
    Main1.className = "index__main2"

  }else{
    Sidebar1.className = "index_sidebar1";
    Main1.className = "index__main1"
  }
};

function ChaneForm() {
  // 検索フォームの切り替え
  
  var musicform = document.getElementById("formmusic");
  var artistform = document.getElementById("formartist");
  var chatgroupform = document.getElementById("formchatgroup");

  if (musicform.className == "index_header__searchbar__form"){
    musicform.className = "display_none";
    artistform.className = "index_header__searchbar__form";
  }else if(artistform.className == "index_header__searchbar__form"){
    artistform.className = "display_none";
    chatgroupform.className = "index_header__searchbar__form";
  }else{
    chatgroupform.className = "display_none";
    musicform.className = "index_header__searchbar__form";
  }
}