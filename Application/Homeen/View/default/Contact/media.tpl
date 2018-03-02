<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/contact/honestform.css">
</block>
<block name="title">Media Registration-Agile Group</block>

<block name="body_main">
    <style>

    </style>
    <div class="box section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                            href="/en/contact/index">Contact Us</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Media Registration</span>
            </p>
            <h2>Media Registration</h2>
            <h4>Dear Media Friends,welcome to Agile! Thank you for taking interest in Agile. In order to better facilitate your interview request, please fill in the form below.
            </h4>
            <form action="#" id="form-add" onsubmit="return false;">
                <div class="row ">
                <label class="">Name of Organisation:</label>
                <input type="text" name="organize" class="text " placeholder=""/></div>
                <div class="row ">
                <label class="">Name of Interviewer:</label>
                <input type="text" name="name" class="text " placeholder=""/></div>
                <div class="row ">
                <label class="">Contact:</label>
                <input type="text" name="tel" class="text " placeholder=""/></div>
                <div class="row ">
                <label class="">Messages:</label>
                <textarea name="note" class=""></textarea></div>
                <div class="row">
                    <label class="">Enter verification code:</label>
                    <input name="verify" class="text " type="text" placeholder="verification code"  style="width:250px;float:left;margin-left:10px;"/>
                        <img id="verify_png" src="/verify/index" style="width:120px;height:40px;border:1px solid #e4e4e4;margin-left:5px;"/>
                        <a id="kanbuq" href="javascript:;" onclick="newVerify()">change</a>
                </div>
                <div class="submit">
                <a class="btn-more cursor" onclick="submit2();" >Submit</a>
                </div>
            </form>
        </div>
    </div>
</block>
<block name="footer_js">
<script type="text/javascript" src="/public_en/huiadmin/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/public_en/huiadmin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/public_en/huiadmin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".header .nav li").eq(6).addClass("active").siblings().removeClass("active");
        })
        var newVerify = function () {
            var url = '/verify/index?rand=' + Math.random();
            document.getElementById('verify_png').src = url;
        }

        var submit2 = function() {
            if('' == $('input[name=organize]').val()) {
                layer.msg('Please enter a name!', {icon: 2, time: 1500});
                return false;
            }
            if('' == $('input[name=name]').val()) {
                layer.msg("Please enter the interviewer's name!", {icon: 2, time: 1500});
                return false;
            }
            if('' == $('input[name=tel]').val()) {
                layer.msg('Please enter the contact information!', {icon: 2, time: 1500});
                return false;
            }
            if('' == $('textarea[name=note]').val()) {
                layer.msg('Please enter the content outline!', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=verify]').val()) {
                layer.msg('Please enter the verification code!', {icon: 2, time: 1500});
                return false;
            }
            
            K.doAjaxSubmit('#form-add', window.location.href, function (response) {
                if (response.status && response.status == 'ok') {
                    layer.msg('Successfully added！', {icon: 1, time: 2500});
                } else {
                    if (response.message) {
                        layer.msg(response.message, {icon: 2, time: 2500});
                    } else {
                        layer.msg('The background error!', {icon: 2, time: 2500});
                    }
                }
            },function(e){});
            
            return false;
        };
        
    </script>
</block>