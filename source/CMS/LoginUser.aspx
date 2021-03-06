﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="CMS.LoginUser" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>
<html lang="en-us" id="extr-page">

<!-- Mirrored from 192.241.236.31/themes/preview/smartadmin/1.8.x/ajax/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Jul 2017 06:57:55 GMT -->
<head>
    <meta charset="utf-8">
    <title>SmartAdmin</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- #CSS Links -->
    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="/Design/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/Design/css/font-awesome.min.css">

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/Design/css/smartadmin-production-plugins.min.css">--%>
    <link rel="stylesheet" type="text/css" media="screen" href="/Design/css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/Design/css/smartadmin-skins.min.css">

    <!-- SmartAdmin RTL Support -->
    <link rel="stylesheet" type="text/css" media="screen" href="/Design/css/smartadmin-rtl.min.css">

    <!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->



    <!-- #FAVICONS -->
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">



    <!-- #APP SCREEN / ICONS -->
    <!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">

    <%--for test this is online--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //function test() {
        //    var def = $.Deferred();
        //    setTimeout(function () {
        //        def.reject();
        //    }, 1000);
        //    return def.promise();
        //}
        //test().done(function () { alert('done')}).fail(function (){alert('failed')});
    </script>
</head>

<body class="animated fadeInDown">

    <header id="header">

        <div id="logo-group">
            <span id="logo">
                <img src="/Design/img/logo.png" alt="مرورگران">
            </span>
        </div>
        <span id="extr-page-header-space">
            <a href="signup.aspx" class="btn btn-danger">اکانت نیاز دارید؟</a>
           <%-- <button class="btn btn-primary btn-lg" id="btnsignup">
                ثبت نام 
            </button>--%>

        </span>

    </header>




    <div id="main" role="main">

        <!-- MAIN CONTENT -->
        <div id="content" class="container">

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
                    <h1 class="txt-color-red login-header-big">مرورگران </h1>
                    <div class="hero">

                        <div class="pull-left login-desc-box-l">
                            <h4 class="paragraph-header">این مهم است که انتظار داشته باشیم هر روز هوشمندتر باشیم</h4>

                        </div>

                        <img src="/Design/img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width: 210px">
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <h5 class="about-heading">آیا هوشمندتر هستیم؟</h5>
                            <p>
                                نوآوری یکی از پایه های اصلی توسعه در قرن حاضر است ، هوشمندانه از نوآوری استفاده میکنیم 
                            </p>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <h5 class="about-heading">ما و شما</h5>
                            <p>
                                همیشه تلاش کردیم که پای صحبتهای دوستان ، مشتریان و متخصصان بشینیم و تجربیات آنهارا دانش خود قرار دهیم
                            </p>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
                    <form id="Form1" name="login-form" runat="server">
                        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                        <uc1:Login ID="LoginControl" runat="server" /> 


                       <%-- <div class="modal fade" id="modal_signUp" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-lg" role="document" id="modalDrag">
                                <div class="modal-content persian">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2 class="modal-title" style="text-align: right;">
                                            <span class="label label-primary">ثبت نام در سامانه
                                            </span>
                                        </h2>

                                    </div>
                                    <div class="modal-body">
                                        <div class="box-body">
                                            <%--<uc1:UscSignUp runat="server" ID="UscSignUp" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
                                    </div>
                                </div>
                            </div>
                        </div>--%>

                    </form>
                </div>
            </div>

        </div>
    </div>

 <%--   <script type="text/javascript">
        $('#btnsignup').on('click', function (e) {
            e.preventDefault();
            $("#modal_signUp").modal();
        });

    </script>--%>
    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <%--	<script src="js/plugin/pace/pace.min.js"></script>

	    
		<script> if (!window.jQuery) { document.write('<script src="/Design/js/libs/jquery-2.1.1.min.js"><\/script>'); } </script>

	    
		<script> if (!window.jQuery.ui) { document.write('<script src="/Design/js/libs/jquery-ui-1.10.3.min.js"><\/script>'); } </script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="/Design/js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="/Design/js/bootstrap/bootstrap.min.js"></script>

	 
		
		<!-- JQUERY MASKED INPUT -->
		<script src="/Design/js/plugin/masked-input/jquery.maskedinput.min.js"></script>
		
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="/Design/js/app.min.js"></script>--%>
</body>

<!-- Mirrored from 192.241.236.31/themes/preview/smartadmin/1.8.x/ajax/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Jul 2017 06:57:57 GMT -->
</html>
