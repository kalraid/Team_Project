$(document).ready(function(){
   // 이게 추천
   $(".recommend").click(function(){
      $.ajax({
         
         url: "projectrecommend.ajax",
         type:"post",
         data:{no : $("#rNo").val()},
         dataType: "json",
         success: function(data){
            
            alert("추천되었습니다");
            alert(data);
            $("#recText").text("(" + data + ")");
            
         },
         error: function(xhr , status, error){
            alert("error : " + xhr.statusText + ", " + status + ", " + error);
         }
         
         
      });
   }).hover(function(){
      $(this).css({cursor: " pointer"});
   });
   
   $(document).on("click", "#replyWrite" ,function(){
      $("#replyForm").css("display","block");
      
   
      
   });
   
   
   
   
});


$(document).on("submit", "#replyWriteForm", function(){
   if($("#replyContent").val().length <= 5){
   alert("댓글은 5자 이상 입력해야 됩니다");
   
   return false;
}
   
   var params = $(this).serialize();
   console.log(params);
   $.ajax({
      
   url: "projectreplyWrite.ajax",
   type: "post",
   data: params,
   dataType: "json",
   success: function(resultData, status , xhr){
      $("#replyWriteTable").empty();
      
      $.each(resultData, function(index, value){
         
         var date = new Date(value.regDate);
         var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10)
         ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
         + date.getDate() + "-" + ((date.getHours() < 10)
         ? "0" + date.getHours() : date.getHours()) + ":"
         + (date.getMinutes() < 10 ? "0" + date.getMinutes()
         : date.getMinutes()) + ":" + (date.getSeconds() < 10
         ? "0" + date.getSeconds() : date.getSeconds());
         var result =
         "<tr reply_" + value.no + ">"
         + "<td>"
         + " <div class='replyUser'>"
         + " <span class='member'>" + value.writer + "</span>"
         + " </div>"
         + " <div class='replyModify'>"
         + " <span class='replyDate'>" + strDate + "</span>"
         + " <a href='#' class='modifyReply' data-no='" + value.no + "'>"
         + " <img src='images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
         + " </a>"
         + " <a href='#' class='deleteReply' data-no='" + value.no + "'>"
         + " <img src='images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
         + " </a>"
         + " <a href='javascript:reportReply('div_" + value.no + "');'>"
         + " <img src='images/reply_btn_notify.gif' alt='신고하기'/>"
         + " </a>"
         + " </div>"
         + " <div class='replyContent' id='div_" + value.no + "'>"
         + " <pre><span>" + value.reply + "</span></pre>"
         + " </div>"
         + "</td>"
         + "</tr>";
         
         $("#replyTable").append(result);
         
         
         
      });
      $("#replyForm").slideUp(300).add("#replyContent").val("");
      
      
      
      
   },error: function(xhr, status, error) {
      alert("ajax 실패 : " + status + " - " + xhr.status);
   
   }
   
   });
   
   return false;
   
   $(document).ready(function(){
      // 이게 추천
      $(".recommend").click(function(){
         $.ajax({
            
            url: "Recommend.ajax",
            type:"post",
            data:{no : $("#rNo").val()},
            dataType: "json",
            success: function(data){
               
               alert("추천되었습니다");
               alert(data);
               $("#recText").text("(" + data + ")");
               
            },
            error: function(xhr , status, error){
               alert("error : " + xhr.statusText + ", " + status + ", " + error);
            }
            
            
         });
      }).hover(function(){
         $(this).css({cursor: " pointer"});
      });
      
      

      
      
   });
});