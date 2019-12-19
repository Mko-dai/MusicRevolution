function UserPost() {
  //  楽曲詳細ページのユーザーのその他の投稿表示機能
  
  var userpost	= document.getElementById("userpost");
  var usercomment = document.getElementById("usercomment");
  if (userpost.className == "display_none"){
    userpost.className = "music-form";
    usercomment.className = "comment1"
  }else{
    userpost.className = "display_none";
    usercomment.className = "comment2"
  }
};