<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/enter/enter-chair.css">
</block>
<block name="title">Chairman's Corner-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Chairman's Corner/</a>
</block>
<block name="body_main">
    <div class="container">
        <h2 class="txt-center mt-20">Chairman's Corner</h2>
        <div class="mt-20 bg pb-20">
            <img src="/public_en/img/mobile/enter/chair/photo-chair.jpg" class="tags-img">
            <div class="txt">
                <h3 style="font-size: 1rem;">Chen Zhuo Lin</h3>
                <p class="mt-5 f-6">Founder of Agile Group</p>
            </div>
        </div>
        <div class="content">
            <p>
                Mr. Chen Zhuo Lin, the Chairman and President of Agile Group Holdings Limited. Born to a native
                Zhongshan family in 1962, he is also the Vice Chairperson of China Overseas Chinese Entrepreneurs
                Association, Honorary Vice President of Chinese Language and Culture Education Foundation of China, Vice
                Chairperson of Guangdong Overseas Chinese Enterprises Association, Vice Chairperson of Zhongshan
                Association of Overseas Enterprises and Honorary Chief Chairperson of the Association of Zhongshang
                Sanxiang Fellows in Hong Kong.
            </p>
        </div>
        <div class=" content">

            <div class="mt-10">
                <h4>
                    Career Milestones
                </h4>
                <p class="mt-10">
                    1985– Founded Dynasty Furniture Ltd in Zhongshan City, Guangdong Province. Thanks to the
                    innovative designs, the products won nationwide acclaims.
                </p>
                <p>
                    1992 – Founded Agile Property in Zhongshan City, Guangdong Province with focus on the Mainland
                    property market. Agile Garden Zhongshan, the Group's first residential resort project, has
                    established the Agile brand in Hong Kong and Macau, followed by Majestic Garden Zhongshan, a
                    high-end residential project named "National Well-off Model Residential Community" by Ministry of
                    Construction. Spearheading the introduction of Hong Kong property management style to the Mainland,
                    Mr. Chen is among the first national developers to collaborate with celebrated international design
                    teams on master layout, architecture, landscape and interior design.
                </p>
            </div>
            <div id="show" class="row cl mt-20 mb-20 main-btn">
                More
            </div>
            <div class="me-hidden">
                <p>
                    1997 – Agile Golf & Country Club, China's second 36-hole golf course, was launched to critical
                    acclaims. It has since been prized as one of the "China's Top 10 Golf Clubs".
                </p>
                <p>
                    2000 – Mr. Chen oversaw the expansion of Agile into Guangzhou with four luxury residential
                    projects, all received exceptionally well thanks to their unrivalled quality.
                </p>
                <p>
                    2005 – Agile Property Holding Ltd. was listed on the Main Board of Hong Kong Stock Exchange (HKSE:
                    3383.HK). Mr. Chen was appointed as Chairman of the Board.
                </p>
                <p>
                    2006 – Mr. Chen implemented the national development blueprint which saw new projects rolling out
                    gradually in different key cities and districts.
                </p>
                <p>
                    2014 – Agile extended its geographical spread into overseas countries. The Group acquired two
                    residential projects in the heart of Kuala Lumpur, Malaysia.
                </p>
                <p>
                    2016 – Mr. Chen championed multi-prong development strategies by which the Company was renamed as
                    "Agile Group Holdings Limited", with A-Living, environmental protection and education arms in
                    addition to the Group's primary property development operations.
                </p>


                <div class="mt-10 mb-30">
                    <h4>
                        Social Contribution
                    </h4>
                    <p class="mt-10">
                        Mr. Chen always upholds the belief of Corporate development of "benefiting from society, giving
                        back to society". The Group actively promote a good working atmosphere and pay attention to
                        employee care with the organisation. The Group is committed into the areas of disaster relief,
                        poverty alleviation and student charity activities into the society. At the same time, the
                        Company encourages the regional companies to set up volunteer teams to encourage employees of
                        actively participate into volunteer activities and establish a good sense of social
                        responsibility. Since the establishment of the Company, an aggregate amount of RMB1.2 billion
                        has been donated to the community.
                    </p>
                    <p>
                        2008 – The "Agile Foundation for Mutual Help" was founded in the spirit of love and care across
                        the organisation. Annual private funds were earmarked to assist financially challenged staff
                        members.
                    </p>
                    <p> 2008 – RMB156 million was donated to Sichuan earthquake relief efforts.<br>
                        2008 – Chinese Language and Culture Education Foundation of China was established and an
                        aggregate amount of RMB70 million has been donated.<br>
                        2010 – RMB20 million was donated to Qinghai Yushu earthquake relief effortsand "Agile Qinghai
                        Scholarship Foundation" was established.<br>
                        2016 – RMB100 million was donated in support of Hainan Tropical Ocean University.<br>
                    </p>
                </div>
            </div>

        </div>

    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
//            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
            $("#show").click(function () {
                $("#show").hide();
                $('.me-hidden').show();
            })


        });
    </script>
</block>