$(document).ready(function() {
  $('#upvote').on('click', function(event){
    event.preventDefault();
    $.post(url, data, .....){
      change the vote count in the view
    }
  })
});
