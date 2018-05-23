<header id="header">
    <?php
    ?>
    <div class="container">
        <h1 class="logo"><a href="<?=url()?>"> <img alt="MicroJob Logo" src="<?=assets('images/logo.png')?>"> </a>
        </h1>
        <button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse">
            <i class="icon icon-bars"></i>
        </button>
    </div>
    <div class="navbar-collapse nav-main-collapse collapse">
        <div class="container">
            <nav class="nav-main mega-menu">
                <ul class="nav nav-pills nav-main" id="mainMenu">
                    <li><a href="<?=url()?>">Home</a></li>
                    <li><a href="<?=url('job-list.php')?>"><i class="icon icon-briefcase"></i> FIND a JOB</a></li>
                    <li><a href="<?=url('job-post.php')?>"><i class="icon icon-upload"></i> POST a JOB</a></li>
                    <li><a href="<?=url('sign-up.php')?>"><i class="icon icon-user"></i> Register</a></li>
                    <li><a href="<?=url('login.php')?>"><i class="icon icon-user"></i> Login</a></li>
                    <!-- Sign in start -->

                    <!-- Sign in Stop -->
                </ul>
            </nav>
        </div>
    </div>
</header>