$(function(){
  function buildHTML(comment){
    var userimage = (comment.userimage !== null) ? `<img src="${comment.userimage}" class="userphoto">` : `<img src="/assets/member_photo_noimage-224a733c50d48aba6d9fdaded809788bbeb5ea5f6d6b8368adaebb95e58bcf53.png" class="userphoto">`
    var html = `<div class="talk" data-comment-id="${comment.id}"><div class="user__image"><a href=/users/${comment.user_id}>${userimage}</a></div><div class="user-chat"><p>${comment.comment}</p></div></div>`
  return html;
};
$("#newcomment").on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action');
  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false
  })
  .done(function(data){
    var html = buildHTML(data);
    $(".talktalk").append(html);
  })
  .fail(function(){
    alert('error')
  });
  return false;
});

var autoreload = function() {
  // if(window.location.href.match(/\/audios\/\d/)){
    var last_comment_id = $('.talk:last').data('comment-id');
    $.ajax({
      url: '/api/comments',
      type: 'GET',
      dataType: 'json',
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      var insertHTML = '';
      comments.forEach(function(comment){
      var num = buildHTML(comment) + insertHTML;
      $('.talktalk').append(num)
      $('html,body').animate({scrollTop: $('html,body')[0].scrollHeight}, 'fast');
      });
    })
    .fail(function() {
    });}
    setInterval(autoreload, 5000);
  }/* } */);