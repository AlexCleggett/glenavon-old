jQuery(function() {
  var clones;
  clones = $('#vine_order_clone').html();
  console.log(clones);
  return $('#vine_order_clone').change(function() {
    var variety, options;
    variety = $('#vine_order_clone :selected').text();
    options = $(clones).filter("optgroup[label=" + variety + "]").html();
    console.log(options);
    if (options) {
      return $('#vine_order_clone').html(options);
    } else {
      return $('#vine_order_clone').empty();
    }
  });
});
