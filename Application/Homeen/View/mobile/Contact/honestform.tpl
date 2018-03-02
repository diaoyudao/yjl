<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/contact/honestform.css">
    <link rel="stylesheet" type="text/css" href="/public_en/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="title">Complainant Registration-Agile Group</block>

<block name="head_menu">
     <a class="tip" href="#" style="font-size: 1.2rem">Complainant Registration/</a>
</block>

<block name="body_main">
    <style>

    </style>
    <div class="row pt-20 pb-30 bgc-ef">
        <div class="container">
            <div class="row txt-center mt-20"><span class="main-title" style="font-size: 1.2rem">Complainant Registration</span></div>
       
            <div class="row cl form mt-20">
              <form action="#" id="form-add" onsubmit="return false;">
                <input type="hidden"  name="desc"/>
                <input type="hidden"  name="file_url"/>
                <input type="hidden" name="file_name"/>

                <div id="one-page" >  
                <label class="row mt-20 ">Accused Person:</label>
                <input type="text" name="defendant" class="" placeholder=""/>
                <label class="row mt-20">City:</label>
                <input type="text" name="city" class=" " placeholder=""/>
                <label class="row mt-20">Company:</label>
                <select name="company_type" class="select" style="font-size: 1rem">
                        <option value="房地产" >Property</option>
                        <option value="物业公司" >Property Managemen</option>
                        <option value="酒店">Hotels</option>
                        <option value="球会" >Golf Clubs</option>
                        <option value="时兴装饰" >Renovation</option>
                        <option value="教育">Education</option>
                         <option value="其他">Others</option>
                    </select>
                <label class="row mt-20 ">Department:</label>
                <input type="text" name="partiton" class="" placeholder=""/>
                <label class="row mt-20">Cases:</label>
                <div class="row cl check-list">
                        <label class="label-check" for="check1" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="贪污资产" id="check1" > Corruption </label>
                        <label class="label-check" for="check2" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="偷工减料" id="check2" > Cut Corners </label>
                        <label class="label-check" for="check3" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="以权谋私" id="check3" > Power Abuse </label>
                        <label class="label-check" for="check4" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="弄虚作假" id="check4" > Deceit </label>
                        <label class="label-check" for="check5" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="商业受贿" id="check5" > Business Corruption </label>
                        <label class="label-check" for="check6" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="采购舞弊" id="check6" > Procurement Corruption </label>
                        <label class="label-check" for="check7" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="吃拿卡要" id="check7" > Personal Gain </label>
                        <label class="label-check" for="check8" style="font-size: 0.7rem;text-align: left;width: 50%;padding: 0.5rem 0;"><input name="check" type="checkbox"  value="其他举报" id="check8" > Other Reports </label>
                </div>
                <label class="row mt-20">Complainant:</label>
                <input type="text" name="plaintiff" class=" " placeholder=""/>
                <label class="row mt-20 ">Email:</label>
                <input type="text" name="mail" class="" placeholder=""/>
                <label class="row mt-20">Tel:</label>
                <input type="text" name="tel" class=" " placeholder=""/>
                <label class="row mt-20">QQ：</label>
                <input type="text" name="qq" class=" " placeholder=""/>
                <a onclick="setTwoPage();"><div class="row cl mt-20 mb-30 main-btn">Next</div></a>
                </div>

                <div id="two-page" class="me-hidden">
                <label class="row mt-20">Cases:</label>
                <input type="text" name="note" class="" placeholder=""/>
                <label class="row mt-20 ">Time and Location:</label>
                <input type="text" name="address" class="" placeholder=""/>
                <label class="row mt-20">Detail Description:</label>
                <textarea name="process" class=""></textarea>
                <label class="row mt-20">Evidence: </label>
                <textarea name="evidence" class=""></textarea>

                <label class="row mt-30 ">Upload File(Maximum size:2M):</label>
                <div class="row " >
                    <div class=" pd-l8">
                        <div id="uploader" class="wu-example">
                    <!--用来存放文件信息-->
                        <div id="file-list" class="uploader-list"></div>
                        <div class="btns ">
                            <div id="file-picker" class="select-btn">Choose file</div>
                            <button id="file-start" class="up-btn-me" style="" type="button">Upload</button>
                        </div>
                        </div>
                    </div>    
                </div>

                <label class="row mt-40">Enter Verification Code:</label>
                <img class="verify" id="verify_png" src="/verify/index" style=""/>
                <input name="verify" class="mb-10" type="text" placeholder="验证码" />

                <div class="row cl">
                    <a onclick="setOnePage();"><div class="f-l ml-0 main-btn btn-submit" >Back</div></a>
                    <a onclick="submit2();"><div class="f-r mr-0 main-btn btn-submit">Submit</div></a>
                </div>

                </div>

            </form>
            </div>
            
        </div>
    </div>    
