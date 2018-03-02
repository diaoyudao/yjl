<php>
    $release = (new \Admin\Common\Release())->getRelease();
    $ctrl= "__CONTROLLER__";
    $ctrl=strtolower(str_replace('.php','',$ctrl));
    $url1=$ctrl."/audit";
    $url2=$ctrl."/release";

</php>

<if condition="$release eq 2">
    <a href="javascript:;" onclick="audit_more('{$url1}')"
       class="btn btn-success radius">
        <i class="Hui-iconfont">&#xe6dd;</i>
        批量待审核</a>
    <a href="javascript:;" onclick="release_more('{$url2}')"
       class="btn btn-success radius">
        <i class="Hui-iconfont">&#xe6e1;</i>
        批量发布</a>
</if>