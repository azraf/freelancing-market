<header id="header">
    <div class="container">
        <h1 class="logo"><a href="<?=url()?>"> <img alt="MicroJob Logo" src="<?=assets('images/logo.png')?>">
            </a>
        </h1>
        <button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse">
            <i class="icon icon-bars"></i>
        </button>
    </div>
    {{--<nav class="navbar navbar-default">--}}
        <div class="navbar-collapse nav-main-collapse collapse">
            <div class="container">
                <nav class="nav-main mega-menu">
                    <ul class="nav nav-pills nav-main" id="mainMenu">
                        <li><a href="<?=url()?>">Home</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" href="#"> FIND a JOB<i
                                        class="icon icon-angle-down"></i> </a>
                            <ul class="dropdown-menu">
                                <li><a href="<?=url('job-list.php')?>">Job List</a>
                                <li><a href="<?=url('my-pendings-reviews.php')?>">Pending Client Review</a></li>
                                <li><a href="<?=url('my-completedjobs.php')?>">My Completed Jobs</a></li>
                                <?php /*  <li><a href="<?=url('my-jobs-archive.php')?>">My Old Jobs</a></li> */ ?>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" href="#"> POST a JOB<i
                                        class="icon icon-angle-down"></i> </a>
                            <ul class="dropdown-menu">
                                <li><a href="<?=url('job-post.php')?>">Post New Job</a></li>
                                <li><a href="<?=url('job-completed.php')?>">Completed Jobs</a></li>
                                <li><a href="<?=url('job-running.php')?>">Running Campaigns</a></li>
                                <li><a href="<?=url('job-apply-review.php')?>">Review Applied Jobs</a></li>
                                <li><a href="<?=url('job-pending-appoval.php')?>">Pending Admin approvals</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" href="#"> Payment<i
                                        class="icon icon-angle-down"></i> </a>
                            <ul class="dropdown-menu">
                                <li><a href="<?=url('acc-deposit.php')?>">Deposit</a></li>
                                <li><a href="<?=url('acc-withdraw.php')?>">Withdraw</a></li>
                                <li><a href="<?=url('acc-transaction.php')?>">Transaction History</a></li>
                                <?php /*<li><a href="<?=url('acc-pending.php')?>">Pending Admin approvals</a></li> */?>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" href="#"> Help <i
                                        class="icon icon-angle-down"></i> </a>
                            <ul class="dropdown-menu">
                                <li><a href="<?=url('faq.php')?>">Frequently Asked Questions</a>
                                </li>
                                <li><a href="<?=url('privacy-policy.php')?>">Privacy Policy</a></li>
                                <li><a href="<?=url('tou.php')?>">Terms of Service</a></li>
                                <li><a href="<?=url('refund-policy.php')?>">Refund Policy</a></li>
                                <li><a href="<?=url('help.php')?>">Support / Ticket</a></li>
                            </ul>
                        </li>
                        <!-- UserPanel start -->
                        <li class="dropdown mega-menu-item mega-menu-signin signin" id="headerAccount"><a
                                    class="dropdown-toggle" href="#"> <i
                                        class="icon icon-user"></i> Dashboard <i class="icon icon-angle-down"></i> </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label><?=$name;?></label>
                                                <br/>
                                                User ID: <strong><?=$userid;?></strong>
                                            </div>
                                            <div class="col-md-6 pull-right">
                                                <div class="text-right">
                                                    <p class="sign-up-info pull-right">
                                                        <a id="top-menu-logout" class="" href="<?=url('account.php')?>">Account
                                                            Settings</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="signin-form">
                                                    <div class=""></div>

                                                    <div class="block">
                                                        <hr class="small-hr"/>
                                                        <strong><span class="text-info">Balanace</span> <span
                                                                    class="text-primary"><?=$balance;?></span></strong>
                                                        <hr class="small-hr"/>
                                                        <strong><span class="text-info">Pending</span> <span
                                                                    class="text-primary"><?=$pending;?> </span></strong>
                                                        {{-- <br /> Locked   --}}
                                                        {{--<br/> Total Campaign--}}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="small-hr"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                            </div>
                                            <div class="col-md-6 pull-right">
                                                <div class="text-right">
                                                    <p class="sign-up-info pull-right">
                                                        <a id="top-menu-logout" class="" href="<?=url('logout.php')?>">Log
                                                            out</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- UserPanel Stop -->
                    </ul>
                </nav>
            </div>
        </div>
    {{--</nav>--}}
</header>