<header id="header">
            <h1 class="logo pull-left"><a href="<?=url()?>"> <img alt="MicroJob Logo" src="<?=assets('images/logo.png')?>">
                </a>
            </h1>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                   <?php /* {{--<li><a href="<?=url()?>">Home</a></li>--}} */ ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">FIND a JOB <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?=url('job-list.php')?>">Job List</a>
                            <li><a href="<?=url('my-pendings-reviews.php')?>">Pending Client Review</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?=url('my-completedjobs.php')?>">My Completed Jobs</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Campaigns <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?=url('job-post.php')?>">Post New Job</a></li>
                            <li><a href="<?=url('job-completed.php')?>">Completed Jobs</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?=url('job-running.php')?>">Running Campaigns</a></li>
                            <li><a href="<?=url('job-apply-review.php')?>">Review Applied Jobs</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?=url('job-pending-appoval.php')?>">Pending Admin approvals</a></li>
                        </ul>
                    </li>
                   <li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Help <span class="caret"></span></a>
                       <ul class="dropdown-menu">
                           <li><a href="<?=url('faq.php')?>">Frequently Asked Questions</a>
                           </li>
                           <li><a href="<?=url('privacy-policy.php')?>">Privacy Policy</a></li>
                           <li><a href="<?=url('tou.php')?>">Terms of Service</a></li>
                           <li><a href="<?=url('refund-policy.php')?>">Refund Policy</a></li>
                           <li><a href="<?=url('help.php')?>">Support / Ticket</a></li>
                       </ul>
                   </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account <span class="caret"></span></a>
                        <ul class="dropdown-menu">

                            <li><a href="<?=url('acc-deposit.php')?>">Deposit</a></li>
                            <li><a href="<?=url('acc-withdraw.php')?>">Withdraw</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?=url('account.php')?>">Account</a></li>
                            <li><a href="<?=url('acc-transaction.php')?>">Transaction History</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?=url('logout.php')?>">Log out</a></li>

                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>