<!DOCTYPE html>
<!-- saved from url=(0023)https://www.jobboy.com/ -->
<html style="" class=" js no-touch csstransforms3d csstransitions csstransforms webkit chrome win js"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Basic -->

    <title>JobBoy : Online Jobs Made Easy!! - Home</title>
    <meta name="keywords"
          content="mechanical turk, micro workers, micro jobs, make money, make money at home, make money from home, make money on the internet, make extra money, make money online, make money home based business">
    <meta name="description"
          content="Jobboy will show you how to earn money online by applying for online jobs. Go through Jobboy&#39;s articles, follow the step by step instructions on how to get started.">
    <meta name="author" content="Jobboy Ltd.">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Web Fonts  -->
    <link href="css/css" rel="stylesheet" type="text/css">
    <!-- Libs CSS -->
    <link rel="stylesheet" href="{{ assets("theme1/css/bootstrap.min.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/font-awesome.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/owl.carousel.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/owl.theme.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/magnific-popup.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/jquery.isotope.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/mediaelementplayer.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme-elements.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme-shop.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme-animate.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/settings.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/component.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme-responsive.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/default.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/custom.css")}}">
    @yield('head-styles')
    <!--[if IE]>
    <link rel="stylesheet" href="css/ie.css">
    <![endif]-->

    <!--[if lte IE 8]>
    <script src="template/vendor/respond.js"></script>
    <![endif]-->

</head>
<body class="boxed" style="">
<div class="body">
    @include('parts.top-user-menu')
    <div role="main" class="main">
        <style>
            .introduction {
                display: none;
            }
        </style>
        <div style="display:none;">

        @yield('slider-container')
        </div>

        {{--<div class="home-intro" style="display:none;">--}}
            {{--<div class="container">--}}
                {{--<div class="row">--}}
                    {{--<div class="col-md-8">--}}
                        {{--<p> You can do all this today by simply signing up to <em>post a job!</em></p>--}}
                    {{--</div>--}}
                    {{--<div class="col-md-4">--}}
                        {{--<div class="get-started"><a href="https://www.jobboy.com/#" class="btn btn-lg btn-primary">Get--}}
                                {{--Started Now!</a>--}}
                            {{--<div class="learn-more"> or <a href="https://www.jobboy.com/index.html">learn more.</a>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
        <div class="container">
            <div class="row">

            </div>
        </div>
        @yield('section-headline')
        <div class="container">
            <!-- Avail Jobs Baslangic -->
            <div class="row col-centered">
                @include('flash')
            </div>
            <br />
        @yield('content-pane')

            <!-- Avail Jobs Bitis -->
            <!-- 4. Things you can do -->
        </div>
        <footer class="short" id="footer" style="margin-top:10px;">
            <div class="container">
                <div class="row">

                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                @yield('footer-extra')
                    <div class="row">
                        <div class="col-md-12" style="text-align:center;">
                            <p>© Jobboy.com Copyright 2016. All Rights Reserved.</p>
                            <nav style="float:none;">
                                <ul>
                                    <li><a href="https://www.jobboy.com/index.php">Home</a></li>
                                    <li><a href="https://www.jobboy.com/index.php?inc=tos">Terms of Use</a></li>
                                    <li><a href="https://www.jobboy.com/index.php?inc=privacypolicy">Privacy Policy</a>
                                    </li>
                                    <li><a href="https://www.jobboy.com/index.php?inc=faq">FAQ</a></li>
                                    <li><a href="https://www.jobboy.com/index.php?inc=about">About Us</a></li>
                                    <li><a href="https://www.jobboy.com/index.php?inc=contactus">Contact Us</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<a class="scroll-to-top" href="https://www.jobboy.com/#" id="scrollToTop"><i class="icon icon-chevron-up icon-white"></i></a>
<script src="assets/js/jQuery-2.2.4.min.js"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
@yield('end-scripts')
</body>
</html>