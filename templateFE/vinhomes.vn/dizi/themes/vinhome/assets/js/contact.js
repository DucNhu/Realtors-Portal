$('#messages').keyup(function () {
    var left = 157 - $(this).val().length;
    if (left < 0) {
        left = 0;
    }
    text = $('#counter').data('text');
    $('#counter').text(left + ' '+text);
});