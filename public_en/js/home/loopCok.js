var COK = {

    create: function (loop_time, url_prefix) {
        if (loop_time < 60) {
            loop_time = 60;
        }

        var t = setTimeout("COK.f2("+loop_time+",'"+url_prefix+"')", loop_time*1000);
        return;
    },

    f2: function (loop_time, url_prefix) {
        COK.call(url_prefix);

        var t = setTimeout("COK.f2("+loop_time+",'"+url_prefix+"')", loop_time*1000);
    },

    call: function(url_prefix) {
        K.doAjax({},url_prefix+'/cok/cok',function(){},function(){});
    }

};

var LOOPIMG = {
    imgs : [],
    cur_num: 1,
    vid : null,
    int_id: null,
    loop_time: null,
    begin: function (loop_time, vid, imgs, cur_num) {
        LOOPIMG.imgs = imgs;
        LOOPIMG.cur_num = cur_num;
        LOOPIMG.vid = vid;
        LOOPIMG.loop_time = loop_time;

        LOOPIMG.int_id = setInterval("LOOPIMG.f2()", LOOPIMG.loop_time*1000);
        return;
    },

    f2: function () {
        LOOPIMG.changeImg();
    },

    changeImg :  function(tags) {
        var tags = (typeof(tags) == 'undefined') ? true : false ;
        
        var len = LOOPIMG.imgs.length;
        
        if(!tags) {
            LOOPIMG.cur_num -- ;
        } else {
            LOOPIMG.cur_num ++ ;
        }
        
        if(LOOPIMG.cur_num >= len && tags) {
            LOOPIMG.cur_num = 0;
        }
        
        if(LOOPIMG.cur_num < 0 && !tags) {
            LOOPIMG.cur_num = len - 1;
        }

        document.getElementById(LOOPIMG.vid).src = LOOPIMG.imgs[LOOPIMG.cur_num]['image_url'];
        if('' != LOOPIMG.imgs[LOOPIMG.cur_num]['link_url']) {
            document.getElementById(LOOPIMG.vid).parentNode.href = LOOPIMG.imgs[LOOPIMG.cur_num]['link_url'];
        } else {
            document.getElementById(LOOPIMG.vid).parentNode.href = '#';
        }        
    },
    
    nextImg: function() {    
        clearInterval(LOOPIMG.int_id);
        LOOPIMG.changeImg();
        LOOPIMG.int_id = setInterval("LOOPIMG.f2()", LOOPIMG.loop_time*1000);
    },
    
    prevImg: function() {
        clearInterval(LOOPIMG.int_id);
        LOOPIMG.changeImg(false);
        LOOPIMG.int_id = setInterval("LOOPIMG.f2()", LOOPIMG.loop_time*1000);
    },
};