$(document).ready(function () {
  $('#submission').on('submit', function(event) {
    event.preventDefault()
    // console.log($('#url-input').val());

    $('#submit').val('Loading...')
    $.ajax({
      url: '/urls',
      method: 'post',
      data: {long_url: $('#url-input').val()},
      success: function(response) {
        response = JSON.parse(response)
        console.log(response);

        $('#url-list').append ("<tr><td>" +
        response['long_url'] + "</td><td>\
        <a href='/" + response['short_url'] + "'>"
        + "http://link.ly/" + response['short_url'] + "</a>"
        + "</td><td>" + "0"+ "</td></tr>")
        $('#submit').val("OK!")
      }
    })
  })
})
