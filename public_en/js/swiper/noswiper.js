/**
 * Created by Administrator on 2016/12/21.
 */
var NoSwiper={
    bind:function (id) {
        var id="#"+id;
        $(id+" .swiper-slide").addClass("swiper-slide-active");
        $(id).siblings(".prev").hide();
        $(id).siblings(".next").hide();
        $(id).find(".prev").hide();
        $(id).find(".next").hide();
        $(id).find(".pagination").hide();
    }
}