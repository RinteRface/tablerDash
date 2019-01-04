$(function () {
  var $tablinks = $("#mymenu .nav-item a");
  console.log($tablinks);
  $tablinks.not($(this)).parent("li").removeClass("active");
  $('#mymenu .nav-item:eq(0) a').addClass('active');
  $('.container-fluid.tab-pane:eq(0)').addClass('active show');
});
