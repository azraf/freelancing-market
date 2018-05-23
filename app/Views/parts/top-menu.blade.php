<header id="header">
    <h1 class="logo pull-left"><a href="<?=url()?>"> <img alt="MicroJob Logo" src="<?=assets('images/logo.png')?>">
        </a>
    </h1>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<?=url()?>">Home</a></li>
                    <li><a href="<?=url('job-list.php')?>"><i class="icon icon-briefcase"></i> FIND a JOB</a></li>
                    <li><a href="<?=url('job-post.php')?>"><i class="icon icon-upload"></i> POST a JOB</a></li>
                    <li><a href="<?=url('sign-up.php')?>"><i class="icon icon-user"></i> Register</a></li>
                    <li><a href="<?=url('login.php')?>"><i class="icon icon-user"></i> Login</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>