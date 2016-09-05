$(document).ready(function() {
  displayEntry();
  hideEntry();
  displayReminder();
  hideReminder();
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

var displayReminder = function() {
  $('.entries-container').on('submit', '.reminder-button', function(event) {
    event.preventDefault();
    reminderData = $(this).serialize();
    $.ajax({
      method: 'post',
      url: '/reminders',
      data: reminderData
    })
    .done(function(response) {
      // console.log(response);
      $(".entries-container").append(response);
    })
  })
}

var hideReminder = function() {
  $('.entries-container').on('click', '.hide-button', function(event) {
    $(".show-reminder").hide();
  })
}