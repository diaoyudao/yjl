var DOWN = {

    call: function(url_prefix, type, name) {
    
        K.doAjax({type: type, context:name},url_prefix+'/down/index',function(){},function(){});
        return;
    }


};

var HOME = {
    
}