$(document).ready(function(){
    $('.fa-eye-slash').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye").parent()
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye-slash").parent()
            .prev('input').attr('type','password');
        }
    });
});
