// $(document).ready(function() {
//   var name = $(location).attr('href').replace('http://localhost:9393/', '');
//   $.ajax({
//     url: "refresh_cache",
//     type: "POST",
//     data: {username: name},
//     dataType: "html",
//     success: function(result){
//       $("#loading").hide();
//       $("#recent").append(result);
//     }
//   });
// });

$(document).ready(function() {
  $("form").submit(function(e) {
    e.preventDefault();
    $("form :input[type='text']").prop('disabled', true);
    $("#msg").html("Please wait. Your tweet is being processed!");
    var text = $("form :input[name='tweet']").val();

    $.ajax({
      url: "/tweet_it",
      type: "POST",
      data: {tweet: text},
      dataType: "html",
      success: function(result){
        console.log(result);
        $("#msg").html(result);
      }
    });
  });
});

