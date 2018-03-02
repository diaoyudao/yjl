<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/enter/enter-group.css">
</block>
<block name="title">Introduction of the Group-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
             simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">

    </div>
    <div class="content container">
        <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                        href="/en/enter/index?level_id=1000000123">A Glance at Agile</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span>Introduction of the Group</span></p>
        <h2>Introduction of the Group</h2>

        <div class="left" style="width: 395px;">
            <img src="/public_en/img/home/enter/group/group_p1.jpg" alt="" style="margin-bottom: 36px;">
            <img src="/public_en/img/home/enter/group/group_p2.jpg" alt="" style="margin-bottom: 36px;">
            <img src="/public_en/img/home/enter/group/group_p3.jpg" alt="" style="margin-bottom: 36px;">
        </div>
        <div class="word-box right" style="width: 570px;">
            <p>
               Agile Group Holdings Limited ("Agile") is an integrated conglomerate in China, principally engaged in property development, with extensive presence in the diversified businesses development of living services, environmental protection, education, construction and hotel operations, etc.. Founded in 1992, the shares of Agile have been listed on the Main Board of The Stock Exchange of Hong Kong Limited ("Hong Kong Stock Exchange") since 2005 and are constituent stocks of Hang Seng Composite Index, Hang Seng Global Composite Index, Hang Seng Stock Connect Hong Kong Index Series, Hang Seng High Dividend Yield Index and Lippo Select HK & Mainland Property Index. Agile's brand has become a household name in the nationwide with the coveted status as "China's Well-known Trademark".
            </p>
            <div class="title" style="font-size: 24px;margin-bottom:25px;">Integration of diversified businesses</div>
            <div class="title">Property Development</div>
            <p>
                Property development is the core business of Agile, whose unparalleled competitiveness in China is
                evidenced by a diversified profile that spans over 100 projects in over 40 cities and districts. In
                2015, Agile further extended its presence into first overseas project in Malaysia, starting its
                international journey.
            </p>
            <div class="title">Living Services</div>
            <p>
                As the first industrial group born out of Agile's strategic endeavour to "Focuses on property
                development supported by a diversified range of businesses", A-Living Group dedicates to offer
                comprehensive lifestyle solutions for home owners with flagship operations covering Property Management,
                Network Technology, Travel Management, Advertisement, Sales and Building Inspection.
            </p>
            <div class="title">Environmental Protection</div>
            <p>
                Agile Environmental Protection is another intrinsic part of Agile's multi-prong development strategies.
                As a leading investment operator of environmental services in China, it provides solutions of platform
                level and comprehensive environmental services to both urban and rural areas.
            </p>
            <div class="title">Five Education Segments</div>
            <p>
                Agile Education Group has been investing in education in five neatly defined areas, namely pre-school,
                primary, international, tertiary and community education. This distinctive system of Agile Education is
                developed along the line of innovation and inclusion, combining the Chinese and Western perspectives.
                Agile Education Group also joins hands with famous local and international institutes to forge an
                integrated Education Group with a competitive edge.
            </p>
            <div class="title">Build Group</div>
            <p>
                Agile Build Group has seven subsidiaries and its business cover Design, General Construction Contractor,
                Home Décor, Landscape Engineering, Intelligent Technology, Construction Cost Audit and Materials
                Trading. We strike a balance between Agile property business and market-oriented business to build an
                integrated build group penetrating the whole property development process.
            </p>
            <div class="title">Hotel Management</div>
            <p>
                Founded in 2008 and headquartered in Guangzhou, Agile Hotel Management owns more than 20 hotels (in
                operation and in planning) in Guangdong, Shanghai, Jiangsu, Hainan, Sichuan, Hunan, Yunnan and etc.. The
                company enjoys close partnership with 10 international hotel groups, including Marriott International,
                InterContinental Hotels & Resorts, Raffles Hotels & Resorts, Jumeirah Hotels & Resorts, Hilton Hotels &
                Resorts, Howard Johnson International, Capella Hotels & Resorts , Hyatt Hotels & Resorts, Outrigger
                Hotels and Resorts, etc.
            </p>
            <div class="title">Honours and Responsibility</div>
            <p>
                Thanks to its scientific management approach and outstanding sales performance, Agile has garnered many
                international and local awards, including Forbes Asia's "Fabulous 50 - The Best of Asia-Pacific's
                Biggest Listed Companies", Business Week's "50 Best Performing Companies in Asia", etc.. Mr. Chen Zhuo
                Lin, our Chairman & President, has been awarded "Top 10 Figures of the Yearly Outstanding Management"
                and "China Charity Outstanding Contributor Award" by China Charity Federation. In the same time of rapid
                development, Agile actively assume the social responsibility, in particular the promotion of Chinese
                culture, poverty and emergency relief, environmental protection, healthcare, education, sport, etc.. As
                at 31 December 2016, Agile has donated a total of over RMB 1 billion to support charitable and social
                initiatives. In 2008, 2011 and 2012, Agile won the "China Charity Award", the highest honour in the
                national field of charity. Besides being named of "China Philanthropy Outstanding Contribution Corporate
                Award", "The Most Socially Responsibile Property Developer", "Corporate Social Responsibility Awards"
                and the "Gold Cup of Guangdong Poverty Relief Hongmian Cup", Agile received the awards of Forbes’ "China
                Philanthropy List" and Hurun's "China Philanthropy List" for consecutive years.

            </p>
            <div class="title">Future Prospect</div>
            <p>
                In the future, Agile will continue to optimise our asset value for shareholders and customers while
                seeking to explore business development opportunities.
            </p>


        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
        });
    </script>
</block>