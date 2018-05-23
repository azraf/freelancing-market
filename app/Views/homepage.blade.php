@extends('layouts.master',$masterParams)
@section('metatitle', 'MICROJOB SITE TITLE')
@section('sitename', 'MICROJOB SITE NAME')
@section('headline', 'MICROJOB HEADLINE')
@section('pagetitle', 'MICROJOB HEADLINE')
@section('slider-container')
    <div class="slider-container" style="overflow: visible;">

    </div>
@endsection
@section('content-pane')
    <!-- Main content -->
    <section class="content">
        <div class="row col-centered">

                <!-- ==============================================
                Jobs Section
                =============================================== -->
                <section class="jobslist">
                    <div class="container">
                        <div class="content">
                            <div class="row">
                                <table class="table table-bordered" id="list-table">
                                    <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Title</th>
                                        <th>Start Date</th>
                                        <th>Payout</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div><!-- /.row -->
                        </div><!-- /.content -->
                    </div><!-- /.container -->
                </section><!-- /section -->
        </div>
        <div class="row col-centered">

        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-12">
                <div align="center">
                    <h2><strong>DO</strong> or <strong>GET</strong> Help
                    </h2>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-facebook"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Facebook</h4>
                                <p class="tall">Do Social Media marketing on FaceBook!</p>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-youtube-play"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">YouTube</h4>
                                <p class="tall">Make valid traffic to your youtube channel with subscribers</p>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-twitter"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Pinterest and Reddit</h4>
                                <p class="tall">Make most out of your Pinterest campaign. Get huge traffic to your website!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-download"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Articles &amp; Blog Posts</h4>
                                <p class="tall">Make your site content rich to attract search engines</p>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-pencil"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Write a Comment</h4>
                                <p class="tall">Maage your reputation by writing/replying comment on your page or product!</p>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-file-text-o"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Translation</h4>
                                <p class="tall">Make your site more user-friendly to foreign audience</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon  icon-star-half-full"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Vote</h4>
                                <p class="tall">Manage your Votes in a competition or a page!</p>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-search"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Search &amp; Click</h4>
                                <p class="tall">Maintain a good CTR for your website to keep good record!</p>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="feature-box-icon"><i class="icon icon-bookmark-o"></i></div>
                            <div class="feature-box-info">
                                <h4 class="shorter">Bookmarks</h4>
                                <p class="tall">Manage your social bookmarking campaigns for better SEO!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- /.content -->
@endsection
@section('footer-extra')
    <div class="row">
        <div class="col-md-2"><a href="<?=url()?>" class="logo"> <img
                        alt="mini Job" class="img-responsive"
                        src="<?=assets('images/logo.png')?>"> </a></div>
        <div class="col-md-8" style="padding-top:28px;">

        </div>
        <div class="col-md-2" style="margin-top:-20px;">
            <img src="<?=assets('images/payments.png')?>" />
        </div>
    </div>
@endsection
@section('end-scripts')
    {{--<script type="text/javascript" src="assets/js/jquery.cslider.js"></script>--}}
    <script>
    $(function() {
        var dataset = {!! $jobs !!};
        var table = $('#list-table').DataTable({
            "columnDefs": [
                {
                    "targets": [ 0 ],
                    "visible": false,
                    "searchable": false
                }],
            processing: true,
            serverSide: false,
            searching: false,
            paging: false,
            info: false,
            "aaSorting": [[0,'desc']],
            data: dataset
            ,
            columns: [
                { data: 'id', name: 'id' },
                { data: 'title', name: 'title' },
                { data: 'start_date', name: 'start_date' },
                { data: 'perjob_charge', name: 'perjob_charge' },
            ]
        });
    });
</script>
@endsection