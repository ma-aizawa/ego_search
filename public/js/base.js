var resultSum = 0;

function setColor(){
  var keyword = $('#keyword').val();

  //見た目を変える
  $('.textBody').each(function(){
    $(this).html($(this).text().replace(keyword, "<b style='color:red'>" + keyword + "</b>"));
  });

  //ポイントを数える
  var count = $('.textBody').text().split(keyword).length - 1;
  var point = $('#point').val();
  var pointSum = count * point;

  var addHtml = '<b>' + keyword + '</b>:' + pointSum + 'pt     [Hit:' + count + '][Point:' + point + ']<br/>';
  $('#countResult').html($('#countResult').html() + addHtml);

  //累計の記載
  resultSum += pointSum;
  var sumHtml = "<b>累計：" + resultSum + "pt</b>";
  $('#resultSum').html(sumHtml);
}

