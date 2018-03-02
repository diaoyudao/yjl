<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_hotel.css">
</block>
<block name="title">Hotel Operations-Agile Group</block>
<block name="head_menu">
    <a class="tip">Hotel Operations/</a>
</block>
<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0].image_url1}" traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" alt="" class="tags-img">
    </div>
    <div class="bgc container cl  pt-20 pb-20">
        <div class="search">
            <input placeholder="Please type the name of hotel" class="txt-center input left">
            <span class="butn txt-center left">Search</span>
        </div>
    </div>
    <div>
        <img src="/public_en/img/mobile/business/hotel/logo-hotel.jpg" class="tags-img">
    </div>
    <div class="container mt-20 mb-30">
        <h2 class="txt-center">Agile Group Hotel Operations Company</h2>
        <div class="mt-20">
            <img src="/public_en/img/mobile/business/hotel/hotel-pic.jpg" class="tags-img">
        </div>
        <div class="mt-10">
            <p>
                Agile Group Hotel Operations Company is established in 2008 and based in Guangzhou.
            </p>
            <h3 class="mt-20">
                Brands
            </h3>
            <p class="mt-15">
                The company boasts over 20 hotels across Guangdong, Shanghai, Jiangsu, Hainan, Sichuan, Hunan, Yunnan,
                etc. and joins forces with myriad renowned international hotel groups, including InterContinental Hotels
                & Resorts, Raffles Hotels & Resorts, Jumeirah Hotels & Resorts, Marriott International, Starwood Hotels
                & Resorts, Hilton Hotels & Resorts, Howard Johnson International, Capella Hotels & Resorts , Hyatt
                Hotels & Resorts, Outrigger Hotels and Resorts, etc.
            </p>
        </div>
        <div id="much" class="row cl mt-20 main-btn">
            More
        </div>
        <div id="text_more" class="me-hidden">
            <h3 class="mt-20">
                Features
            </h3>
            <p class="mt-15">
                Agile hotels strive to provide a pleasant stay combining local cultural characteristics, creating unique
                projects and well received by the customers. Agile Group continues to shine in hospitality management
                thanks to its deep reservoir of experience in providing professional services and operations.
            </p>
            <h3 class="mt-20">
                Details
            </h3>
            <p class="mt-15">
                Hospitality services provided for Shanghai Marriott Hotel City Centre, Raffles Hainan, Sheraton Bailuhu
                Resort Huizhou, Howard Johnson Agile Plaza Chengdu, Holiday Inn Resort Hainan Clearwater Bay, Foshan
                Agile Hotel, Zhongshan Agile Hotel and Tengchong Agile Hotel under Agile's hotel management arm has
                created a steady revenue stream.
            </p>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>

            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/hotel/two-code-hotel.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>

        $(function () {
//            查询按钮点击事件
            $(".search .butn").click(function () {
                var keyword = $(".search .input").val();
                if ("Please type the name of hotel" == keyword) {
                    keyword = "";
                }
//                location.href="/en/business/hotellists?level_id=1000000131&keyword=" + keyword;
                show_expecting()

            })

            $(" #much").click(function () {
                $("#text_more").show();
                $(this).hide();
            })

        })

    </script>
</block>