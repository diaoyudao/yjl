<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/contact/honestform.css">
</block>
<block name="title">Media Registration-Agile Group</block>
<block name="head_menu">
     <a class="tip" href="#">Media Registration/</a>
</block>
<block name="body_main">
    <div class="row pt-20 bgc-ef">
        <div class="container">
            <div class="row txt-center mt-20"><span class="main-title">Media Registration</span></div>
            <div class="row txt-center mt-15">
            <p class="f-14">
                Dear Media Friends,<br>
                welcome to Agile! Thank you for taking interest in Agile. In order to better facilitate your interview request, please fill in the form below.
            </p>
            </div>            
            <div class="row cl form mt-20">
                <form action="#" id="form-add" >
                <label class="row mt-20 ">Name of Organisation:</label>
                <input type="text" name="organize" class="" placeholder=""/>
                <label class="row mt-20">Name of Interviewer:</label>
                <input type="text" name="name" class=" " placeholder=""/>
                <label class="row mt-20">Contact:</label>
                <input type="text" name="tel" class=" " placeholder=""/>
                <label class="row mt-20">Messages:</label>
                <textarea name="note" class=""></textarea>
                <label class="row mt-30">Enter verification code:</label>
                <img class="verify" id="verify_png" src="/verify/index" style=""/>
                <input name="verify" class="mb-10" type="text" placeholder="code" />
 
                <a onclick="submit2();"><div class="row cl mt-20 mb-30 main-btn">Submit</div></a>

            </form>
            </div>
            
        </div>
    </div>
</block>
<block name="footer_js">
<script type="text/javascript" src="/public_en/huiadmin/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/public_en/huiadmin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/public_en/huiadmin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#verify_png').click( function () {
                var url = '/verify/index?rand=' + Math.random();
                document.getElementById('verify_png').src = url;
            });
        });

        var submit2 = function() {
            if('' == $('input[name=organize]').val()) {
                layer.msg('Please enter a name!', {icon: 2, time: 1500});
                return false;
            }
            if('' == $('input[name=name]').val()) {
                layer.msg('Please enter the interviewer\'s name!', {icon: 2, time: 1500});
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
                    layer.msg('Successfully added!', {icon: 1, time: 2500});
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