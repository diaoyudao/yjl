<php>
    $release = (new \Adminen\Common\Release())->getRelease();
</php>

<empty name="var">
    <if condition="$release eq 1">
        <div class="radio-box">
            <input type="radio" value="0" name="status" id="sex-2" checked>
            <label for="sex-2">待审核</label>
        </div>
        <else/>
        <div class="radio-box">
            <input type="radio" value="1" name="status" id="sex-1">
            <label for="sex-1">发布</label>
        </div>
        <div class="radio-box">
            <input type="radio" value="0" name="status" id="sex-2" checked>
            <label for="sex-2">待审核</label>
        </div>
    </if>
    <else/>
    <if condition="$release eq 1">
        <div class="radio-box">
            <input type="radio" value="0" name="status" id="sex-2" checked>
            <label for="sex-2">待审核</label>
        </div>
        <else/>
        <if condition="$var.status eq 1">
            <div class="radio-box">
                <input type="radio" value="1" name="status" id="sex-1" checked>
                <label for="sex-1">发布</label>
            </div>
            <div class="radio-box">
                <input type="radio" value="0" name="status" id="sex-2" >
                <label for="sex-2">待审核</label>
            </div>
            <else/>
            <div class="radio-box">
                <input type="radio" value="1" name="status" id="sex-1">
                <label for="sex-1">发布</label>
            </div>
            <div class="radio-box">
                <input type="radio" value="0" name="status" id="sex-2" checked>
                <label for="sex-2">待审核</label>
            </div>
        </if>

    </if>
</empty>