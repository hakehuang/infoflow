function update_range_div(cata) {
  jQuery.ajax({
    url: "/update_range",
    type: "GET",
    data: {"cata" : cata},
    dataType: "html"
    success: function(data) {
      jQuery("#rangeDiv").html(data);
    }
  });
}
