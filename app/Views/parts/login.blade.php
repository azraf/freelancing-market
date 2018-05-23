<?php
require_once LANGFILE;
use Libs\Input;

?>
@extends('layouts.master')
@section('metatitle', 'MICROJOB SITE TITLE')
@section('sitename', 'MICROJOB SITE NAME')
@section('headline', 'MICROJOB HEADLINE')
@section('pagetitle', 'MICROJOB HEADLINE')

@section('section-headline')
    <section class="page-top">
        <div class="container">
            <div class="row">
                <h2>
                    Log in
                </h2>
                <small> / User Panel</small>
            </div>
        </div>
    </section>
@endsection
@section('content-pane')
    <!-- Main content -->
    <section class="content">
        <div class="row col-centered">
            <div class="form-sign col-md-6 col-md-offset-3 jumbotron">
                <form method="post">
                    <div class="form-head">
                        <h3>Sign in</h3>
                    </div><!-- /.form-head -->

                    <div class="form-body">
                        <div class="form-group">
                            <label for="email" class="control-label col-xs-2">Email</label>
                            <div class="col-xs-10">
                                <input type="email" class="form-control" name="email" id="email" value="<?php echo escape(Input::get('email')); ?>"
                                       placeholder="<?php echo $lang['email']; ?>">
                            </div>
                        </div><!-- /.form-row -->
                        <div class="form-group">
                            <label for="password" class="control-label col-xs-2">password</label>
                            <div class="col-xs-10">
                                <input type="password" class="form-control" name="password" id="password"
                                       placeholder="<?php echo $lang['password']; ?>">
                            </div>
                        </div><!-- /.form-row -->


                    </div><!-- /.form-body -->
                    <br />
                    <br />
                    <div class="form-foot">
                        <div class="form-actions">
                            <input type="hidden" name="token" value="<?php echo $token; ?>"/>
                            <input value="Sign in to MicroJob" class="btn btn-primary pull-right" type="submit">
                        </div><!-- /.form-actions -->
                    </div><!-- /.form-foot -->
                </form>

            </div><!-- /.form-sign -->
        </div>
        <!-- Your Page Content Here -->

    </section><!-- /.content -->
@endsection
@section('end-scripts')
@endsection
