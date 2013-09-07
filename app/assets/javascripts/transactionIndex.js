/**
 * helpers for the transactions/index.html.erb page
 */

$(document).ready(function() {
  $('.tagSelector').change(function() {
    var transaction_id = $(this).attr('id').substring(2);
    var new_value = $(this).val();
    $.post('/transactions/set_tag', {id: transaction_id, tag_id: new_value});
  });
});

