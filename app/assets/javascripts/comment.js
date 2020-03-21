$(function(){
  function buildHTML(comment){
    var userimage = `<img src="${comment.userimage}" class="userphoto">`
    var html = `<div class=talk><div class="user__image"><a href=/users/${comment.user_id}><img src="${comment.userimage}" class="userphoto"></a></div><div class="user-chat"><p>${comment.comment}</p></div></div>`
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
    $("#commentpost").append(html);
  })
  .fail(function(){
    alert('error')
  });
  return false;
});
})