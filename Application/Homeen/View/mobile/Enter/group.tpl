<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/enter/group.css">
</block>
<block name="title">Introduction of the Group-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Introduction of the Group/</a>
</block>
<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0].image_url1}"
             traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" alt=""
             class="tags-img">
    </div>
    <div class="row cl mt-30 txt-center"><span class="f-20 c-333 "><strong>Introduction of the Group</strong></span>
    </div>

    <div class="container content mt-25">
        <p>
            Agile Group Holdings Limited ("Agile") is an integrated conglomerate in China, principally engaged in
            property development, with extensive presence in diversified businesses including living services,
            environmental protection, education, construction, hotel operations and property investment etc.. Founded in
            1992, the shares of Agile have been listed on the Main Board of Hong Kong Stock Exchange since 2005 and are
            currently constituent stocks of Hang Seng Composite Index, Hang Seng Global Composite Index, Hang Seng Stock
            Connect Hong Kong Index Series, Hang Seng High Dividend Yield Index, Hang Seng Mainland Properties Index,
            Hang Seng High Beta Index, MSCI China Index, Lippo Select HK & Mainland Property Index and Lippo Select HK &
            Mainland Property Index.
        </p>
        <p>
            In its 26 years of robust development, Agile has been guided by the concept of “developing our future with
            vision and enthusiasm” as we devote our efforts to raising the bar on green healthy and vivid living with a
            view to becoming a leading provider of quality lifestyle with the pursuit of quality life in our mind.
        </p>
    </div>
    <div class="container mt-15">
        <img class="img-responsive" src="/public_en/img/mobile/enter/group/01.jpg">
    </div>

    <div class="container content mt-20">
        <h3><strong style="color: #01756e;">Integration of diversified range of businesses</strong></h3>
        <h4 class="mt-20"><strong>Property Development</strong></h4>
        <p class="mt-10">
            Property development is the core business of Agile, whose unparalleled competitiveness in China is evidenced
            byits diversified profile that spans over 100 projects in over 60 cities and districts. Agile’s projects
            cover high-end products, low density residential products, residential communities, tourism properties,
            commercial developments and featured towns, offering dream living space for over 1 million residents,
            becoming one of the most competitive integrated property development companies.
        </p>
        <h4 class="mt-15"><strong>A-Living</strong></h4>
        <p class="mt-10">
            A-Living Services Co., Ltd. (“A-Living”; Stock Code: 3319) separately listed on the Main Board of Hong Kong
            Stock Exchange in February 2018. A-Living offers comprehensive lifestyle solutions for home owners with
            business scope covering property management, network technology, travel management, advertising, sales and
            building inspection. A-Living manages a GFA of over 70 million sq.m. including more than 200 projects in
            over 60 cities and districts, and serves approximately 1.1 million owners and residents.
        </p>
    </div>
    <div class="container content  mb-30 me-hidden " id="txt-more">
        <h4 class="mt-15 "><strong>Environmental Protection</strong></h4>
        <p class="mt-10">
            Agile’s environmental protection business engages in three primary areas including solid waste
            treatment, environmental restoration and water affairs with a strategic and prominent presence spreading
            across 6 regions including Eastern China, Beijing-Tianjin-Hebei, Central and Western China, Southern China
            and Hainan. The team offers integrated platform-grade environmental solutions and has become one of the
            leading environmental services operators.
        </p>
        <h4 class="mt-15"><strong>Education</strong></h4>
        <p class="mt-10">
            Agile’s education business has successfully established a holistic education system that covers pre-school,
            elementary, international, tertiary and community education. As at 31 December 2017, Agile has operated a
            total of 122 schools in 14 provinces and 24 cities.
        </p>
        <h4 class="mt-15"><strong>Construction</strong></h4>
        <p class="mt-10">
            Agile’s construction arm offers integrated construction services encompassing the complete process of real
            estate development through seven professional companies. The construction business covers design consulting,
            general construction contracting, home decoration, garden landscape construction, intelligent engineering,
            costing consulting and audit, as well as materials trading services.
        </p>
        <h4 class="mt-15"><strong>Hotel Operations</strong></h4>
        <p class="mt-10">
            Agile boasts over 20 hotels across China and joins forces with myriad renowned international hotel groups,
            including Marriott International, InterContinental Hotels & Resorts, Accor Hotels, Jumeirah Hotels &
            Resorts, Hilton Hotels & Resorts, Howard Johnson International, Capella Hotels &Resorts , Hyatt Hotels &
            Resorts and Outrigger Hotels and Resorts etc.
        </p>
        <h4 class="mt-15"><strong>Accolades Go Hand in Hand with Responsibilities</strong></h4>
        <p class="mt-10">
            Agile is recognised for its scientific management and outstanding operating results, with multiple national
            and international accolades under its belt. Agile was named one of the “Fabulous 50 – The Best of Asia
            Pacific’s Listed Companies” by Forbes and “Asia’s 50 Best Performing Companies” by the US edition of
            Businessweek, while Chairman and President, Chen Zhuo Lin was honoured as “Top 10 Persons of the Year for
            China Enterprise Management Excellence Award” and conferred the “Outstanding Contribution Award for China
            Charitable People” by China Charity Federation. As business thrives, Agile also engages in corporate social
            responsibilities, ranging from the promotion of Chinese cultural legacy, disaster and poverty relief to
            supports for environmental protection, medical care, education, arts and sports. As at 31 December 2017, the
            total donation of Agile and its major shareholders to charitable causes amounts up to RMB 1.5 billion. The
            Group received “China Charity Award”, the top philanthropy prize in China, in 2008, 2011 and 2012; as well
            as “China Philanthropy Outstanding Contribution Enterprise Award”, “Corporate Social Responsibilities Award”
            and “Gold Cup of Guangdong Poverty Relief Hongmian Cup”. It was also named “the most socially responsible
            enterprise”, with regular appearance on Forbes’ China Philanthropy List and Hurun Philanthropy List.
        </p>
        <h4 class="mt-15"><strong>Outlook</strong></h4>
        <p class="mt-10">
            Agile will continue to strive for growth by joining forces with different sectors in society to cultivate
            win-win situations that will bring greater values to our stakeholders and clients, with a view to growing
            into a sustainable, century-long company.
        </p>
    </div>

    <div class="container mt-20 mb-30" id="show_more">
        <div class="row  main-btn">More</div>
    </div>
</block>

<block name="footer_js">
    <script type="text/javascript">
		$(function () {
			$('#show_more').click(function () {
				$('#txt-more').show();
				$(this).hide();
			});
		});
    </script>
</block>