$(document).ready(function() {
  displayEntry();
  hideEntry();
});

var displayEntry = function() {
  $('.entries-list').on('click', '.entry-title', function(event) {
    event.preventDefault();
    var that = $(this);
    var url = that.children().attr("href");
    // console.log(url);
    $.ajax({
      method: 'get',
      url: url,
      data: url
    })
    .done(function(response) {
      $(".entries-container").append(response);
    })
  })
}

var hideEntry = function() {
  $('.entries-container').on('click', '.hide-button', function(event) {
    $(".show-entry").hide();
  })
}