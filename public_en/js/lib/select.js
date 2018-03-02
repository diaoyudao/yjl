/**
 * Created by Administrator on 2016/11/15.
 */



// js实现select下拉列表框



var select=function(id){
    var el="#"+id;
    $(el).click(function(event){
        event.stopPropagation();
    });
    $(el).find(".nav").on("click",function (event) {
        event.stopPropagation();
        $(el).find(".items").show();
        $(el).find(".items").find("li").on("mouseover",function(){
            $(this).addClass("active").siblings("li").removeClass("active");
        })
    })

    $(el).find("li").on("click",function () {
        $(el).find(".items").hide();
        $(el).find(".nav").text($(this).text());

        // 后端操作
        $(el).find(".nav").attr("id",$(this).attr("id"));

    })

    $(document).on("click",function (event) {
        $(el).find(".items").hide();
    })

}