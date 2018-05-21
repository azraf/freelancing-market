<?php
namespace Libs;

use Spatie\Menu\Menu;

$menu = Menu::new()
->add(Link::to('/', 'Home'))
->add(Link::to('/job-list.php', 'Find A Job'))
->add(Link::to('/job-post.php', 'Post A Job'))
->add(Link::to('/help.php', 'Help'))
->add(Link::to('/sign-in.php', 'Sign In'))

;




?>