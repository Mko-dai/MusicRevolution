function UserPost() {
  //  楽曲詳細ページのユーザーのその他の投稿表示機能
  var userpost	= document.getElementById("userpost");
  var usercomment = document.getElementById("usercomment");
  var commentpost = document.getElementById("commentpost");
  var toukouyajirushi = document.getElementById("toukouyajirushi");
  if (userpost.className == "display_none"){
    userpost.className = "usermusic";
    usercomment.className = "comment1"
    toukouyajirushi.className = "fas fa-chevron-up"
    if (commentpost.className == "user2") {
      commentpost.className = "user1"
    }
  }else{
    userpost.className = "display_none";
    usercomment.className = "comment2"
    toukouyajirushi.className = "fas fa-chevron-down"
    if (commentpost.className == "user1"){
      commentpost.className = "user2"
    }
  }
};

function CommentPost() {
  //  楽曲詳細ページのコメントの表示機能
var userpost	= document.getElementById("userpost");
var commentpost = document.getElementById("commentpost");
var commentyajirushi = document.getElementById("commentyajirushi");

if (commentpost.className == "display_none" && userpost.className == "display_none"){
    commentpost.className = "user2";
    commentyajirushi.className = "fas fa-chevron-up"
  }else if(commentpost.className == "display_none" && userpost.className == "usermusic"){
    commentpost.className = "user1";
    commentyajirushi.className = "fas fa-chevron-up"
  }else{
    commentpost.className = "display_none";
    commentyajirushi.className = "fas fa-chevron-down"
  }
}

audiojs.events.ready(function() {
  var as = audiojs.createAll();
});