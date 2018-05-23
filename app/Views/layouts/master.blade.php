<?php
use Libs\Session;
$role = Session::getRole();
$vars = [];
$topmenu = 'top-menu';
switch ($role) {
    case 'user':
        $topmenu = 'top-user-menu';
        $vars = Session::getInfo();
//        _d($vars,'$vars');
        break;
//    case 'admin':
//        $topmenu = 'top-admin-menu';
//        break;
    default:
        $topmenu = 'top-menu';
}
?>
        <!DOCTYPE html>
<html style="" class=" js no-touch csstransforms3d csstransitions csstransforms webkit chrome win js"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Basic -->

    <title>{{ $pi_title }}</title>
    <meta name="keywords"
          content="{{ $pi_keywords }}">
    <meta name="description"
          content="{{ $pi_description }}">
    <meta name="author" content="{{ $pi_author }}">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Web Fonts  -->
{{--<link href="css/css" rel="stylesheet" type="text/css">--}}
<!-- Libs CSS -->
    <link rel="stylesheet" href="{{ assets("theme1/css/bootstrap.min.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/menu.css")}}">
{{--<link rel="stylesheet" href="{{ assets("theme1/css/font-awesome.css")}}">--}}
<!-- Font Awesome -->
    <link rel="stylesheet"
          href="{{ assets("adminlte/bower_components/font-awesome/css/font-awesome.min.css")}}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{ assets("adminlte/bower_components/Ionicons/css/ionicons.min.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/owl.carousel.css")}}">
    <link rel="stylesheet" href="{{ assets("css/select2.min.css")}}">
    <link rel="stylesheet" href="{{ assets("css/select2-bootstrap.min.css")}}">
    <link rel="stylesheet" href="{{ assets("css/bootstrap-select.min.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/owl.theme.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/magnific-popup.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/jquery.isotope.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/mediaelementplayer.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme.css")}}">
    <link rel="stylesheet" href="{{ assets("theme1/css/theme-elements.css")}}">
    @if(isset($loadDtCss))
        <link rel="stylesheet" href="{{ assets("css/dataTables.bootstrap.min.css")}}">
    @endif
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
    @yield('head-scripts')
    {!! $pi_google_analytics !!}
</head>
<body class="boxed" style="">
<div class="body">
    @include('parts.' . $topmenu, $vars)
    <div role="main" class="main">
        <style>
            .introduction {
                display: none;
            }
        </style>
        <div style="display:none;">

            @yield('slider-container')
        </div>

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
            @if(isset($message))
                <section class="content">
                    <div class="row col-centered">
                        <div class="col-md-6 col-md-offset-3">
                            {!! $message !!}
                        </div>
                    </div>
                </section><!-- /.message section -->
                <br/>
                <br/>
            @endif

            @if(isset($nocontent))
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>{!! $nocontent !!}</h4>
                        </div>
                    </div>
                </section>
        @else
            @yield('content-pane')
        @endif
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
                            <p>&copy; {{ $pi_title }} Copyright <?=date('Y')?>. All Rights Reserved.</p>
                            <nav style="float:none;">
                                <ul>
                                    <li><a href="<?=url()?>">Home</a></li>
                                    <li><a href="<?=url('tou.php')?>">Terms of Use</a></li>
                                    <li><a href="<?=url('privacy-policy.php')?>">Privacy Policy</a></li>
                                    <li><a href="<?=url('faq.php')?>">FAQ</a></li>
                                    <li><a href="<?=url('refund-policy.php')?>">Refund Policy</a></li>
                                    <li><a href="<?=url('about-us.php')?>">About Us</a></li>
                                    <li><a href="<?=url('contact-us.php')?>">Contact Us</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
{{--<a class="scroll-to-top" href="#" id="scrollToTop"><i class="icon icon-chevron-up icon-white"></i></a>--}}
@if(isset($min) && $min==true):
<script src="{{ assets("min/all.min.js")}}"></script>
<script src="{{ assets("js/select2.full.min.js")}}" type="text/javascript"></script>
@else:
<script src="{{ assets("js/jquery-2.2.4.min.js")}}" type="text/javascript"></script>
<script src="{{ assets("js/bootstrap.min.js")}}" type="text/javascript"></script>
<script src="{{ assets("js/select2.full.min.js")}}" type="text/javascript"></script>
{{--<script src="{{ assets("js/select2.min.js")}}" type="text/javascript"></script>--}}
<script src="{{ assets("js/jquery-calx-2.2.7.min.js")}}" type="text/javascript"></script>
<script src="{{ assets("js/bootstrap-select.min.js")}}" type="text/javascript"></script>
    @if(isset($loadDtJs))
        <script type="text/javascript" src="{{ assets("js/datatables.min.js")}}"></script>
        <script type="text/javascript" src="{{ assets("js/dataTables.bootstrap.min.js")}}"></script>
    @endif
@endif
<script>
    $.fn.select2.defaults.set( "theme", "bootstrap" );
</script>
@yield('end-scripts')
</body>
</html>