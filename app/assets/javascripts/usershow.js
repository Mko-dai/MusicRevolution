function Usershow2Bar1() {
  var yajirushi = document.getElementById("toukouyajirushi2");
  var musiclist = document.getElementById("usershow2bar1");
  if ( yajirushi.className == "fas fa-chevron-down" ) {
    yajirushi.className = "fas fa-chevron-up";
    musiclist.className = "music"
  }else{
    yajirushi.className = "fas fa-chevron-down";
    musiclist.className = "display_none"
  }
};

function Usershow2Bar2() {
  var yajirushi = document.getElementById("toukouyajirushi3");
  var followlist = document.getElementById("usershow2bar2");
  if ( yajirushi.className == "fas fa-chevron-down" ) {
    yajirushi.className = "fas fa-chevron-up";
    followlist.className = "usershowfollowandfollower"
  }else{
    yajirushi.className = "fas fa-chevron-down";
    followlist.className = "display_none"
  }
};

function Usershow2Bar3() {
  var yajirushi = document.getElementById("toukouyajirushi4");
  var followerlist = document.getElementById("usershow2bar3");
  if ( yajirushi.className == "fas fa-chevron-down" ) {
    yajirushi.className = "fas fa-chevron-up";
    followerlist.className = "usershowfollowandfollower"
  }else{
    yajirushi.className = "fas fa-chevron-down";
    followerlist.className = "display_none"
  }
};