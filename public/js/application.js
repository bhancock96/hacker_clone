$(document).ready(function() {
  $('#upvote').on('submit', function(event){
    event.preventDefault();
    var url = $(this).attr('action')
    // $.post(url, function(response)){
    //   change the vote count in the view
    }
  })
});
