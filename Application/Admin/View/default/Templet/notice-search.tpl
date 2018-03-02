<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie7"> <![endif]-->
<!--[if IE 8 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]>
<html xmlns="http://www.w3.org/1999/xhtml"> <![endif]-->
<head>
    <meta charset="utf-8">
    <meta property="qc:admins" content="22622356756301671663756367"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/public/huiadmin/lib/html5.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/respond.min.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/PIE-2.0beta1/PIE_IE678.js"></script>
    <![endif]-->
    <title>
        预览
    </title>
    <meta name="keywords" content="雅居乐">
    <meta name="description" content="雅居乐">
    <!--sdk-->

    <link type="text/css" rel="stylesheet" href="/public/bootstrap/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="/public/css/home/globle.css"/>

    <script type="text/javascript" src="/public/js/jquery-ui/external/jquery/jquery.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
    <!--基地预约-->
   
    <link rel="stylesheet" href="/public/css/home/news/news-detail.css">


    


    <!--[if IE 6]>
    <script type="text/javascript" src="/public/js/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

</head>

<body>
    <div class="section1">
        <div class="content container">
            <h2>{$news.name}</h2>
            <p class="second">发布时间：<span class="time">{$news.begin_time}</span>&nbsp;&nbsp;&nbsp;&nbsp;来源：<span class="source">{$news.author}</span>&nbsp;&nbsp;&nbsp;&nbsp;阅读数：<span>{$news.view_count}</span>
            </p>
            <div class="box">
                {$news.note}
            </div>
        </div>
    </div>
    <script type="text/javascript">
        
    </script>
</body>
</html>