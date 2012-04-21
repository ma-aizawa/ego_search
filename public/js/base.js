function setColor(){
  var keyword = $('#keyword').val();

  //見た目を変える
  $('.textBody').each(function(){
    $(this).html($(this).text().replace(keyword, "<b style='color:red'>" + keyword + "</b>"));
  });

  //ポイントを数える
  var count = $('.textBody').text().split(keyword).length - 1;
  var pointSum = count * $('#point').val();

  $('#countResult').text(pointSum + "ポイント");
}

