$(document).on('page:change', function(){
    $('#leave_review_btn').click( function(){
        $('.show_review_form').slideDown(600);
        $('#leave_review_btn').hide();
    });    
});