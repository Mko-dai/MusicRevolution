



function UserPost() {
  //  楽曲詳細ページのユーザーのその他の投稿表示機能
  var userpost	= document.getElementById("userpost");
  var usercomment = document.getElementById("usercomment");
  var commentpost = document.getElementById("commentpost");

  if (userpost.className == "display_none"){
    userpost.className = "usermusic";
    usercomment.className = "comment1"
    if (commentpost.className == "user2") {
      commentpost.className = "user1"
    }
  }else{
    userpost.className = "display_none";
    usercomment.className = "comment2"
    if (commentpost.className == "user1"){
      commentpost.className = "user2"
    }
  }
};

function CommentPost() {
  var userpost	= document.getElementById("userpost");
var commentpost = document.getElementById("commentpost");

  if (commentpost.className == "display_none" && userpost.className == "display_none"){
    commentpost.className = "user2";

  }else if(commentpost.className == "display_none" && userpost.className == "usermusic"){
    commentpost.className = "user1";
  }else{
    commentpost.className = "display_none";
  }
}