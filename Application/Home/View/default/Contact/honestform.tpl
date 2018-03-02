<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/contact/honestform.css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="title">举报登记-雅居乐集团</block>

<block name="body_main">
    <style>
.webuploader-pick {
    height:34px;width:135px;
    background: #007069 none repeat scroll 0 0;
    border-radius: 0px;
    color: #efefef;
    cursor: pointer;
    overflow: hidden;
    padding: 9px 12px;
    position: relative;
    margin-left:5px;margin-top:2px;
    text-align: center;
}
    </style>
    <div class="box section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                            href="/contact/index">联系我们</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a href="/contact/honest">廉洁举报</a>
                </span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>举报登记</span>
            </p>
            <h2>举报登记 - 基本信息</h2>
            <form class="" id="form-add">
                <input type="hidden"  name="thumbnail_url"/>
                <input type="hidden"  name="image_url"/>
                <input type="hidden"  name="desc"/>
                <input type="hidden"  name="file_url"/>
                <input type="hidden" name="file_name"/>
              <div id="one-page" >  
                <div class="row ">
                    <label class="">被举报人：</label>
                    <input type="text" name="defendant" class="text "  />
                </div>
                <div class="row ">
                    <label class="">所在城市：</label>
                    <input type="text" name="city" class="text "  />
                </div>
                <div class="row ">
                    <label class="">所在公司类型：</label>
                    <div class="select-box">
                    <select name="company_type" class="select">
                        <option value="房地产" >房地产</option>
                        <option value="物业公司" >物业公司</option>
                        <option value="酒店">酒店</option>
                        <option value="球会" >球会</option>
                        <option value="时兴装饰" >时兴装饰</option>
                        <option value="教育">教育</option>
                         <option value="其他">其他</option>
                    </select>
                    </div>
                </div>
                <div class="row ">
                    <label class="">所在部门：</label>
                    <input type="text" name="partiton" class="text "  />
                </div>
                <div class="row2 ">
                    <label class="label2">举报事项：</label>
                    <div class="left ">
                        <label class="label-check" for="check1"><input name="check" type="checkbox"  value="贪污资产" id="check1" > 贪污资产 </label>
                        <label class="label-check" for="check2"><input name="check" type="checkbox"  value="偷工减料" id="check2" > 偷工减料 </label>
                        <label class="label-check" for="check3"><input name="check" type="checkbox"  value="以权谋私" id="check3" > 以权谋私 </label>
                        <label class="label-check" for="check4"><input name="check" type="checkbox"  value="弄虚作假" id="check4" > 弄虚作假 </label>
                        <label class="label-check" for="check5"><input name="check" type="checkbox"  value="商业受贿" id="check5" > 商业受贿 </label>
                        <label class="label-check" for="check6"><input name="check" type="checkbox"  value="采购舞弊" id="check6" > 采购舞弊 </label>
                        <label class="label-check" for="check7"><input name="check" type="checkbox"  value="吃拿卡要" id="check7" > 吃拿卡要 </label>
                        <label class="label-check" for="check8"><input name="check" type="checkbox"  value="其他举报" id="check8" > 其他举报 </label>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="row ">
                    <label class="">举报人姓名：</label>
                    <input type="text" name="plaintiff" class="text "  />
                </div>
                <div class="row ">
                    <label class="">举报人邮箱：</label>
                    <input type="text" name="mail" class="text "  />
                </div>
                <div class="row ">
                    <label class="">举报人电话：</label>
                    <input type="text" name="tel" class="text "  />
                </div>
                <div class="row ">
                    <label class="">举报人QQ：</label>
                    <input type="text" name="qq" class="text "  />
                </div>
                
              </div>
              <div id="two-page" style="display:none">
                <div class="row ">
                    <label class="">举报事项：</label>
                    <input type="text" name="note" class="text "  />
                </div>
                <div class="row "><label class="">时间地点：</label>
                <input type="text" name="address" class="text " /></div>
                <div class="row"><label class="">具体过程：</label>
                <textarea name="process" class=" init-color"  
                    onblur="if(this.value == ''){this.style.color = '#ACA899'; this.value = '描述'; }"
                    onfocus="if(this.value == '描述'){this.value =''; this.style.color = '#000000'; }"
                >描述</textarea></div>
                <div class="row"><label class="">具体证据：</label>
                <textarea name="evidence" class=" init-color"  
                    onblur="if(this.value == ''){this.style.color = '#ACA899'; this.value = '人证、物证、其他'; }"
                    onfocus="if(this.value == '人证、物证、其他'){this.value =''; this.style.color = '#000000'; }" 
                     >人证、物证、其他</textarea>
                </div>
                <div class="row " style="margin-top:20px;" ><label class="">上传附件：</label >
                    <div class="col-xs-9 col-sm-9 pd-l8">
                        <div id="uploader" class="wu-example">
                    <!--用来存放文件信息-->
                        <div id="file-list" class="uploader-list"></div>
                        <div class="btns ">
                            <div id="file-picker">选择文件</div>
                            <button id="file-start" class="btn btn-default" style="margin-top:2px;" type="button">开始上传</button>
                            <span style="color:#666;margin-left:5px;">可选，最大2M</span>
                        </div>
                        </div>
                    </div>    
                </div>
            
                <div class="row">
                    <label class="">请输入验证码：</label>
                    <input name="verify" class="text " type="text" placeholder="验证码"  style="width:250px;float:left;margin-left:12px;"/>
                        <img id="verify_png" src="/verify/index" style="width:120px;height:40px;border:1px solid #e4e4e4;margin-left:5px;"/>
                        <a id="kanbuq" href="javascript:;" onclick="newVerify()">换一张</a>
                </div>
              </div>
                <div class="submit">
                <a class="btn-more cursor" id="next-step" onclick="nextPage()" >下一步</a><a class="btn-more cursor" onclick="submit2()" id="submit" style="margin-left:45px;display:none">提交</a>
                </div>
            </form>
        </div>
    </div>
</block>
<block name="footer_js">
<script type="text/javascript" src="/public/huiadmin/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.js"></script>
    <script src="/public/js/lib/md5.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="/public/js/home/uploadFile.js"></script>
    <script type="text/javascript">
        var newVerify = function () {
            var url = '/verify/index?rand=' + Math.random();
            document.getElementById('verify_png').src = url;
        }

        var clearTextArea = function(me){
            $(me).val('');
        }
        
        var current_page = 1;

        var file_uplad = FILE_UPLOAD.create();
        
        var nextPage = function() {
            if(1 == current_page) {
                setTwoPage();
            } else {
                setOnePage();
            }
        };
        
        var setTwoPage = function() {
            if(false == checkOnePage()){
                return false;
            }
            
            $('#next-step').text('上一步');
            $('#two-page').show();
            $('#one-page').hide();                
            $('#submit').show();
            
            current_page = 2;
        }
        
        var setOnePage = function() {
            
            $('#two-page').hide();
            $('#one-page').show();                            
            $('#submit').hide();
            $('#next-step').text("下一步");
            
            current_page = 1;
        }
        
        var checkOnePage = function() {
            var status = true;
            $.each($('#one-page').find('.text'), function(i, item){
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
        
    </script>
</block>