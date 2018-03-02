
<switch name="release">
    <case value="1">

    </case>

    <default/>
    <a style="text-decoration:none" class="ml-5"
       onClick="article_audit(this,'{$param}','{$url1}')"
       href="javascript:;" title="待审核">
        <i class="Hui-iconfont">&#xe6dd;</i>
    </a>
    <a style="text-decoration:none" class="ml-5"
       onClick="article_release(this,'{$param}','{$url2}')"
       href="javascript:;" title="发布">
        <i class="Hui-iconfont">&#xe6e1;</i>
    </a>
</switch>