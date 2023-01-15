'use strict';

$(document).ready(function () {
  $('#cbx_chkAll').click(function () {
    if ($('#cbx_chkAll').is(':checked'))
      $('input[name=chk]').prop('checked', true);
    else $('input[name=chk]').prop('checked', false);
  });

  $('input[name=chk]').click(function () {
    var total = $('input[name=chk]').length;
    var checked = $('input[name=chk]:checked').length;

    if (total != checked) $('#cbx_chkAll').prop('checked', false);
    else $('#cbx_chkAll').prop('checked', true);
  });
});
