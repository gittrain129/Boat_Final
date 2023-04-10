


$(document).ready(function(){



$(document).on("click", ".updateTodo", function () {
    let num = $(this).data('id');
    $.ajax({
        url :'../Todo/getTodo',
        data:{num:num
            },
        success:function(rdata){
           console.log("todolist 가져옴")
         let num =rdata.num;
         console.log(num);
         let content=rdata.t_CONTENT;
         let startdate= rdata.start_DATE;
         let enddate = rdata.end_DATE;

        $('#updatestart').val(startdate)
                     .attr('readonly',true);
        $('#updateend').val(enddate);
        $('#updatetitle').val(content)
                         .attr('readonly',true);
        $('#todonum').val(num)

        $('#updateTodo').modal('toggle');
        
        }
        })
    })

$(document).on("click", ".done", function () {
    var num = $(this).data('id');
    let done = $(this)
    $.ajax({
        url :'../Todo/done',
        data:{num:num
            },
        success:function(rdata){
            console.log(rdata);
            toastr.options.escapeHtml = true;
            toastr.options.closeButton = true;
            toastr.options.newestOnTop = false;
            toastr.options.progressBar = true;
            toastr.info('일정을 완료하였습니다.', '내 할일', {timeOut: 1500});
            done.prev().parent().attr('display','none');
            
        }
        })
    })


 $('#saveUpdate').click(function(){
     let num = $(this).data('id');
     let enddate = $('#updateend').val();
     
     $.ajax({
         url :'../Todo/updateTodo',
         data:{num:num,
             END_DATE:enddate },
         success:function(rdata){
             console.log(rdata);
             toastr.options.escapeHtml = true;
             toastr.options.closeButton = true;
             toastr.options.newestOnTop = false;
             toastr.options.progressBar = true;
             toastr.info('일정을 완료하였습니다.', '내 할일', {timeOut: 1500});
         },
        	complete:function(){
        	 $('#updateTodo').modal('hide')}
         })

})



})