</block>

<block name="footer_js">
<script type="text/javascript" src="/public_en/huiadmin/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/public_en/huiadmin/lib/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="/public_en/huiadmin/lib/webuploader/0.1.5/webuploader.js"></script>
    <script src="/public_en/js/lib/md5.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="/public_en/js/home/uploadFile.js"></script>
    <script type="text/javascript">
        var newVerify = function () {
            var url = '/verify/index?rand=' + Math.random();
            document.getElementById('verify_png').src = url;
        }

        var clearTextArea = function(me){
            $(me).val('');
        }
        
        var file_uplad = FILE_UPLOAD.create();
        
        var setTwoPage = function() {
            if(false == checkOnePage()){
                return false;
            }
            
            $('#two-page').show();
            $('#one-page').hide();                
        }
        
        var setOnePage = function() {
            
            $('#two-page').hide();
            $('#one-page').show();                            
        }
        
        var checkOnePage = function() {
            var status = true;
            $.each($('#one-page').find('input'), function(i, item){
                var me = $(this);
                if('' == me.val()) {
                    var label = me.prev().text();
                    label=label.substring(0,label.length-1);
                    layer.msg('请输入'+label, {icon: 2, time: 2000});
                    status = false;
                    return false;
                }
            });
            
            if(!status) {
                return status;
            }            
            
            status = false;
            $('input[type=checkbox]:checked').each(function(){
                status = true;
                return false;
            });
            if(!status) {
                layer.msg('请选择举报事项', {icon: 2, time: 2000});
            }  
            
            return status;            
        }
        
        var checkTwoPage = function() {
            if('' == $('input[name=note]').val()) {
                //layer.msg('请输入举报事项请输入举报事项请输入举报事项请输入举报事项', {icon: 2, time: 2000,area: ['150px', '150px'],});
                layer.msg('请输入举报事项', {icon: 2, time: 2000});
                return false;
            }
            if('' == $('input[name=address]').val()) {
                layer.msg('请输入时间地点', {icon: 2, time: 2000});
                return false;
            }
            var temp = $('textarea[name=process]').val();
            if('' == temp || '描述' == temp) {
                layer.msg('请输入具体过程', {icon: 2, time: 2000});
                return false;
            }
            temp = $('textarea[name=evidence]').val()
            if('' == temp || '人证、物证、其他' == temp) {
                layer.msg('请输入具体证据', {icon: 2, time: 2000});
                return false;
            }
            if ('' == $('input[name=verify]').val()) {
                layer.msg('请输入验证码', {icon: 2, time: 1500});
                return false;
            }
            
            temp = '';
            $('input[type=checkbox]:checked').each(function(){
                temp = temp + $(this).val() + ', ';
            });
            temp=temp.substring(0,temp.length-2);
            
            $('input[name=desc]').val(temp);
        }

        var submit2 = function() {
            if(file_uplad.isInProgress()) {
                layer.msg('正在上传文件，请稍后！', {icon: 2, time: 2000});
                return false;
            }

            if(false == checkTwoPage()){
                return false;
            }            
            
            K.doAjaxSubmit('#form-add', '/contact/honestform', function (response) {
                if (response.status && response.status == 'ok') {
                    layer.msg('添加成功！', {icon: 1, time: 2500});
                } else {
                    if (response.message) {
                        layer.msg(response.message, {icon: 2, time: 2500});
                    } else {
                        layer.msg('后台错误!', {icon: 2, time: 2500});
                    }
                }
            },function(e){});
            
            return false;
        }        

        $(function(){
            $('#verify_png').click( function () {
                var url = '/verify/index?rand=' + Math.random();
                document.getElementById('verify_png').src = url;
            });
        });
        
    </script>
</block>