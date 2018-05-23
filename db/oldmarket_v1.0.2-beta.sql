-- --------------------------------------------------------

--
-- Table structure for table `attempts`
--

CREATE TABLE `attempts` (
  `id` int(11) NOT NULL,
  `ip` varchar(39) NOT NULL,
  `expiredate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attempts`
--

INSERT INTO `attempts` (`id`, `ip`, `expiredate`) VALUES
(1, '127.0.0.1', '2018-01-16 08:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `auth_admin`
--

CREATE TABLE `auth_admin` (
  `id` int(11) NOT NULL,
  `adminid` varchar(15) NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(300) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `imagelocation` text NOT NULL,
  `tokencode` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_admin`
--

INSERT INTO `auth_admin` (`id`, `adminid`, `username`, `password`, `isactive`, `dt`, `name`, `email`, `imagelocation`, `tokencode`, `created_at`, `updated_at`, `deleted`) VALUES
(12, 'zxb-123121-wuu', 'admin', '$2y$10$b.5jT2rKHxyM3KcWtpfTVeLNUqEkfMOcOaF.5ysu5m9wRXolKNBZ6', 1, '2017-12-31 20:05:00', 'Admin', 'admin@admin.com', 'uploads/default.png', '', '2017-12-31 21:05:00', '2018-01-14 00:12:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_users`
--

CREATE TABLE `auth_users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(15) NOT NULL,
  `username` varchar(300) NOT NULL,
  `name` varchar(300) NOT NULL,
  `address` text,
  `phone` varchar(300) DEFAULT NULL,
  `country_id` tinyint(3) UNSIGNED NOT NULL,
  `imagelocation` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `delete_remove` tinyint(1) NOT NULL DEFAULT '0',
  `user_type` tinyint(3) NOT NULL DEFAULT '1',
  `membershipid` int(11) DEFAULT NULL,
  `membership_bids` varchar(300) DEFAULT NULL,
  `membership_date` datetime DEFAULT NULL,
  `schedule_payments` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE `bugs` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `reporter` varchar(300) NOT NULL,
  `title` varchar(300) NOT NULL,
  `priority` varchar(300) NOT NULL,
  `severity` varchar(300) NOT NULL,
  `description` mediumtext NOT NULL,
  `reproducibility` mediumtext NOT NULL,
  `fixed` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE `cat` (
  `id` int(11) NOT NULL,
  `catid` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` text CHARACTER SET utf8,
  `item_order` tinyint(3) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `delete_remove` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cat_sub`
--

CREATE TABLE `cat_sub` (
  `id` int(11) NOT NULL,
  `subcatid` varchar(25) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` text CHARACTER SET utf8,
  `item_order` tinyint(3) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `delete_remove` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `setting` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`setting`, `value`) VALUES
('attack_mitigation_time', '+30 minutes'),
('attempts_before_ban', '30'),
('attempts_before_verify', '5'),
('bcrypt_cost', '10'),
('cookie_domain', NULL),
('cookie_forget', '+30 minutes'),
('cookie_http', '0'),
('cookie_name', 'authID'),
('cookie_path', '/'),
('cookie_remember', '+1 month'),
('cookie_secure', '0'),
('emailmessage_suppress_activation', '0'),
('emailmessage_suppress_reset', '0'),
('mail_charset', 'UTF-8'),
('password_min_score', '0'),
('request_key_expiration', '+10 minutes'),
('site_activation_page', 'activate'),
('site_email', 'admin@microjob.world'),
('site_key', 'fghuior.)/!/jdUkd8s2!7HVHG7777ghg'),
('site_name', 'MicrojobWorld'),
('site_password_reset_page', 'reset'),
('site_timezone', 'Europe/Paris'),
('site_url', 'https://microjob.world'),
('smtp', '0'),
('smtp_auth', '1'),
('smtp_host', 'mail.microjob.world'),
('smtp_password', 'IUkJ876&Ys56'),
('smtp_port', '25'),
('smtp_security', NULL),
('smtp_username', 'admin@microjob.world'),
('table_admin', 'auth_admin'),
('table_attempts', 'attempts'),
('table_requests', 'requests'),
('table_sessions', 'sessions'),
('table_users', 'auth_users'),
('verify_email_max_length', '100'),
('verify_email_min_length', '5'),
('verify_email_use_banlist', '1'),
('verify_password_min_length', '3');

-- --------------------------------------------------------

--
-- Table structure for table `config_admin`
--

CREATE TABLE `config_admin` (
  `setting` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config_admin`
--

INSERT INTO `config_admin` (`setting`, `value`) VALUES
('attack_mitigation_time', '+30 minutes'),
('attempts_before_ban', '30'),
('attempts_before_verify', '5'),
('bcrypt_cost', '10'),
('cookie_domain', NULL),
('cookie_forget', '+30 minutes'),
('cookie_http', '0'),
('cookie_name', 'authID'),
('cookie_path', '/'),
('cookie_remember', '+1 month'),
('cookie_secure', '0'),
('emailmessage_suppress_activation', '0'),
('emailmessage_suppress_reset', '0'),
('mail_charset', 'UTF-8'),
('password_min_score', '0'),
('request_key_expiration', '+10 minutes'),
('site_activation_page', 'activate'),
('site_email', 'admin@microjob.world'),
('site_key', 'fghuior.)/!/jdUkd8s2!7HVHG7777ghg'),
('site_name', 'MicrojobWorld'),
('site_password_reset_page', 'reset'),
('site_timezone', 'Europe/Paris'),
('site_url', 'https://microjob.world'),
('smtp', '0'),
('smtp_auth', '1'),
('smtp_host', 'mail.microjob.world'),
('smtp_password', 'IUkJ876&Ys56'),
('smtp_port', '25'),
('smtp_security', NULL),
('smtp_username', 'admin@microjob.world'),
('table_admin', 'auth_admin'),
('table_attempts', 'attempts'),
('table_requests', 'requests'),
('table_sessions', 'sessions'),
('table_users', 'auth_admin'),
('verify_email_max_length', '100'),
('verify_email_min_length', '5'),
('verify_email_use_banlist', '1'),
('verify_password_min_length', '3');

-- --------------------------------------------------------

--
-- Table structure for table `country_job`
--

CREATE TABLE `country_job` (
  `job_id` int(11) NOT NULL,
  `country_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(3) NOT NULL,
  `currency_code` varchar(300) NOT NULL,
  `currency_name` varchar(300) NOT NULL,
  `currency_symbol` varchar(300) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `currency_code`, `currency_name`, `currency_symbol`, `date_added`) VALUES
(1, 'USD', 'US Dollar', '$', '2017-01-06 18:10:14'),
(2, 'AUD', 'Australian dollar', '$', '2017-01-06 18:12:26'),
(3, 'BRL', 'Brazilian real', 'R$', '2017-01-06 18:13:42'),
(5, 'CAD', 'Canadian dollar', '$', '2017-01-06 18:28:49'),
(6, 'CLP', 'Chilean peso', '$', '2017-01-06 18:29:49'),
(7, 'CNY', 'Chinese yuan', 'Â¥', '2017-01-06 18:45:23'),
(8, 'DKK', 'Danish krone', 'kr', '2017-01-06 18:46:47'),
(9, 'EUR', 'Euro', 'â‚¬', '2017-01-06 18:47:35'),
(10, 'HKD', 'Hong Kong dollar', '$', '2017-01-06 18:48:36'),
(11, 'INR', 'Indian rupee', 'â‚¹', '2017-01-06 18:49:26'),
(12, 'IDR', 'Indonesian rupiah', 'Rp', '2017-01-06 21:51:54'),
(13, 'ILS', 'Israeli new shekel', 'â‚ª', '2017-01-06 21:53:09'),
(14, 'JPY', 'Japanese yen', 'Â¥', '2017-01-06 21:54:13'),
(15, 'KES', 'Kenyan shilling', 'Sh', '2017-01-06 21:55:20'),
(16, 'KPW', 'North Korean won', 'â‚©', '2017-01-06 21:56:20'),
(17, 'KRW', 'South Korean won', 'â‚©', '2017-01-06 21:57:08'),
(18, 'MYR', 'Malaysian ringgit', 'RM', '2017-01-06 21:58:22'),
(19, 'MXN', 'Mexican peso', '$', '2017-01-06 21:59:20'),
(20, 'NZD', 'New Zealand dollar', '$', '2017-01-06 22:00:34'),
(21, 'NOK', 'Norwegian krone', 'kr', '2017-01-06 22:01:32'),
(22, 'PKR', 'Pakistani rupee', 'â‚¨', '2017-01-06 22:02:35'),
(23, 'PLN', 'Polish zÅ‚oty', 'zÅ‚', '2017-01-06 22:03:32'),
(24, 'PHP', 'Philippine peso', 'â‚±', '2017-01-06 22:04:48'),
(25, 'RUB', 'Russian ruble', 'â‚½', '2017-01-06 22:08:42'),
(26, 'SGD', 'Singapore dollar', '$', '2017-01-06 22:09:47'),
(27, 'ZAR', 'South African rand', 'R', '2017-01-06 22:12:54'),
(28, 'SEK', 'Swedish krona', 'kr', '2017-01-06 22:13:58'),
(29, 'CHF', 'Swiss franc', 'Fr', '2017-01-06 22:14:41'),
(30, 'TWD', 'New Taiwan dollar', '$', '2017-01-06 22:15:53'),
(31, 'TRY', 'Turkish lira', 'â‚º', '2017-01-06 22:17:25'),
(32, 'AED', 'United Arab Emirates dirham', 'Ø¯.Ø¥', '2017-01-06 22:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_job`
--

CREATE TABLE `deleted_job` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `transid` int(11) NOT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_fund`
--

CREATE TABLE `deposit_fund` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `deposit_amount` decimal(8,2) NOT NULL,
  `deposit_gateway` varchar(255) NOT NULL,
  `deposit_email` varchar(255) NOT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext NOT NULL,
  `file_name` varchar(300) NOT NULL,
  `fileupload` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `extension` varchar(300) NOT NULL,
  `size` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `jobid` varchar(15) NOT NULL,
  `clientid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `sub` int(11) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `slug` mediumtext NOT NULL,
  `id_zone` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `job_type` varchar(300) DEFAULT NULL,
  `budget` varchar(50) DEFAULT NULL,
  `start_date` varchar(300) DEFAULT NULL,
  `end_date` varchar(300) DEFAULT NULL,
  `completition_proof` text NOT NULL,
  `job_seats_min` int(7) DEFAULT NULL,
  `job_seats_max` int(7) DEFAULT '20',
  `job_seated` int(7) DEFAULT '0',
  `perjob_charge` decimal(8,2) NOT NULL,
  `engine_charge` decimal(8,2) NOT NULL,
  `total_charge` decimal(8,2) DEFAULT NULL,
  `has_countries` tinyint(1) DEFAULT '0',
  `exclude_countries` tinyint(1) DEFAULT NULL,
  `skills` varchar(300) DEFAULT NULL,
  `message` longtext,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `delete_remove` tinyint(4) NOT NULL,
  `charged` tinyint(1) DEFAULT '0',
  `opened` tinyint(1) DEFAULT '1',
  `invite` tinyint(1) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `completed` tinyint(2) NOT NULL DEFAULT '0',
  `featured` tinyint(4) DEFAULT NULL,
  `featured_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_notcountry`
--

CREATE TABLE `job_notcountry` (
  `job_id` int(11) NOT NULL,
  `country_id` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_region`
--

CREATE TABLE `job_region` (
  `job_id` int(11) NOT NULL,
  `regions_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `url` varchar(300) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `opened` tinyint(4) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `bugid` int(11) NOT NULL,
  `disc` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `milestone`
--

CREATE TABLE `milestone` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` mediumtext NOT NULL,
  `budget` varchar(300) NOT NULL,
  `start_date` varchar(300) NOT NULL,
  `end_date` varchar(300) NOT NULL,
  `funded` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pageinfo`
--

CREATE TABLE `pageinfo` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `use_icon` tinyint(4) NOT NULL,
  `site_icon` varchar(300) NOT NULL,
  `tagline` text NOT NULL,
  `url` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `author` varchar(300) NOT NULL,
  `mail` text NOT NULL,
  `mailpass` text NOT NULL,
  `bgimage` text NOT NULL,
  `job_limit` tinyint(4) NOT NULL,
  `service_limit` tinyint(4) NOT NULL,
  `proposal_limit` tinyint(4) NOT NULL,
  `top_title` varchar(300) NOT NULL,
  `show_downtitle` tinyint(4) NOT NULL,
  `down_title` varchar(300) NOT NULL,
  `searchterm` varchar(300) NOT NULL,
  `header_img` text NOT NULL,
  `cattagline` varchar(300) NOT NULL,
  `testtagline` varchar(300) NOT NULL,
  `statstagline` varchar(300) NOT NULL,
  `about_top_title` varchar(300) NOT NULL,
  `about_hello` longtext NOT NULL,
  `about_header_img` text NOT NULL,
  `about_whitebg` mediumtext NOT NULL,
  `teamtagline` varchar(300) NOT NULL,
  `timelinetagline` varchar(300) NOT NULL,
  `how_top_title` varchar(300) NOT NULL,
  `how_header_img` text NOT NULL,
  `faq_top_title` varchar(300) NOT NULL,
  `faq_header_img` mediumtext NOT NULL,
  `faq_hello` longtext NOT NULL,
  `contact_top_title` varchar(300) NOT NULL,
  `contact_header_img` mediumtext NOT NULL,
  `contact_location` mediumtext NOT NULL,
  `contact_phone` mediumtext NOT NULL,
  `contact_email` mediumtext NOT NULL,
  `contact_map` mediumtext NOT NULL,
  `footer_about` mediumtext NOT NULL,
  `facebook` varchar(300) NOT NULL,
  `twitter` varchar(300) NOT NULL,
  `google` varchar(300) NOT NULL,
  `instagram` varchar(300) NOT NULL,
  `linkedin` varchar(300) NOT NULL,
  `pricing_top_title` varchar(300) NOT NULL,
  `pricing_header_img` mediumtext NOT NULL,
  `services_header_img` varchar(300) NOT NULL,
  `jobs_header_img` varchar(300) NOT NULL,
  `google_analytics` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pageinfo`
--

INSERT INTO `pageinfo` (`id`, `title`, `use_icon`, `site_icon`, `tagline`, `url`, `description`, `keywords`, `author`, `mail`, `mailpass`, `bgimage`, `job_limit`, `service_limit`, `proposal_limit`, `top_title`, `show_downtitle`, `down_title`, `searchterm`, `header_img`, `cattagline`, `testtagline`, `statstagline`, `about_top_title`, `about_hello`, `about_header_img`, `about_whitebg`, `teamtagline`, `timelinetagline`, `how_top_title`, `how_header_img`, `faq_top_title`, `faq_header_img`, `faq_hello`, `contact_top_title`, `contact_header_img`, `contact_location`, `contact_phone`, `contact_email`, `contact_map`, `footer_about`, `facebook`, `twitter`, `google`, `instagram`, `linkedin`, `pricing_top_title`, `pricing_header_img`, `services_header_img`, `jobs_header_img`, `google_analytics`, `created_at`, `updated_at`) VALUES
(1, 'CPA Marketplace', 1, 'fa-coffee', 'Ultimate MicroJob Marketplace', 'http://joblanding.dev', 'Ultimate CPA Marketplace', 'Freelance Marketplace, MicroJob Freelance Marketplace', 'MakeWebSmart Technology', 'yourmail@mail.com', 'Your Mail Password', 'assets/img/bg/1475740653.jpg', 4, 2, 2, 'Find & Hire talented freelancers.', 1, 'You need top quality freelancers who can make your business thrive.', 'Tell us what freelance service you need e.g Design a Company Logo', 'assets/img/header/1510495921p-mobile-01.jpg', 'Here\'s the most popular categories.', 'We have the highest project success rate in the freelance industry. Here\'s what some of our happy customers are saying.', 'It\'s a pretty awesome stats area', 'How we grew into what we are today.', '<div class=\"col-lg-12\">\r\n		 <h3>Hello There</h3>\r\n		 <p>Micro Job World is the Ultimate Freelance Marketplace for employers and freelancers to connect, collaborate, and get work \r\ndone.</p>\r\n		\r\n		 <h3>Our Why?</h3>\r\n		 <p>The core of this system is to build a great product that is \r\nbeautifully designed, simple to use, user friendly with great focus on \r\nuser experience and customer service.</p>\r\n		\r\n		 </div><p><br></p>', 'assets/img/about/1483381543.jpg', 'We work hard to build a great product that is beautifully designed, simple to use, user friendly with great focus on user experience and customer service.', 'Our Brilliant and Harworking Team.', 'Our Story told in a few lines.', 'Get the job done right.', 'assets/img/how/1483453827.jpg', 'Frequently Asked Questions.', 'assets/img/faq/1483523347.jpg', '<p>\r\n\r\n      </p><section>\r\n        <div class=\"container\">\r\n\r\n          <h3>Introduction</h3>\r\n          <p>Typography (from the Greek words Ï„ÏÏ€Î¿Ï‚ typos â€œformâ€ and \r\nÎ³ÏÎ¬Ï†ÎµÎ¹Î½ graphein â€œto writeâ€) is the art and technique of arranging type \r\nto make written language readable and beautiful. The arrangement of type\r\n involves selecting typefaces, point size, line length, line-spacing \r\n(leading), letter-spacing (tracking), and adjusting the space within \r\nletters pairs (kerning). <a href=\"http://en.wikipedia.org/wiki/Type_design\">Type design</a>\r\n is a closely related craft, sometimes considered part of typography; \r\nmost typographers do not design typefaces, and some type designers do \r\nnot consider themselves typographers. In modern times, typography has \r\nbeen put in film, television and online broadcasts to add emotion to \r\ncommunication.</p>\r\n\r\n          <p>Donec scelerisque urna nibh, et interdum ex pellentesque \r\ntincidunt. Morbi lorem felis, dapibus ac eleifend id, commodo at diam. \r\nPraesent finibus velit est, eget posuere nisi sodales eget. Nunc iaculis\r\n euismod malesuada. Aenean vitae <a href=\"http://shamsoft.net/thejobs/page-typography.html#\">sample link</a> mauris eu lacus <strong>strong text</strong> tempor consequat <em>italic sample</em>\r\n nec eu justo. Nullam convallis, lacus pretium blandit facilisis, leo \r\nelit aliquet urna, non cursus est odio ut purus. Quisque consequat \r\nposuere est id viverra.</p>\r\n\r\n          <p class=\"lead\">Is a closely related craft, sometimes \r\nconsidered part of typography; most typographers do not design \r\ntypefaces, and some type designers do not consider themselves \r\ntypographers. In modern times, typography has been put in film, \r\ntelevision and online broadcasts to add emotion to communication.</p>\r\n\r\n          <p>Proin libero justo, sollicitudin dictum sagittis eu, gravida vel erat. Mauris pharetra odio nec nisi ullamcorper bibendum. <a href=\"http://shamsoft.net/thejobs/page-typography.html#\">Aenean pharetra fermentum semper</a>.\r\n Etiam maximus, leo ac facilisis egestas, dolor lacus condimentum purus,\r\n quis consequat orci justo vitae nunc. Cras tortor mauris, finibus vitae\r\n tortor in, porta fermentum orci. Pellentesque bibendum pharetra \r\nmaximus. Donec vitae porttitor mi. Cras mollis magna eu neque porta, ac \r\nmattis sem faucibus.</p>\r\n\r\n          <p class=\"small\">Is a closely related craft, sometimes \r\nconsidered part of typography; most typographers do not design \r\ntypefaces, and some type designers do not consider themselves \r\ntypographers. In modern times, typography has been put in film, \r\ntelevision and online broadcasts to add emotion to communication.</p>\r\n\r\n          <hr>\r\n\r\n          <h1>Heading 1</h1>\r\n          <h2>Heading 2</h2>\r\n          <h3>Heading 3</h3>\r\n          <h4>Heading 4</h4>\r\n          <h5>Heading 5</h5>\r\n          <h6>Heading 6</h6>\r\n\r\n          <hr>\r\n\r\n          <h4>Ordered List:</h4>\r\n          <ol><li>In posuere risus eget velit finibus luctus.</li><li>Praesent lacinia nunc et fringilla condimentum.</li><li>Vivamus sed ipsum facilisis, maximus magna eu, consequat odio.</li><li>Etiam auctor ipsum nec consectetur venenatis.</li><li>Praesent lacinia nunc et fringilla condimentum</li></ol>\r\n\r\n          <h4>Unordered List:</h4>\r\n          <ul><li>Phasellus posuere libero non velit sodales, sed efficitur nisi iaculis.</li><li>Donec ut est eget ex vehicula egestas a eget urna.</li><li>Vestibulum vulputate purus in posuere imperdiet.</li><li>Mauris varius erat sed sagittis placerat.</li><li>Cras bibendum libero sagittis suscipit imperdiet.</li></ul>\r\n\r\n          <hr>\r\n\r\n          <h4>Blockquote</h4>\r\n          <p>Computer technology revolutionized typography in the 20th \r\ncentury. Personal computers in the 1980s like the Macintosh allowed type\r\n designers to create types digitally using commercial graphic design \r\nsoftware. Digital technology also enabled designers to create more \r\nexperimental typefaces, alongside the practical fonts of traditional \r\ntypography. Designs for typefaces could be created faster with the new \r\ntechnology, and for more specific functions. The cost for developing \r\ntypefaces was drastically lowered, becoming widely available to the \r\nmasses. The change has been called the â€œdemocratization of typeâ€ and has\r\n given new designers more opportunities to enter the field.</p>\r\n          <blockquote>\r\n            <p>Painting is concerned with all the 10 attributes of \r\nsight; which are: Darkness, Light, Solidity and Colour, Form and \r\nPosition, Distance and Propinquity, Motion and Rest.</p>\r\n            <footer>Someone famous in <cite title=\"Source Title\">Source Title</cite></footer>\r\n          </blockquote>\r\n\r\n          <p>Typography is performed by typesetters, compositors, \r\ntypographers, graphic designers, art directors, manga artists, comic \r\nbook artists, graffiti artists, clerical workers, and everyone else who \r\narranges type for a product. Until the Digital Age, typography was a \r\nspecialized occupation. Digitization opened up typography to new \r\ngenerations of visual designers and lay users, and David Jury, Head of \r\nGraphic Design at Colchester Institute in England, states that \r\nâ€œtypography is now something everybody does.â€</p>\r\n\r\n        </div>\r\n      </section>\r\n\r\n\r\n\r\n    <br><p></p>', 'Get in touch with us.', 'assets/img/contact/1483528957.jpg', 'NewYork, United States', '1-767', 'microjobworld@gmail.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31910.130369917133!2d36.80390184826668!3d-1.3157805385798884!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f1053bc7118e7%3A0xb365376f1d28175!2sNairobi+West%2C+Nairobi!5e0!3m2!1sen!2ske!4v1463256840401\" width=\"600\" height=\"450\" style=\"border:0\" allowfullscreen></iframe>', 'We work hard to build a great product that is beautifully designed, simple to use, user friendly with great focus on user experience and customer service. Typography (from the Greek words Ï„ÏÏ€Î¿Ï‚ typos â€œformâ€ and Î³ÏÎ¬Ï†ÎµÎ¹Î½ graphein â€œto writeâ€) is the art and technique of arranging type to make written language readable and beautiful.', 'http://microjob.world', 'http://microjob.world', 'http://microjob.world', 'http://microjob.world', 'http://microjob.world', 'Membership & Bids', 'assets/img/pricing/1483793380.jpg', 'assets/img/service/1489407855.jpg', 'assets/img/jobs/1510495966p-mobile-01.jpg', '', '0000-00-00 00:00:00', '2018-01-15 16:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `payments_settings`
--

CREATE TABLE `payments_settings` (
  `id` int(11) NOT NULL,
  `currency` varchar(300) DEFAULT NULL,
  `paypal_client_id` mediumtext,
  `paypal_secret` mediumtext,
  `BT_ENVIRONMENT` varchar(30) DEFAULT NULL,
  `BT_MERCHANT_ID` varchar(30) DEFAULT NULL,
  `BT_PUBLIC_KEY` varchar(50) DEFAULT NULL,
  `BT_PRIVATE_KEY` varchar(50) DEFAULT NULL,
  `stripe_secret_key` mediumtext,
  `stripe_publishable_key` mediumtext,
  `off_paypal` varchar(50) DEFAULT NULL,
  `off_payoneer` varchar(50) DEFAULT NULL,
  `off_payza` varchar(50) DEFAULT NULL,
  `off_neteller` varchar(50) DEFAULT NULL,
  `off_skrill` varchar(50) DEFAULT NULL,
  `membershipid` varchar(300) DEFAULT NULL,
  `jobs_cost` varchar(300) DEFAULT NULL,
  `jobs_pay_limit` varchar(300) DEFAULT NULL,
  `bids_cost` varchar(300) DEFAULT NULL,
  `bids_limit` varchar(300) DEFAULT NULL,
  `jobs_percentage` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments_settings`
--

INSERT INTO `payments_settings` (`id`, `currency`, `paypal_client_id`, `paypal_secret`, `BT_ENVIRONMENT`, `BT_MERCHANT_ID`, `BT_PUBLIC_KEY`, `BT_PRIVATE_KEY`, `stripe_secret_key`, `stripe_publishable_key`, `off_paypal`, `off_payoneer`, `off_payza`, `off_neteller`, `off_skrill`, `membershipid`, `jobs_cost`, `jobs_pay_limit`, `bids_cost`, `bids_limit`, `jobs_percentage`, `created_at`, `updated_at`) VALUES
(1, '1', '', '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '178243489023', '4', '4', '2', '4', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pay_freelancer`
--

CREATE TABLE `pay_freelancer` (
  `id` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `amount_sum` decimal(9,2) NOT NULL,
  `payment_at` datetime NOT NULL,
  `complete` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `avatar_file_name` varchar(255) NOT NULL,
  `avatar_file_size` int(11) NOT NULL,
  `avatar_content_type` varchar(255) NOT NULL,
  `avatar_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `portfolioid` varchar(15) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `date` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL,
  `website` varchar(300) NOT NULL,
  `description` longtext NOT NULL,
  `imagelocation` varchar(300) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `profileid` varchar(15) NOT NULL,
  `userid` int(11) NOT NULL,
  `location` varchar(300) NOT NULL,
  `city` varchar(300) NOT NULL,
  `country` varchar(300) NOT NULL,
  `rate` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `about` longtext NOT NULL,
  `education` longtext NOT NULL,
  `work` longtext NOT NULL,
  `awards` longtext NOT NULL,
  `skills` mediumtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proof_image`
--

CREATE TABLE `proof_image` (
  `id` int(11) NOT NULL,
  `proof_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proof_submit`
--

CREATE TABLE `proof_submit` (
  `id` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `msg` text NOT NULL,
  `client_approve` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `archieved` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) UNSIGNED NOT NULL,
  `question` tinytext,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `star` varchar(300) NOT NULL,
  `message` mediumtext NOT NULL,
  `star_type` tinyint(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ratings_client`
--

CREATE TABLE `ratings_client` (
  `id` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `freelancerid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `star` varchar(300) NOT NULL,
  `message` mediumtext NOT NULL,
  `star_type` tinyint(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(3) UNSIGNED NOT NULL,
  `code` char(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zone_name` varchar(25) NOT NULL,
  `zone_code` char(5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `code`, `name`, `zone_name`, `zone_code`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'AF', 'Afghanistan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(2, 'AM', 'Armenia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(3, 'AZ', 'Azerbaijan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(4, 'BH', 'Bahrain', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(5, 'BD', 'Bangladesh', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(6, 'BT', 'Bhutan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(7, 'BN', 'Brunei', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(8, 'KH', 'Cambodia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(9, 'CN', 'China', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(10, 'GE', 'Georgia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(11, 'HK', 'Hong Kong', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(12, 'IN', 'India', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(13, 'ID', 'Indonesia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(14, 'IR', 'Iran', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(15, 'IQ', 'Iraq', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(16, 'IL', 'Israel', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(17, 'JP', 'Japan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(18, 'JO', 'Jordan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(19, 'KZ', 'Kazakhstan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(20, 'KP', 'North Korea', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(21, 'KR', 'South Korea', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(22, 'KW', 'Kuwait', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(23, 'KG', 'Kyrgyzstan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(24, 'LA', 'Laos', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(25, 'LB', 'Lebanon', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(26, 'MO', 'Macau', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(27, 'MY', 'Malaysia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(28, 'MV', 'Maldives', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(29, 'MN', 'Mongolia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(30, 'NP', 'Nepal', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(31, 'OM', 'Oman', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(32, 'PK', 'Pakistan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(33, 'PH', 'Philippines', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(34, 'QA', 'Qatar', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(35, 'SA', 'Saudi Arabia', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(36, 'SG', 'Singapore', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(37, 'LK', 'Sri Lanka', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(38, 'SY', 'Syria', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(39, 'TW', 'Taiwan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(40, 'TJ', 'Tajikistan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(41, 'TH', 'Thailand', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(42, 'TL', 'East Timor', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(43, 'TR', 'Turkey', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(44, 'TM', 'Turkmenistan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(45, 'AE', 'United Arab Emirates', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(46, 'UZ', 'Uzbekistan', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(47, 'VN', 'Vietnam', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(48, 'YE', 'Yemen', 'Asia', 'c142', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(49, 'AL', 'Albania', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(50, 'AT', 'Austria', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(51, 'BY', 'Belarus', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(52, 'BE', 'Belgium', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(53, 'BA', 'Bosnia and Herzegovina', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(54, 'BG', 'Bulgaria', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(55, 'HR', 'Croatia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(56, 'CY', 'Cyprus', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(57, 'CZ', 'Czech Republic', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(58, 'DK', 'Denmark', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(59, 'EE', 'Estonia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(60, 'FO', 'Faroe Islands', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(61, 'FI', 'Finland', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(62, 'FR', 'France', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(63, 'DE', 'Germany', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(64, 'GI', 'Gibraltar', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(65, 'GR', 'Greece', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(66, 'GG', 'Guernsey', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(67, 'HU', 'Hungary', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(68, 'IS', 'Iceland', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(69, 'IE', 'Republic of Ireland', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(70, 'IT', 'Italy', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(71, 'JE', 'Jersey', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(72, 'LV', 'Latvia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(73, 'LI', 'Liechtenstein', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(74, 'LT', 'Lithuania', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(75, 'LU', 'Luxembourg', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(76, 'MK', 'Republic of Macedonia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(77, 'MT', 'Malta', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(78, 'IM', 'Isle of Man', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(79, 'MD', 'Moldova', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(80, 'MC', 'Monaco', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(81, 'NL', 'Netherlands', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(82, 'NO', 'Norway', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(83, 'PL', 'Poland', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(84, 'PT', 'Portugal', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(85, 'RO', 'Romania', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(86, 'RU', 'Russia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(87, 'SM', 'San Marino', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(88, 'SK', 'Slovakia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(89, 'SI', 'Slovenia', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(90, 'ES', 'Spain', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(91, 'SJ', 'Svalbard and Jan Mayen', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(92, 'SE', 'Sweden', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(93, 'CH', 'Switzerland', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(94, 'UA', 'Ukraine', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(95, 'GB', 'United Kingdom', 'Europe', 'c150', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(96, 'DZ', 'Algeria', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(97, 'AO', 'Angola', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(98, 'BJ', 'Benin', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(99, 'BW', 'Botswana', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(100, 'IO', 'British Indian Ocean Territory', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(101, 'BF', 'Burkina Faso', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(102, 'BI', 'Burundi', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(103, 'CM', 'Cameroon', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(104, 'CV', 'Cape Verde', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(105, 'CF', 'Central African Republic', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(106, 'TD', 'Chad', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(107, 'KM', 'Comoros', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(108, 'CG', 'Republic of the Congo', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(109, 'CD', 'Democratic Republic of the Congo', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(110, 'CI', 'Ivory Coast', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(111, 'DJ', 'Djibouti', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(112, 'EG', 'Egypt', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(113, 'GQ', 'Equatorial Guinea', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(114, 'ER', 'Eritrea', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(115, 'ET', 'Ethiopia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(116, 'GA', 'Gabon', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(117, 'GM', 'The Gambia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(118, 'GH', 'Ghana', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(119, 'GN', 'Guinea', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(120, 'GW', 'Guinea-Bissau', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(121, 'KE', 'Kenya', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(122, 'LS', 'Lesotho', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(123, 'LR', 'Liberia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(124, 'LY', 'Libya', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(125, 'MG', 'Madagascar', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(126, 'MW', 'Malawi', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(127, 'ML', 'Mali', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(128, 'MR', 'Mauritania', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(129, 'MU', 'Mauritius', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(130, 'YT', 'Mayotte', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(131, 'MA', 'Morocco', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(132, 'MZ', 'Mozambique', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(133, 'NA', 'Namibia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(134, 'NE', 'Niger', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(135, 'NG', 'Nigeria', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(136, 'RE', 'Réunion', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(137, 'RW', 'Rwanda', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(138, 'SH', 'Saint Helena', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(139, 'ST', 'São Tomé and Príncipe', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(140, 'SN', 'Senegal', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(141, 'SC', 'Seychelles', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(142, 'SL', 'Sierra Leone', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(143, 'SO', 'Somalia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(144, 'ZA', 'South Africa', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(145, 'SS', 'South Sudan', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(146, 'SD', 'Sudan', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(147, 'SZ', 'Swaziland', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(148, 'TZ', 'Tanzania', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(149, 'TG', 'Togo', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(150, 'TN', 'Tunisia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(151, 'UG', 'Uganda', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(152, 'EH', 'Western Sahara', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(153, 'ZM', 'Zambia', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(154, 'ZW', 'Zimbabwe', 'Africa', 'c002', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(155, 'AS', 'American Samoa', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(156, 'AU', 'Australia', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(157, 'CX', 'Christmas Island', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(158, 'CC', 'Cocos (Keeling) Islands', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(159, 'CK', 'Cook Islands', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(160, 'FJ', 'Fiji', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(161, 'PF', 'French Polynesia', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(162, 'GU', 'Guam', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(163, 'KI', 'Kiribati', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(164, 'MH', 'Marshall Islands', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(165, 'FM', 'Federated States of Micronesia', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(166, 'NR', 'Nauru', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(167, 'NC', 'New Caledonia', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(168, 'NZ', 'New Zealand', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(169, 'NU', 'Niue', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(170, 'NF', 'Norfolk Island', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(171, 'MP', 'Northern Mariana Islands', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(172, 'PW', 'Palau', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(173, 'PG', 'Papua New Guinea', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(174, 'PN', 'Pitcairn Islands', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(175, 'WS', 'Samoa', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(176, 'SB', 'Solomon Islands', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(177, 'TK', 'Tokelau', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(178, 'TO', 'Tonga', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(179, 'TV', 'Tuvalu', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(180, 'VU', 'Vanuatu', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(181, 'WF', 'Wallis and Futuna', 'Oceania', 'c009', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(182, 'AI', 'Anguilla', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(183, 'AG', 'Antigua and Barbuda', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(184, 'AR', 'Argentina', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(185, 'AW', 'Aruba', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(186, 'BS', 'The Bahamas', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(187, 'BB', 'Barbados', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(188, 'BZ', 'Belize', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(189, 'BM', 'Bermuda', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(190, 'BO', 'Bolivia', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(191, 'BR', 'Brazil', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(192, 'CA', 'Canada', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(193, 'KY', 'Cayman Islands', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(194, 'CL', 'Chile', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(195, 'CO', 'Colombia', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(196, 'CR', 'Costa Rica', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(197, 'CU', 'Cuba', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(198, 'DM', 'Dominica', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(199, 'DO', 'Dominican Republic', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(200, 'EC', 'Ecuador', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(201, 'SV', 'El Salvador', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(202, 'FK', 'Falkland Islands', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(203, 'GF', 'French Guiana', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(204, 'GL', 'Greenland', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(205, 'GD', 'Grenada', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(206, 'GP', 'Guadeloupe', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(207, 'GT', 'Guatemala', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(208, 'GY', 'Guyana', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(209, 'HT', 'Haiti', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(210, 'HN', 'Honduras', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(211, 'JM', 'Jamaica', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(212, 'MQ', 'Martinique', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(213, 'MX', 'Mexico', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(214, 'MS', 'Montserrat', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(215, 'NI', 'Nicaragua', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(216, 'PA', 'Panama', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(217, 'PY', 'Paraguay', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(218, 'PE', 'Peru', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(219, 'PR', 'Puerto Rico', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(220, 'KN', 'Saint Kitts and Nevis', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(221, 'LC', 'Saint Lucia', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(222, 'PM', 'Saint Pierre and Miquelon', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(223, 'VC', 'Saint Vincent and the Grenadines', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(224, 'GS', 'South Georgia', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(225, 'SR', 'Suriname', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(226, 'TT', 'Trinidad and Tobago', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(227, 'US', 'United States', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(228, 'UY', 'Uruguay', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0),
(229, 'VE', 'Venezuela', 'Americas', 'c019', 1, '2018-01-13 19:07:59', '2018-01-13 19:07:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `by_userid` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rkey` varchar(20) NOT NULL,
  `expire` datetime NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `serviceid` varchar(15) NOT NULL,
  `userid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `rate` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `serviceid`, `userid`, `catid`, `title`, `rate`, `description`, `active`, `delete_remove`, `date_added`) VALUES
(1, '212679740281', 2147483647, 1453200138, 'Programming', '85', '<p>                      	Lorem ipsum dolor sit amet, lorem quaestio similique has at, possit \r\nvivendum ne nam. Unum saepe ea vim, ius sensibus volutpat et, eum legere\r\n nostrum explicari ei. Sed ex legere hendrerit. Ei saperet officiis has,\r\n eu usu prompta mandamus. Vix dicat electram ei, ne sea aeterno ornatus \r\nperpetua, ne cum omnis voluptua iracundia.</p><p>\r\n		  </p><p>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui\r\n meis tantas et. Vivendo ponderum id pro. Vidit offendit quaerendum est \r\net, no eos prima tamquam, eu duo ludus noster praesent. Sea cu quod \r\nillum. Affert munere ut vis, ponderum gubergren sit ne. Nam at magna \r\nhomero feugait.</p><p>\r\n		  </p><p>Odio laoreet vivendum ex vis. At mentitum assueverit nam, mel ex \r\ndolorem tacimates praesent. Saepe nemore duo te, no nec cetero eligendi \r\nmnesarchum. Ne congue similique eloquentiam has. Wisi omittantur \r\ndefinitiones vis in.</p><p>\r\n		  </p><p>Pertinacia neglegentur vix ne. Illum accusata id quo, vis ex \r\nmucius iisque aliquid. Eos meliore interesset id. Ne has fabellas \r\nelaboraret.</p><p>\r\n		  </p><p>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu. Diam mentitum explicari no vim, tantas nominavi eos \r\nin. Ei pri omnis verterem antiopam.</p><p>\r\n			</p><p>Ut quis ex vel sapien lobortis auctor. Mauris pulvinar erat \r\naliquet, eleifend tellus venenatis, tempus justo. Nunc et massa in ipsum\r\n condimentum accumsan a nec lacus. Nam vel nulla quis sapien placerat \r\negestas at quis eros. Fusce venenatis nibh a velit pretium egestas. \r\nInteger finibus diam diam, a vestibulum ligula commodo a. Curabitur \r\nultricies porta viverra. Ut eleifend ipsum hendrerit, fringilla ex quis,\r\n dictum dui. Phasellus consequat consectetur tristique. Nulla efficitur,\r\n elit quis laoreet bibendum, diam felis sollicitudin lectus, dignissim \r\nauctor arcu libero non velit. Nam vitae odio ut elit blandit varius. \r\nPhasellus ac nunc ut nibh mollis ultricies eget non nulla. Donec porta \r\ntellus at justo pulvinar scelerisque.</p><p>\r\n			</p><p>Donec sed lacinia lectus, a hendrerit ex. Mauris faucibus tortor \r\neu turpis ultricies hendrerit. Sed massa ligula, sodales at eros sit \r\namet, lacinia facilisis turpis. Mauris in blandit diam. Cras gravida sem\r\n blandit urna vehicula, eu tempus nibh vulputate. Nunc lacinia eu metus \r\nquis mollis. Morbi sed arcu ex. Etiam non ultricies nibh.</p><p><br></p><h4>Lorem Ipsum</h4><ul class=\"square\"><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro!</li><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro.</li><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro.</li><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro!</li></ul><p>\r\n          \r\n		  <br></p><h4>Lorem Ipsum</h4><ul class=\"square\"><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li></ul><p><br></p><p>                      	</p><p></p>', 1, 0, '2016-10-08 12:08:18'),
(2, '118425381541', 2147483647, 1453200138, 'Website Design', '85', '<p>                      	Lorem ipsum dolor sit amet, lorem quaestio similique has at, possit \r\nvivendum ne nam. Unum saepe ea vim, ius sensibus volutpat et, eum legere\r\n nostrum explicari ei. Sed ex legere hendrerit. Ei saperet officiis has,\r\n eu usu prompta mandamus. Vix dicat electram ei, ne sea aeterno ornatus \r\nperpetua, ne cum omnis voluptua iracundia.</p><p>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui\r\n meis tantas et. Vivendo ponderum id pro. Vidit offendit quaerendum est \r\net, no eos prima tamquam, eu duo ludus noster praesent. Sea cu quod \r\nillum. Affert munere ut vis, ponderum gubergren sit ne. Nam at magna \r\nhomero feugait.</p><p>Odio laoreet vivendum ex vis. At mentitum assueverit nam, mel ex \r\ndolorem tacimates praesent. Saepe nemore duo te, no nec cetero eligendi \r\nmnesarchum. Ne congue similique eloquentiam has. Wisi omittantur \r\ndefinitiones vis in.</p><p>Pertinacia neglegentur vix ne. Illum accusata id quo, vis ex \r\nmucius iisque aliquid. Eos meliore interesset id. Ne has fabellas \r\nelaboraret.</p><p>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu. Diam mentitum explicari no vim, tantas nominavi eos \r\nin. Ei pri omnis verterem antiopam.</p><p>Ut quis ex vel sapien lobortis auctor. Mauris pulvinar erat \r\naliquet, eleifend tellus venenatis, tempus justo. Nunc et massa in ipsum\r\n condimentum accumsan a nec lacus. Nam vel nulla quis sapien placerat \r\negestas at quis eros. Fusce venenatis nibh a velit pretium egestas. \r\nInteger finibus diam diam, a vestibulum ligula commodo a. Curabitur \r\nultricies porta viverra. Ut eleifend ipsum hendrerit, fringilla ex quis,\r\n dictum dui. Phasellus consequat consectetur tristique. Nulla efficitur,\r\n elit quis laoreet bibendum, diam felis sollicitudin lectus, dignissim \r\nauctor arcu libero non velit. Nam vitae odio ut elit blandit varius. \r\nPhasellus ac nunc ut nibh mollis ultricies eget non nulla. Donec porta \r\ntellus at justo pulvinar scelerisque.</p><p>Donec sed lacinia lectus, a hendrerit ex. Mauris faucibus tortor \r\neu turpis ultricies hendrerit. Sed massa ligula, sodales at eros sit \r\namet, lacinia facilisis turpis. Mauris in blandit diam. Cras gravida sem\r\n blandit urna vehicula, eu tempus nibh vulputate. Nunc lacinia eu metus \r\nquis mollis. Morbi sed arcu ex. Etiam non ultricies nibh.</p><h4>Lorem Ipsum</h4><ul class=\"square\"><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro!</li><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro.</li><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro.</li><li>Pro munere assueverit id, debitis scaevola omittantur vim ex, qui meis tantas et. Vivendo ponderum id pro!</li></ul><h4>Lorem Ipsum</h4><ul class=\"square\"><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li><li>Ne iriure reprimique vel. Ex alii pericula pri, idque veritus ius\r\n id. Etiam doctus aperiam cu mea, vel cibo dicunt ad, vim luptatum \r\ndelicatissimi eu.</li></ul><p><br></p><p><br>                      	</p>', 1, 0, '2016-10-16 16:48:25'),
(3, '251354518933', 2147483647, 1453200138, 'Website Design', '90', '<p>Proin imperdiet mi sapien, vel facilisis arcu blandit sed. Ut imperdiet \r\nest interdum rhoncus lobortis. In viverra nec elit sit amet placerat. \r\nFusce vel sapien ultrices, vulputate tortor nec, feugiat ex. Donec \r\nfringilla libero at sodales gravida. Nullam ornare nunc sapien, sit amet\r\n viverra quam accumsan et. Phasellus ac urna vel lectus dignissim \r\nefficitur ut id magna. Sed vitae mauris orci. Nam eleifend, lacus et \r\nvulputate cursus, sapien augue volutpat dui, tincidunt rhoncus purus \r\nlorem in eros. Morbi velit urna, sollicitudin sollicitudin mi nec, \r\nultrices posuere justo. Aliquam erat volutpat. Nunc nec felis aliquet, \r\ncursus lorem sit amet, viverra nunc.\r\n</p><p>\r\n</p><p>\r\nSed nibh nulla, fringilla vel nisl a, accumsan aliquam massa. Aenean \r\nultricies nisl non fringilla vestibulum. Nullam ac condimentum metus. \r\nNam tempus justo in tempus fermentum. Suspendisse pellentesque metus \r\ntellus, eu pharetra nisl consectetur a. Pellentesque ut imperdiet dolor.\r\n Phasellus non leo urna. Sed ut enim vel orci scelerisque elementum. \r\nDonec a convallis felis. Nulla facilisi. Donec dictum rhoncus interdum.\r\n</p><p>\r\n</p><p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed \r\nlorem egestas, hendrerit libero a, porta tellus. Sed sit amet magna quis\r\n orci feugiat faucibus. Proin sollicitudin, lorem vel imperdiet tempus, \r\nturpis magna efficitur massa, in lacinia orci purus eget enim. Proin \r\ncommodo justo leo, at cursus nisi laoreet sed. Vestibulum at pretium \r\nnibh. Curabitur convallis sagittis risus, non condimentum nisl \r\nullamcorper in. Curabitur placerat, elit sit amet ultrices blandit, orci\r\n felis lacinia orci, sit amet sodales dolor libero id sapien. Maecenas \r\npharetra ante ex, dignissim sodales sapien imperdiet in. Nam quis \r\nlaoreet mi. Pellentesque malesuada tempus nibh eget congue. Fusce quis \r\nneque suscipit, venenatis sapien eu, viverra justo. Integer volutpat \r\nmattis orci eget varius. Nam aliquet turpis quis porta varius. Nulla \r\nplacerat tincidunt nisl sed rhoncus.\r\n</p><p>                      	</p>', 1, 0, '2016-12-30 13:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `expiredate` datetime NOT NULL,
  `ip` varchar(39) NOT NULL,
  `agent` varchar(200) NOT NULL,
  `cookie_crc` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `active`, `delete_remove`, `date_added`) VALUES
(1, 'Zurb Foundation', 1, 0, '2016-01-19 17:21:03'),
(2, 'Zope', 1, 0, '2016-01-19 17:21:27'),
(3, 'Zoomla', 1, 0, '2016-01-19 17:21:36'),
(4, 'Zoho CRM', 1, 0, '2016-01-19 17:21:50'),
(5, 'Zoho Creator', 1, 0, '2016-01-19 17:22:09'),
(6, 'ZK', 1, 0, '2016-01-19 17:22:18'),
(7, 'Zimbra Development', 1, 0, '2016-01-19 17:22:34'),
(8, 'Zimbra Administration', 1, 0, '2016-01-19 17:22:59'),
(9, 'Zimbra Marketing', 1, 0, '2016-01-19 17:23:16'),
(10, 'Zennolab ZennoPoster', 1, 0, '2016-01-19 17:23:48'),
(11, 'Zendesk API Development ', 1, 0, '2016-01-19 17:24:09'),
(12, 'Zendesk', 1, 0, '2016-01-19 17:25:51'),
(13, 'Zend Studio', 1, 0, '2016-01-19 17:26:20'),
(14, 'Zend Framework', 1, 0, '2016-01-19 17:26:38'),
(15, 'Zen Cart', 1, 0, '2016-01-19 17:26:56'),
(16, 'Zaxwerks', 1, 0, '2016-01-19 17:27:18'),
(17, 'zapier', 1, 0, '2016-01-19 17:27:35'),
(18, 'Zabbix', 1, 0, '2016-01-19 17:27:57'),
(19, 'YUI Library ', 1, 0, '2016-01-19 17:28:25'),
(20, 'YouTube Marketing', 1, 0, '2016-01-19 17:28:41'),
(21, 'YouTube Development ', 1, 0, '2016-01-19 17:29:24'),
(22, 'Yola ', 1, 0, '2016-01-19 17:29:38'),
(23, 'Yoga', 1, 0, '2016-01-19 17:29:54'),
(24, 'Yii', 1, 0, '2016-01-19 17:30:10'),
(25, 'Yandex MatrixNet', 1, 0, '2016-01-19 17:30:25'),
(26, 'Yandex API ', 1, 0, '2016-01-19 17:30:47'),
(27, 'YAML', 1, 0, '2016-01-19 17:31:03'),
(28, 'Yahoo! Store', 1, 0, '2016-01-19 17:31:51'),
(29, 'Yahoo! Search Marketing', 1, 0, '2016-01-19 17:32:07'),
(30, 'Yahoo! Query Language', 1, 0, '2016-01-19 17:32:23'),
(31, 'Yahoo! Messenger ', 1, 0, '2016-01-19 17:32:44'),
(32, 'Yahoo! Merchant Solutions ', 1, 0, '2016-01-19 17:32:59'),
(33, 'Yahoo Developer Skills', 1, 0, '2016-01-19 17:33:15'),
(34, 'Yahoo! Advertising Solutions', 1, 0, '2016-01-19 17:33:31'),
(35, 'XUL', 1, 0, '2016-01-19 17:34:03'),
(36, 'XSLT', 1, 0, '2016-01-19 17:34:21'),
(37, 'XSL', 1, 0, '2016-01-19 17:34:39'),
(38, 'XSD', 1, 0, '2016-01-19 17:34:57'),
(39, 'XRumer', 1, 0, '2016-01-19 17:35:13'),
(40, 'XQuery ', 1, 0, '2016-01-19 17:37:33'),
(41, 'XPath', 1, 0, '2016-01-19 17:37:47'),
(42, 'XOOPS', 1, 0, '2016-01-19 17:38:04'),
(43, 'XMPP', 1, 0, '2016-01-19 18:04:12'),
(44, 'xml web services', 1, 0, '2016-01-19 18:04:25'),
(45, 'XML-RPC', 1, 0, '2016-01-19 18:04:46'),
(46, 'XML', 1, 0, '2016-01-19 18:05:03'),
(47, 'Xlinesoft PHPRunner', 1, 0, '2016-01-19 18:05:14'),
(48, 'Xilinx', 1, 0, '2016-01-19 18:05:25'),
(49, 'XHTML', 1, 0, '2016-01-19 18:05:37'),
(50, 'Xero', 1, 0, '2016-01-19 18:05:55'),
(51, 'XenForo', 1, 0, '2016-01-19 18:06:07'),
(52, 'Xen Hypervisor', 1, 0, '2016-01-19 18:06:19'),
(53, 'Xen Cloud Platform', 1, 0, '2016-01-19 18:06:33'),
(54, 'SAP Xcelsius', 1, 0, '2016-01-19 18:06:50'),
(55, 'Xbox', 1, 0, '2016-01-19 18:07:04'),
(56, 'Xara Xtreme', 1, 0, '2016-01-19 18:07:17'),
(57, 'XAMPP', 1, 0, '2016-01-19 18:07:32'),
(58, 'XAML', 1, 0, '2016-01-19 18:07:44'),
(59, 'Xamarin', 1, 0, '2016-01-19 18:07:55'),
(60, 'Xactimate', 1, 0, '2016-01-19 18:08:06'),
(61, 'X86 assembly language', 1, 0, '2016-01-19 18:08:42'),
(62, 'X-Cart', 1, 0, '2016-01-19 18:08:54'),
(63, 'WxWidgets', 1, 0, '2016-01-19 18:09:11'),
(64, 'Wu', 1, 0, '2016-01-19 18:09:26'),
(65, 'Slang-style Writing', 1, 0, '2016-01-19 18:09:38'),
(66, 'Writing', 1, 0, '2016-01-19 18:09:50'),
(67, 'Wrap Advertising', 1, 0, '2016-01-19 18:10:04'),
(68, 'Windows Presentation Foundation (WPF) ', 1, 0, '2016-01-19 18:10:40'),
(69, 'WordPress e-Commerce', 1, 0, '2016-01-19 18:10:52'),
(70, 'Wowza Media Server', 1, 0, '2016-01-19 18:11:20'),
(71, 'Worldspan', 1, 0, '2016-01-19 18:11:31'),
(72, 'Worldbuilding', 1, 0, '2016-01-19 18:11:44'),
(73, 'Workshop Facilities', 1, 0, '2016-01-19 18:11:58'),
(74, 'Workforce Management', 1, 0, '2016-01-19 18:12:26'),
(75, 'Worketc', 1, 0, '2016-01-19 18:12:39'),
(76, 'Wordpress Plugin', 1, 0, '2016-01-19 18:12:58'),
(77, 'WordPress', 1, 0, '2016-01-19 18:13:13'),
(78, 'Wordperfect', 1, 0, '2016-01-19 18:13:35'),
(79, 'Wordfast', 1, 0, '2016-01-19 18:13:47'),
(80, 'Word processing', 1, 0, '2016-01-19 18:14:02'),
(81, 'Word-of-Mouth', 1, 0, '2016-01-19 18:14:15'),
(82, 'Woocommerce', 1, 0, '2016-01-19 18:14:28'),
(83, 'WML Script ', 1, 0, '2016-01-19 18:14:48'),
(84, 'WiX', 1, 0, '2016-01-19 18:15:09'),
(85, 'Wireless Security', 1, 0, '2016-01-19 18:15:22'),
(86, 'Wireless Network Implementation', 1, 0, '2016-01-19 19:02:16'),
(87, 'Wireframing', 1, 0, '2016-01-19 19:02:31'),
(88, 'Winsock', 1, 0, '2016-01-19 19:02:52'),
(89, 'WinRunner', 1, 0, '2016-01-19 19:03:08'),
(90, 'Windows XP Administration', 1, 0, '2016-01-19 19:03:24'),
(91, 'Microsoft Windows Workflow Foundation', 1, 0, '2016-01-19 19:03:40'),
(92, 'Windows Vista', 1, 0, '2016-01-19 19:03:53'),
(93, 'Microsoft Windows Template Library', 1, 0, '2016-01-19 19:04:06'),
(94, 'Microsoft Windows Phone 7 App Development ', 1, 0, '2016-01-19 19:04:23'),
(95, 'Windows Phone', 1, 0, '2016-01-19 19:04:37'),
(96, 'Windows NT Administration ', 1, 0, '2016-01-19 19:04:55'),
(97, 'Microsoft Windows Movie Maker', 1, 0, '2016-01-19 19:05:11'),
(98, 'Windows Mobile', 1, 0, '2016-01-19 19:05:23'),
(99, 'microsoft windows media connect', 1, 0, '2016-01-19 19:05:37'),
(100, 'Windows Forms Development', 1, 0, '2016-01-19 19:05:50'),
(101, 'Microsoft Windows Azure', 1, 0, '2016-01-19 19:06:06'),
(102, 'Windows App Development', 1, 0, '2016-01-19 19:06:21'),
(103, 'Windows Administration', 1, 0, '2016-01-19 19:06:38'),
(104, 'Windows 8 App Development ', 1, 0, '2016-01-19 19:06:50'),
(105, 'Windows 8 Administration ', 1, 0, '2016-01-19 19:07:03'),
(106, 'Windows 7 Administration', 1, 0, '2016-01-19 19:07:16'),
(107, 'WinDev Mobile', 1, 0, '2016-01-19 19:07:32'),
(108, 'WinDev ', 1, 0, '2016-01-19 19:07:45'),
(109, 'Wind Power Consulting', 1, 0, '2016-01-19 19:08:07'),
(110, 'WinAutomation', 1, 0, '2016-01-19 19:08:18'),
(111, 'Win32 App Development', 1, 0, '2016-01-19 19:09:48'),
(112, 'WiMAX', 1, 0, '2016-01-19 19:09:59'),
(113, 'Wilcom EmbroideryStudio', 1, 0, '2016-01-19 19:10:11'),
(114, 'Wilcom Embroidery Digitization', 1, 0, '2016-01-19 19:10:22'),
(115, 'Wikipedia', 1, 0, '2016-01-19 19:12:18'),
(116, 'Wiki', 1, 0, '2016-01-19 19:12:34'),
(117, 'Wicket', 1, 0, '2016-01-19 19:12:51'),
(118, 'Wi-Fi', 1, 0, '2016-01-19 19:13:03'),
(119, 'WHMCS Development', 1, 0, '2016-01-19 19:13:14'),
(120, 'WebHost Manager (WHM) ', 1, 0, '2016-01-19 19:13:31'),
(121, 'Whiteboard Animation', 1, 0, '2016-01-19 19:13:45'),
(122, 'White Paper Writing', 1, 0, '2016-01-19 19:13:56'),
(123, 'Westlaw', 1, 0, '2016-01-19 19:14:07'),
(124, 'Welsh', 1, 0, '2016-01-19 19:14:17'),
(125, 'Welding', 1, 0, '2016-01-19 19:14:28'),
(126, 'Weka', 1, 0, '2016-01-19 19:14:44'),
(127, 'Weebly', 1, 0, '2016-01-19 19:14:57'),
(128, 'Website Wireframing', 1, 0, '2016-01-19 19:15:11'),
(129, 'Website Prototyping', 1, 0, '2016-01-19 19:15:22'),
(130, 'Website Development', 1, 0, '2016-01-20 05:39:14'),
(131, 'Website Baker', 1, 0, '2016-01-20 05:39:27'),
(132, 'Website Analytics', 1, 0, '2016-01-20 05:39:41'),
(133, 'WebRTC', 1, 0, '2016-01-20 05:39:53'),
(134, 'Oracle WebLogic', 1, 0, '2016-01-20 05:40:05'),
(135, 'Webisode Production', 1, 0, '2016-01-20 05:40:20'),
(136, 'Webisode Presentation', 1, 0, '2016-01-20 05:40:35'),
(137, 'WebGL', 1, 0, '2016-01-20 05:40:47'),
(138, 'Webflow', 1, 0, '2016-01-20 05:41:05'),
(139, 'webERP', 1, 0, '2016-01-20 05:41:20'),
(140, 'webeeh', 1, 0, '2016-01-20 05:41:54'),
(141, 'WebApp Pentesting', 1, 0, '2016-01-20 05:42:06'),
(142, 'Web Testing', 1, 0, '2016-01-20 05:42:21'),
(143, 'Web Services Development', 1, 0, '2016-01-20 05:42:35'),
(144, 'Web Services', 1, 0, '2016-01-20 05:42:49'),
(145, 'Web scraping', 1, 0, '2016-01-20 05:43:09'),
(146, 'Web Programming', 1, 0, '2016-01-20 05:43:20'),
(147, 'Palm webOS Application Development', 1, 0, '2016-01-20 05:43:37'),
(148, 'Web Hosting', 1, 0, '2016-01-20 05:43:51'),
(149, 'Web Host Manager', 1, 0, '2016-01-20 05:44:06'),
(150, 'Web design', 1, 0, '2016-01-20 05:44:18'),
(151, 'Web Crawler', 1, 0, '2016-01-20 05:44:31'),
(152, 'Content Management', 1, 0, '2016-01-20 05:44:45'),
(153, 'Web Analytics', 1, 0, '2016-01-20 05:44:59'),
(154, 'Windows Communication Foundation (WCF)', 1, 0, '2016-01-20 05:45:13'),
(155, 'Wave Accounting', 1, 0, '2016-01-20 06:02:47'),
(156, 'Watercolor Painting', 1, 0, '2016-01-20 06:02:59'),
(157, 'Wardrobe Styling', 1, 0, '2016-01-20 06:03:11'),
(158, 'WAN Optimization', 1, 0, '2016-01-20 06:03:24'),
(159, 'WAN', 1, 0, '2016-01-20 06:03:42'),
(160, 'WAMP', 1, 0, '2016-01-20 06:03:54'),
(161, 'W3C Widget API', 1, 0, '2016-01-20 06:04:06'),
(162, 'VxWorks', 1, 0, '2016-01-20 06:04:22'),
(163, 'Vulnerability assessment', 1, 0, '2016-01-20 06:04:37'),
(164, 'Vugen Scripting', 1, 0, '2016-01-20 06:04:49'),
(165, 'VTK', 1, 0, '2016-01-20 06:04:59'),
(166, 'vtiger Development', 1, 0, '2016-01-20 06:05:13'),
(167, 'vtiger Adminstration', 1, 0, '2016-01-20 06:05:24'),
(168, 'VSS', 1, 0, '2016-01-20 06:05:36'),
(169, 'Virtual storage access method (VSAM)', 1, 0, '2016-01-20 06:05:57'),
(170, 'V-Ray', 1, 0, '2016-01-20 06:06:08'),
(171, 'VPN', 1, 0, '2016-01-20 06:06:19'),
(172, 'volusion', 1, 0, '2016-01-20 06:06:29'),
(173, 'Volleyball', 1, 0, '2016-01-20 06:06:41'),
(174, 'Voldemort', 1, 0, '2016-01-20 06:06:54'),
(175, 'VOIP Software', 1, 0, '2016-01-20 06:07:12'),
(176, 'VOIP Administration', 1, 0, '2016-01-20 06:07:24'),
(177, 'VoiceXML', 1, 0, '2016-01-20 06:07:35'),
(178, 'Voice Talent', 1, 0, '2016-01-20 06:07:47'),
(179, 'Voice Over ', 1, 0, '2016-01-20 06:07:58'),
(180, 'VMware ESX Server', 1, 0, '2016-01-20 06:08:09'),
(181, 'VMware Administration', 1, 0, '2016-01-20 06:08:27'),
(182, 'VLSI', 1, 0, '2016-01-20 06:08:38'),
(183, 'VLookup Tables', 1, 0, '2016-01-20 06:08:50'),
(184, 'VKontakte API', 1, 0, '2016-01-20 06:09:01'),
(185, 'Vizrt', 1, 0, '2016-01-20 06:09:15'),
(186, 'Visualization', 1, 0, '2016-01-20 06:09:26'),
(187, 'visualforce', 1, 0, '2016-01-20 06:09:38'),
(188, 'Visual Merchandising', 1, 0, '2016-01-20 06:09:50'),
(189, 'Visual FoxPro', 1, 0, '2016-01-20 06:10:03'),
(190, 'Visual Dataflex', 1, 0, '2016-01-20 06:10:18'),
(191, 'Visual Basic', 1, 0, '2016-01-20 06:10:31'),
(192, 'Visual Arts', 1, 0, '2016-01-20 06:10:47'),
(193, 'virus removal', 1, 0, '2016-01-20 06:10:58'),
(194, 'Virtuoso', 1, 0, '2016-01-20 06:11:10'),
(195, 'VirtueMart', 1, 0, '2016-01-20 06:11:27'),
(196, 'Virtualization', 1, 0, '2016-01-20 06:11:39'),
(197, 'Virtual Private Server (VPS)', 1, 0, '2016-01-20 06:11:52'),
(198, 'Virtual Machine', 1, 0, '2016-01-20 06:12:07'),
(199, 'Virtual Currency', 1, 0, '2016-01-20 06:12:19'),
(200, 'Virtual Assistant', 1, 0, '2016-01-20 06:12:31'),
(201, 'Viral marketing', 1, 0, '2016-01-20 06:12:43'),
(202, 'Violin Performance', 1, 0, '2016-01-20 06:12:54'),
(203, 'Violin Composition', 1, 0, '2016-01-20 06:13:05'),
(204, 'Vim', 1, 0, '2016-01-20 06:13:17'),
(205, 'Vietnamese', 1, 0, '2016-01-20 06:13:35'),
(206, 'VIDVOX VDMX', 1, 0, '2016-01-20 06:13:55'),
(207, 'Videography', 1, 0, '2016-01-20 06:14:09'),
(208, 'Video Upload', 1, 0, '2016-01-20 06:14:20'),
(209, 'Video Streaming', 1, 0, '2016-01-20 06:14:31'),
(210, 'Video Sales Letter', 1, 0, '2016-01-20 06:14:43'),
(211, 'Video Ripping', 1, 0, '2016-01-20 06:14:54'),
(212, 'Video Publishing', 1, 0, '2016-01-20 06:15:08'),
(213, 'Video production', 1, 0, '2016-01-20 06:15:20'),
(214, 'Video Post Editing', 1, 0, '2016-01-20 06:15:33'),
(215, 'Video editing', 1, 0, '2016-01-20 06:16:02'),
(216, 'Video Conversion', 1, 0, '2016-01-20 06:16:15'),
(217, 'vicidial', 1, 0, '2016-01-20 06:16:27'),
(218, 'VHDL', 1, 0, '2016-01-20 06:16:41'),
(219, 'VFX Design', 1, 0, '2016-01-20 06:16:57'),
(220, 'VFX Animation', 1, 0, '2016-01-20 06:17:11'),
(221, 'Vertica', 1, 0, '2016-01-20 06:17:23'),
(222, 'Version Control', 1, 0, '2016-01-20 06:17:34'),
(223, 'Verilog / VHDL', 1, 0, '2016-01-20 06:17:45'),
(224, 'Venture Capital Consulting', 1, 0, '2016-01-20 06:17:57'),
(225, 'Vendor Management Systems', 1, 0, '2016-01-20 06:18:10'),
(226, 'Velocity Template Engine', 1, 0, '2016-01-20 06:18:27'),
(227, 'Veeam', 1, 0, '2016-01-20 06:18:38'),
(228, 'VectorWorks', 1, 0, '2016-01-20 06:18:50'),
(229, 'vCita', 1, 0, '2016-01-20 06:19:02'),
(230, 'VBulletin', 1, 0, '2016-01-20 06:19:14'),
(231, 'vbseo', 1, 0, '2016-01-20 06:19:26'),
(232, 'VBScript', 1, 0, '2016-01-20 06:20:01'),
(233, 'VBA', 1, 0, '2016-01-20 06:20:11'),
(234, 'VB.NET', 1, 0, '2016-01-20 06:20:23'),
(235, 'Varnish Cache', 1, 0, '2016-01-20 06:20:35'),
(236, 'Valgrind', 1, 0, '2016-01-20 06:20:48'),
(237, 'Vagrant', 1, 0, '2016-01-20 06:21:02'),
(238, 'Vaadin Framework', 1, 0, '2016-01-20 06:21:15'),
(239, 'UV Mapping', 1, 0, '2016-01-20 06:21:51'),
(240, 'Users Guide Writing', 1, 0, '2016-01-20 06:23:46'),
(241, 'User Experience Design', 1, 0, '2016-01-20 06:24:11'),
(242, 'User acceptance testing', 1, 0, '2016-01-20 06:24:23'),
(243, 'USB Electronics', 1, 0, '2016-01-20 06:24:38'),
(244, 'Usability testing', 1, 0, '2016-01-20 06:24:50'),
(245, 'Urdu', 1, 0, '2016-01-20 06:25:02'),
(246, 'Urban Design', 1, 0, '2016-01-20 06:25:15'),
(247, 'UnrealScript', 1, 0, '2016-01-20 06:25:29'),
(248, 'Unreal Engine', 1, 0, '2016-01-20 06:25:46'),
(249, 'Unix System Administration', 1, 0, '2016-01-20 06:25:58'),
(250, 'Unix shell', 1, 0, '2016-01-20 06:26:09'),
(251, 'Unix', 1, 0, '2016-01-20 06:26:23'),
(252, 'Unity', 1, 0, '2016-01-20 06:26:34'),
(253, 'Unit Testing', 1, 0, '2016-01-20 06:26:46'),
(254, 'Unify Corporation', 1, 0, '2016-01-20 06:27:00'),
(255, 'Unify SQLBase', 1, 0, '2016-01-20 06:27:12'),
(256, 'Unify', 1, 0, '2016-01-20 06:27:27'),
(257, 'Unified Threat Management', 1, 0, '2016-01-20 06:27:42'),
(258, 'Underwriting', 1, 0, '2016-01-20 06:27:54'),
(259, 'unbounce', 1, 0, '2016-01-20 06:28:10'),
(260, 'UML', 1, 0, '2016-01-20 06:28:26'),
(261, 'Umbraco', 1, 0, '2016-01-20 06:28:38'),
(262, 'Ulead VideoStudio', 1, 0, '2016-01-20 06:28:52'),
(263, 'Ulead COOL 3D', 1, 0, '2016-01-20 06:29:04'),
(264, 'Ukrainian', 1, 0, '2016-01-20 06:29:15'),
(265, 'User interface design', 1, 0, '2016-01-20 06:29:28'),
(266, 'Ubuntu', 1, 0, '2016-01-20 06:29:42'),
(267, 'Ubercart', 1, 0, '2016-01-20 06:29:53'),
(268, 'U.S. Culture', 1, 0, '2016-01-20 06:30:10'),
(269, 'Typography', 1, 0, '2016-01-20 06:30:23'),
(270, 'TYPO3', 1, 0, '2016-01-20 06:30:34'),
(271, 'Typing', 1, 0, '2016-01-20 06:30:46'),
(272, 'Typesetting', 1, 0, '2016-01-20 06:30:57'),
(273, 'TypePad', 1, 0, '2016-01-20 06:31:10'),
(274, 'Twitter Marketing', 1, 0, '2016-01-20 06:31:23'),
(275, 'Bootstrap', 1, 0, '2016-01-20 06:31:36'),
(276, 'twitter api', 1, 0, '2016-01-20 06:31:48'),
(277, 'Twilio API', 1, 0, '2016-01-20 06:32:01'),
(278, 'Twig', 1, 0, '2016-01-20 06:32:13'),
(279, 'TV Broadcasting', 1, 0, '2016-01-20 06:32:29'),
(280, 'Turkish', 1, 0, '2016-01-20 06:32:41'),
(281, 'Turbo C', 1, 0, '2016-01-20 06:32:53'),
(282, 'Tumblr', 1, 0, '2016-01-20 06:33:04'),
(283, 'TSR', 1, 0, '2016-01-20 06:33:15'),
(284, 'TSM Administration', 1, 0, '2016-01-20 06:33:29'),
(285, 'Trusts Estates and Wills', 1, 0, '2016-01-20 06:33:42'),
(286, 'Tropo', 1, 0, '2016-01-20 06:33:54'),
(287, 'Trixbox', 1, 0, '2016-01-20 06:34:06'),
(288, 'Triakis VSIL', 1, 0, '2016-01-20 06:34:19'),
(289, 'Travel Writing', 1, 0, '2016-01-20 06:35:52'),
(290, 'Travel Planning', 1, 0, '2016-01-20 06:36:04'),
(291, 'Travel Agent', 1, 0, '2016-01-20 06:36:17'),
(292, 'Translation Yiddish English', 1, 0, '2016-01-20 06:36:37'),
(293, 'Translation Welsh English', 1, 0, '2016-01-20 06:36:49'),
(294, 'Translation Vietnamese English', 1, 0, '2016-01-20 06:37:01'),
(295, 'Translation Urdu English', 1, 0, '2016-01-20 06:37:18'),
(296, 'Translation Ukrainian English', 1, 0, '2016-01-20 06:37:30'),
(297, 'Translation Turkish English', 1, 0, '2016-01-20 06:37:44'),
(298, 'Translation Thai English', 1, 0, '2016-01-20 06:37:57'),
(299, 'Translation Telugu English', 1, 0, '2016-01-20 06:38:10'),
(300, 'Translation Tamil English', 1, 0, '2016-01-20 06:38:25'),
(301, 'Translation Tagalog English ', 1, 0, '2016-01-20 06:38:44'),
(302, 'Translation Swedish English', 1, 0, '2016-01-20 06:38:57'),
(303, 'Translation Swahili English', 1, 0, '2016-01-20 06:39:13'),
(304, 'Translation Spanish French', 1, 0, '2016-01-20 06:39:27'),
(305, 'Translation Spanish English', 1, 0, '2016-01-20 06:39:42'),
(306, 'Translation Slovenian English', 1, 0, '2016-01-20 06:39:59'),
(307, 'Translation Slovak English', 1, 0, '2016-01-20 06:40:11'),
(308, 'Translation Serbian English', 1, 0, '2016-01-20 06:40:23'),
(309, 'Translation Russian English', 1, 0, '2016-01-20 06:40:36'),
(310, 'Translation Romanian English', 1, 0, '2016-01-20 06:40:50'),
(311, 'Translation Portuguese English', 1, 0, '2016-01-20 06:41:03'),
(312, 'Translation Polish German', 1, 0, '2016-01-20 06:41:18'),
(313, 'Translation Polish English', 1, 0, '2016-01-20 06:41:34'),
(314, 'Translation Persian English', 1, 0, '2016-01-20 06:41:47'),
(315, 'Translation Norwegian English', 1, 0, '2016-01-20 06:41:59'),
(316, 'Translation Mandarin English', 1, 0, '2016-01-20 06:42:12'),
(317, 'Translation Maltese English', 1, 0, '2016-01-20 06:42:26'),
(318, 'Translation Malay English', 1, 0, '2016-01-20 06:42:42'),
(319, 'Translation Macedonian English', 1, 0, '2016-01-20 06:42:55'),
(320, 'Translation Lithuanian English', 1, 0, '2016-01-20 06:43:10'),
(321, 'Translation Latvian English', 1, 0, '2016-01-20 06:43:23'),
(322, 'Translation Latin English', 1, 0, '2016-01-20 06:43:34'),
(323, 'Translation Korean English', 1, 0, '2016-01-20 06:43:58'),
(324, 'Translation Kannada English', 1, 0, '2016-01-20 06:44:10'),
(325, 'Translation Japanese English', 1, 0, '2016-01-20 06:44:23'),
(326, 'Translation Italian English', 1, 0, '2016-01-20 06:44:36'),
(327, 'Translation Irish English', 1, 0, '2016-01-20 06:44:47'),
(328, 'Translation Indonesian English', 1, 0, '2016-01-20 06:44:59'),
(329, 'Translation Icelandic English', 1, 0, '2016-01-20 06:45:17'),
(330, 'Translation Hungarian English', 1, 0, '2016-01-20 06:45:30'),
(331, 'Translation Hindi English', 1, 0, '2016-01-20 06:45:42'),
(332, 'Translation Hebrew English', 1, 0, '2016-01-20 06:45:57'),
(333, 'Translation Haitian Creole English', 1, 0, '2016-01-20 06:46:11'),
(334, 'Translation Gujarati English', 1, 0, '2016-01-20 06:46:24'),
(335, 'Translation Greek English', 1, 0, '2016-01-20 06:46:38'),
(336, 'Translation German Polish', 1, 0, '2016-01-20 06:47:09'),
(337, 'Translation German French', 1, 0, '2016-01-20 06:47:47'),
(338, 'Translation German English', 1, 0, '2016-01-20 06:48:03'),
(339, 'Translation Georgian English', 1, 0, '2016-01-20 06:48:16'),
(340, 'Translation Galician English', 1, 0, '2016-01-20 06:48:35'),
(341, 'Translation French Spanish', 1, 0, '2016-01-20 06:48:52'),
(342, 'Translation French German', 1, 0, '2016-01-20 06:49:15'),
(343, 'Translation French English', 1, 0, '2016-01-20 06:49:26'),
(344, 'Translation Finnish English', 1, 0, '2016-01-20 06:49:43'),
(345, 'Translation Filipino English', 1, 0, '2016-01-20 06:50:04'),
(346, 'Translation Estonian English', 1, 0, '2016-01-20 06:50:16'),
(347, 'Translation English Yiddish', 1, 0, '2016-01-20 06:50:32'),
(348, 'Translation English Welsh', 1, 0, '2016-01-20 06:50:59'),
(349, 'Translation English Vietnamese', 1, 0, '2016-01-20 06:52:01'),
(350, 'Translation English Urdu', 1, 0, '2016-01-20 06:52:14'),
(351, 'Translation English Ukrainian', 1, 0, '2016-01-20 06:52:40'),
(352, 'Translation English Turkish', 1, 0, '2016-01-20 06:52:52'),
(353, 'Translation English Thai', 1, 0, '2016-01-20 06:53:05'),
(354, 'Translation English Telugu', 1, 0, '2016-01-20 06:53:18'),
(355, 'Translation English Tamil', 1, 0, '2016-01-20 06:53:32'),
(356, 'Translation English Tagalog', 1, 0, '2016-01-20 06:53:44'),
(357, 'Translation English Swedish', 1, 0, '2016-01-20 06:54:02'),
(358, 'Translation English Swahili', 1, 0, '2016-01-20 06:54:15'),
(359, 'Translation English Spanish', 1, 0, '2016-01-20 06:54:30'),
(360, 'Translation English Slovenian', 1, 0, '2016-01-20 06:54:48'),
(361, 'Translation English Slovak', 1, 0, '2016-01-20 06:55:01'),
(362, 'Translation English Serbian', 1, 0, '2016-01-20 06:55:15'),
(363, 'Translation English Russian', 1, 0, '2016-01-20 06:55:36'),
(364, 'Translation English Romanian', 1, 0, '2016-01-20 06:56:07'),
(365, 'Translation English Portuguese', 1, 0, '2016-01-20 06:56:27'),
(366, 'Translation English Polish', 1, 0, '2016-01-20 06:56:41'),
(367, 'Translation English Persian', 1, 0, '2016-01-20 06:57:03'),
(368, 'Translation English Norwegian', 1, 0, '2016-01-20 06:57:18'),
(369, 'Translation English Mandarin', 1, 0, '2016-01-20 06:57:31'),
(370, 'Translation English Maltese', 1, 0, '2016-01-20 06:58:03'),
(371, 'Translation English Malay', 1, 0, '2016-01-20 06:58:15'),
(372, 'Translation English Macedonian', 1, 0, '2016-01-20 06:58:28'),
(373, 'Translation English Lithuanian', 1, 0, '2016-01-20 06:58:49'),
(374, 'Translation English Latvian', 1, 0, '2016-01-20 06:59:03'),
(375, 'Translation English Latin', 1, 0, '2016-01-20 06:59:15'),
(376, 'Translation English Kyrgyz', 1, 0, '2016-01-20 06:59:27'),
(377, 'Translation English Korean', 1, 0, '2016-01-20 06:59:39'),
(378, 'Translation English Kannada', 1, 0, '2016-01-20 06:59:53'),
(379, 'Translation English Japanese', 1, 0, '2016-01-20 07:00:19'),
(380, 'Translation English Italian', 1, 0, '2016-01-20 07:00:39'),
(381, 'Translation English Irish', 1, 0, '2016-01-20 07:00:52'),
(382, 'Translation English Indonesian', 1, 0, '2016-01-20 07:01:08'),
(383, 'Translation English Icelandic', 1, 0, '2016-01-20 07:01:20'),
(384, 'Translation English Hungarian', 1, 0, '2016-01-20 07:01:34'),
(385, 'Translation English Hindi', 1, 0, '2016-01-20 07:01:56'),
(386, 'Translation English Hebrew', 1, 0, '2016-01-20 07:02:14'),
(387, 'Translation English Haitian Creole', 1, 0, '2016-01-20 07:02:31'),
(388, 'Translation English Gujarati', 1, 0, '2016-01-20 07:02:58'),
(389, 'Translation English Greek', 1, 0, '2016-01-20 07:03:16'),
(390, 'Translation English German', 1, 0, '2016-01-20 07:03:30'),
(391, 'Translation English Georgian', 1, 0, '2016-01-20 07:03:44'),
(392, 'Translation English Galician', 1, 0, '2016-01-20 07:04:04'),
(393, 'Translation English French', 1, 0, '2016-01-20 07:04:17'),
(394, 'Translation English Finnish', 1, 0, '2016-01-20 07:04:31'),
(395, 'Translation English Filipino', 1, 0, '2016-01-20 07:04:46'),
(396, 'Translation English Estonian', 1, 0, '2016-01-20 07:05:00'),
(397, 'Translation English Dutch', 1, 0, '2016-01-20 07:05:12'),
(398, 'Translation English Danish', 1, 0, '2016-01-20 07:05:27'),
(399, 'Translation English Czech', 1, 0, '2016-01-20 07:05:40'),
(400, 'Translation English Croatian', 1, 0, '2016-01-20 07:06:20'),
(401, 'Translation English Chinese', 1, 0, '2016-01-20 07:06:33'),
(402, 'Translation English Catalan', 1, 0, '2016-01-20 07:06:45'),
(403, 'Translation English Bulgarian', 1, 0, '2016-01-20 07:06:57'),
(404, 'Translation English Brazilian Portuguese', 1, 0, '2016-01-20 07:07:15'),
(405, 'Translation English Bengali', 1, 0, '2016-01-20 07:07:29'),
(406, 'Translation English Belariusan', 1, 0, '2016-01-20 07:07:42'),
(407, 'Translation English Armenian', 1, 0, '2016-01-20 07:08:02'),
(408, 'Translation English Arabic', 1, 0, '2016-01-20 07:08:16'),
(409, 'Translation English Albanian', 1, 0, '2016-01-20 07:08:32'),
(410, 'Translation English Afrikaans', 1, 0, '2016-01-20 07:08:44'),
(411, 'Translation Dutch English', 1, 0, '2016-01-20 07:09:01'),
(412, 'Translation Danish English', 1, 0, '2016-01-20 07:09:15'),
(413, 'Translation Czech English', 1, 0, '2016-01-20 07:09:39'),
(414, 'Translation Croatian English', 1, 0, '2016-01-20 07:09:56'),
(415, 'Translation Chinese English', 1, 0, '2016-01-20 07:10:10'),
(416, 'Translation Catalan English', 1, 0, '2016-01-20 07:10:27'),
(417, 'Translation Bulgarian English', 1, 0, '2016-01-20 07:10:58'),
(418, 'Translation Brazilian Portuguese English', 1, 0, '2016-01-20 07:11:13'),
(419, 'Translation Bengali English', 1, 0, '2016-01-20 07:11:31'),
(420, 'Translation Belarusian English', 1, 0, '2016-01-20 07:11:45'),
(421, 'Translation Armenian English', 1, 0, '2016-01-20 07:11:59'),
(422, 'Translation Arabic English', 1, 0, '2016-01-20 07:12:15'),
(423, 'Translation Albanian English', 1, 0, '2016-01-20 07:12:30'),
(424, 'Translation Afrikaans English', 1, 0, '2016-01-20 07:12:44'),
(425, 'Translation', 1, 0, '2016-01-20 07:12:58'),
(426, 'Transcription', 1, 0, '2016-01-20 07:13:11'),
(427, 'Transcreation', 1, 0, '2016-01-20 07:13:24'),
(428, 'Transaction Processing', 1, 0, '2016-01-20 07:13:40'),
(429, 'traffic geyser', 1, 0, '2016-01-20 07:13:57'),
(430, 'Trademark Consulting', 1, 0, '2016-01-20 07:14:16'),
(431, 'trade2bharat', 1, 0, '2016-01-20 07:14:36'),
(432, 'Trade Show Exhibition Design', 1, 0, '2016-01-20 07:14:54'),
(433, 'Trade marketing', 1, 0, '2016-01-20 07:15:07'),
(434, 'Trade Law', 1, 0, '2016-01-20 07:15:21'),
(435, 'Trac', 1, 0, '2016-01-20 07:15:33'),
(436, 'TQM', 1, 0, '2016-01-20 07:15:45'),
(437, 'Tourism', 1, 0, '2016-01-20 07:15:58'),
(438, 'Tortoise SVN', 1, 0, '2016-01-20 07:16:11'),
(439, 'Torque Game Engine', 1, 0, '2016-01-20 07:16:24'),
(440, 'Tornado', 1, 0, '2016-01-20 07:16:39'),
(441, 'Toon Boom Studio', 1, 0, '2016-01-20 07:16:55'),
(442, 'Toon Boom Harmony', 1, 0, '2016-01-20 07:17:15'),
(443, 'Toktumi', 1, 0, '2016-01-20 07:17:41'),
(444, 'Tk', 1, 0, '2016-01-20 07:17:55'),
(445, 'Tizen', 1, 0, '2016-01-20 07:18:29'),
(446, 'Time Management', 1, 0, '2016-01-20 07:18:43'),
(447, 'TIBCO ActiveMatrix BusinessWorks', 1, 0, '2016-01-20 07:19:04'),
(448, 'Theology', 1, 0, '2016-01-20 07:19:16'),
(449, 'The Pixel Farm PFTrack', 1, 0, '2016-01-20 07:19:28'),
(450, 'The Foundry NUKE', 1, 0, '2016-01-20 07:19:43'),
(451, 'Thai', 1, 0, '2016-01-20 07:20:20'),
(452, 'Team Foundation Server', 1, 0, '2016-01-20 07:20:38'),
(453, 'Texture Artist', 1, 0, '2016-01-20 07:20:53'),
(454, 'Textpattern ', 1, 0, '2016-01-20 07:21:04'),
(455, 'Textile Engineering', 1, 0, '2016-01-20 07:21:26'),
(456, 'Testopia', 1, 0, '2016-01-20 07:21:37'),
(457, 'Testing Framework', 1, 0, '2016-01-20 07:21:49'),
(458, 'TestLodge', 1, 0, '2016-01-20 07:22:16'),
(459, 'TestLink', 1, 0, '2016-01-20 07:22:32'),
(460, 'TestComplete', 1, 0, '2016-01-20 07:22:46'),
(461, 'Test Driven Development', 1, 0, '2016-01-20 07:23:06'),
(462, 'Test Case Design', 1, 0, '2016-01-20 07:23:17'),
(463, 'Test Automation', 1, 0, '2016-01-20 07:23:28'),
(464, 'Tesseract', 1, 0, '2016-01-20 07:23:44'),
(465, 'Teradata', 1, 0, '2016-01-20 07:23:57'),
(466, 'Templates', 1, 0, '2016-01-20 07:24:09'),
(467, 'Telugu', 1, 0, '2016-01-20 07:24:28'),
(468, 'Telerik', 1, 0, '2016-01-20 07:24:48'),
(469, 'Telephone Handling', 1, 0, '2016-01-20 07:24:59'),
(470, 'Telemarketing', 1, 0, '2016-01-20 07:25:27'),
(471, 'Telecommunications Engineering', 1, 0, '2016-01-20 07:25:38'),
(472, 'Tekla Structures', 1, 0, '2016-01-20 07:25:55'),
(473, 'Technical writing', 1, 0, '2016-01-20 07:27:45'),
(474, 'Technical Translation ', 1, 0, '2016-01-20 07:28:11'),
(475, 'Technical Support ', 1, 0, '2016-01-20 07:28:22'),
(476, 'Technical Recruiter ', 1, 0, '2016-01-20 07:28:39'),
(477, 'Technical Editing', 1, 0, '2016-01-20 07:28:51'),
(478, 'Technical Documentation ', 1, 0, '2016-01-20 07:29:05'),
(479, 'technical analysis', 1, 0, '2016-01-20 10:14:53'),
(480, 'TeamViewer', 1, 0, '2016-01-20 10:15:05'),
(481, 'Tealeaf cxImpact', 1, 0, '2016-01-20 10:15:17'),
(482, 'Teaching Physics', 1, 0, '2016-01-20 10:15:36'),
(483, 'Teaching Mathematics', 1, 0, '2016-01-20 10:15:52'),
(484, 'Teaching English', 1, 0, '2016-01-20 10:16:04'),
(485, 'Teaching Algebra', 1, 0, '2016-01-20 10:16:17'),
(486, 'TCP/IP', 1, 0, '2016-01-20 10:16:30'),
(487, 'Tcl/Tk', 1, 0, '2016-01-20 10:16:42'),
(488, 'Taxonomy', 1, 0, '2016-01-20 10:16:55'),
(489, 'Tax preparation', 1, 0, '2016-01-20 10:17:12'),
(490, 'Tax Law', 1, 0, '2016-01-20 10:17:24'),
(491, 'Tastypie', 1, 0, '2016-01-20 10:17:36'),
(492, 'TAPI', 1, 0, '2016-01-20 10:17:55'),
(493, 'Tapestry', 1, 0, '2016-01-20 10:18:07'),
(494, 'Tamil', 1, 0, '2016-01-20 10:18:20'),
(495, 'Tally .ERP', 1, 0, '2016-01-20 10:18:32'),
(496, 'Tally Shoper', 1, 0, '2016-01-20 10:18:45'),
(497, 'Talend Open Studio', 1, 0, '2016-01-20 10:19:04'),
(498, 'Tagalog', 1, 0, '2016-01-20 10:19:19'),
(499, 'Tableau Software', 1, 0, '2016-01-20 10:19:32'),
(500, 'Transact-SQL', 1, 0, '2016-01-20 10:19:46'),
(501, 'T-Shirt Design', 1, 0, '2016-01-20 10:19:59'),
(502, 'Systems Development', 1, 0, '2016-01-20 10:20:17'),
(503, 'System Programming', 1, 0, '2016-01-20 10:20:31'),
(504, 'System Automation', 1, 0, '2016-01-20 10:20:45'),
(505, 'System Analysis', 1, 0, '2016-01-20 10:20:59'),
(506, 'System Administration', 1, 0, '2016-01-20 10:21:14'),
(507, 'Synthetic Aperture Color Finesse', 1, 0, '2016-01-20 10:21:30'),
(508, 'Synopsis Writing', 1, 0, '2016-01-20 10:21:44'),
(509, 'Syncsort', 1, 0, '2016-01-20 10:21:56'),
(510, 'Symfony', 1, 0, '2016-01-20 10:22:08'),
(511, 'Symbian Development', 1, 0, '2016-01-20 10:22:20'),
(512, 'Sybase Programming', 1, 0, '2016-01-20 10:22:40'),
(513, 'SWT', 1, 0, '2016-01-20 10:22:53'),
(514, 'SWiSH Max', 1, 0, '2016-01-20 10:23:06'),
(515, 'Swing', 1, 0, '2016-01-20 10:23:23'),
(516, 'Swift', 1, 0, '2016-01-20 10:23:37'),
(517, 'Swedish', 1, 0, '2016-01-20 10:23:51'),
(518, 'Software Configuration Management ', 1, 0, '2016-01-20 10:24:11'),
(519, 'Apache Subversion (SVN) ', 1, 0, '2016-01-20 10:24:40'),
(520, 'Sustainable Energy ', 1, 0, '2016-01-20 10:24:50'),
(521, 'SurveyMonkey', 1, 0, '2016-01-20 10:25:05'),
(522, 'Survey Design ', 1, 0, '2016-01-20 10:25:17'),
(523, 'Supply chain management ', 1, 0, '2016-01-20 10:25:37'),
(524, 'supervisory skills', 1, 0, '2016-01-20 10:25:49'),
(525, 'Supervised learning ', 1, 0, '2016-01-20 10:26:04'),
(526, 'SunGard ', 1, 0, '2016-01-20 10:26:16'),
(527, 'SugarCRM Development ', 1, 0, '2016-01-20 10:26:25'),
(528, 'Subversion', 1, 0, '2016-01-20 10:26:39'),
(529, 'Subtitling ', 1, 0, '2016-01-20 10:26:58'),
(530, 'Style Guide Development ', 1, 0, '2016-01-20 10:27:16'),
(531, 'Structured Cabling', 1, 0, '2016-01-20 10:27:38'),
(532, 'Structural Engineering ', 1, 0, '2016-01-20 10:27:46'),
(533, 'Structural Analysis ', 1, 0, '2016-01-20 10:27:59'),
(534, 'StrongMail ', 1, 0, '2016-01-20 10:28:08'),
(535, 'Stripe ', 1, 0, '2016-01-20 10:28:22'),
(536, 'Stress Management ', 1, 0, '2016-01-20 10:28:31'),
(537, 'Stream Processing ', 1, 0, '2016-01-20 10:29:14'),
(538, 'Strategic planning ', 1, 0, '2016-01-20 10:29:23'),
(539, 'Stratasys ', 1, 0, '2016-01-20 10:29:37'),
(540, 'Storyboarding ', 1, 0, '2016-01-20 10:29:45'),
(541, 'Stored Procedure Development ', 1, 0, '2016-01-20 10:29:59'),
(542, 'Stock Management ', 1, 0, '2016-01-20 10:30:07'),
(543, 'Standard Template Library (STL) ', 1, 0, '2016-01-20 10:30:37'),
(544, 'Still Life Painting ', 1, 0, '2016-01-20 10:30:46'),
(545, 'Sticker Design ', 1, 0, '2016-01-20 10:30:55'),
(546, 'Stereoscopy ', 1, 0, '2016-01-20 10:31:04'),
(547, 'stenography ', 1, 0, '2016-01-20 10:31:12'),
(548, 'Steinberg WaveLab ', 1, 0, '2016-01-20 10:31:23'),
(549, 'Steinberg Cubase ', 1, 0, '2016-01-20 10:31:37'),
(550, 'Statpoint Statgraphics ', 1, 0, '2016-01-20 10:31:48'),
(551, 'Statistics ', 1, 0, '2016-01-20 10:32:00'),
(552, 'Statistical Computing ', 1, 0, '2016-01-20 10:32:13'),
(553, 'Stationery Design ', 1, 0, '2016-01-20 10:32:23'),
(554, 'Stata ', 1, 0, '2016-01-20 10:32:41'),
(555, 'Startup Consulting ', 1, 0, '2016-01-20 10:32:49'),
(556, 'Stakeholder Management ', 1, 0, '2016-01-20 10:32:57'),
(557, 'STAAD ', 1, 0, '2016-01-20 10:33:05'),
(558, 'SSL ', 1, 0, '2016-01-20 10:33:16'),
(559, 'SQL Server Integration Services (SSIS) ', 1, 0, '2016-01-20 10:33:57'),
(560, 'SSI ', 1, 0, '2016-01-20 10:34:09'),
(561, 'SSH ', 1, 0, '2016-01-20 10:34:22'),
(562, 'Squid ', 1, 0, '2016-01-20 10:34:30'),
(563, 'SquareSpace ', 1, 0, '2016-01-20 10:34:39'),
(564, 'SQR ', 1, 0, '2016-01-20 10:34:48'),
(565, 'Sqoop ', 1, 0, '2016-01-20 10:34:57'),
(566, 'SQLite Programming ', 1, 0, '2016-01-20 10:35:09'),
(567, 'SQLite Administration ', 1, 0, '2016-01-20 10:35:17'),
(568, 'SQL Programming ', 1, 0, '2016-01-20 10:35:30'),
(569, 'SQL CLR ', 1, 0, '2016-01-20 10:35:39'),
(570, 'SQL Azure ', 1, 0, '2016-01-20 10:35:50'),
(571, 'SQL', 1, 0, '2016-01-20 10:36:03'),
(572, 'SQA', 1, 0, '2016-01-20 10:38:18'),
(573, 'Spring Security ', 1, 0, '2016-01-20 10:38:28'),
(574, 'Spring Framework ', 1, 0, '2016-01-20 10:38:37'),
(575, 'Spree ', 1, 0, '2016-01-20 10:38:45'),
(576, 'Spreadsheets ', 1, 0, '2016-01-20 10:38:53'),
(577, 'Sports Writing ', 1, 0, '2016-01-20 10:39:06'),
(578, 'Special Purpose Machines Design ', 1, 0, '2016-01-20 10:39:15'),
(579, 'Splunk ', 1, 0, '2016-01-20 10:39:24'),
(580, 'Spiral Graphics Genetica ', 1, 0, '2016-01-20 10:39:33'),
(581, 'Spine JS', 1, 0, '2016-01-20 10:39:45'),
(582, 'Sphinx ', 1, 0, '2016-01-20 10:39:54'),
(583, 'Speech Writing ', 1, 0, '2016-01-20 10:40:03'),
(584, 'Sparx Systems Enterprise Architect ', 1, 0, '2016-01-20 10:40:14'),
(585, 'Spanish ', 1, 0, '2016-01-20 10:40:26'),
(586, 'SpamAssassin ', 1, 0, '2016-01-20 10:40:35'),
(587, 'Spacewalk ', 1, 0, '2016-01-20 10:40:43'),
(588, 'Soundtrack Pro', 1, 0, '2016-01-20 10:40:54'),
(589, 'Sound Forge ', 1, 0, '2016-01-20 10:41:05'),
(590, 'Sound Effects', 1, 0, '2016-01-20 10:41:17'),
(591, 'sound editing', 1, 0, '2016-01-20 10:41:29'),
(592, 'Sound Design', 1, 0, '2016-01-20 10:41:40'),
(593, 'Sony Vegas', 1, 0, '2016-01-20 10:41:52'),
(594, 'ACID Pro', 1, 0, '2016-01-20 10:42:05'),
(595, 'SolidWorks ', 1, 0, '2016-01-20 10:42:53'),
(596, 'Solid Edge ', 1, 0, '2016-01-20 10:43:03'),
(597, 'Solaris Administration ', 1, 0, '2016-01-20 10:43:12'),
(598, 'Software Testing ', 1, 0, '2016-01-20 10:43:21'),
(599, 'Software QA Testing ', 1, 0, '2016-01-20 10:43:31'),
(600, 'Software Licensing ', 1, 0, '2016-01-20 10:43:41'),
(601, 'Software Documentation ', 1, 0, '2016-01-20 10:43:51'),
(602, 'Software Defined Networking (SDN) ', 1, 0, '2016-01-20 10:43:59'),
(603, 'Software Debugging ', 1, 0, '2016-01-20 10:44:29'),
(604, 'Socket Programming', 1, 0, '2016-01-20 10:44:38'),
(605, 'SocialEngine', 1, 0, '2016-01-20 10:44:49'),
(606, 'Social Networking Development ', 1, 0, '2016-01-20 10:44:59'),
(607, 'Social Network Administration ', 1, 0, '2016-01-20 10:45:10'),
(608, 'Social Media Optimization (SMO) ', 1, 0, '2016-01-20 10:45:19'),
(609, 'Social Media Marketing', 1, 0, '2016-01-20 10:45:29'),
(610, 'Social Media Management ', 1, 0, '2016-01-20 10:46:11'),
(611, 'Social bookmarking ', 1, 0, '2016-01-20 10:46:23'),
(612, 'soapUI', 1, 0, '2016-01-20 10:46:34'),
(613, 'SOAP', 1, 0, '2016-01-20 10:46:45'),
(614, 'Snort ', 1, 0, '2016-01-20 10:46:55'),
(615, 'SNMP', 1, 0, '2016-01-20 10:47:06'),
(616, 'SnagIt ', 1, 0, '2016-01-20 10:47:19'),
(617, 'SMTP ', 1, 0, '2016-01-20 10:47:27'),
(618, 'SMS Gateway ', 1, 0, '2016-01-20 10:47:35'),
(619, 'SMS ', 1, 0, '2016-01-20 10:47:44'),
(620, 'SMPP ', 1, 0, '2016-01-20 10:47:53'),
(621, 'SMO', 1, 0, '2016-01-20 10:48:08'),
(622, 'Smarty', 1, 0, '2016-01-20 10:48:17'),
(623, 'SmartFoxServer', 1, 0, '2016-01-20 10:48:28'),
(624, 'Smalltalk ', 1, 0, '2016-01-20 10:48:38'),
(625, 'Slovenian', 1, 0, '2016-01-20 10:48:48'),
(626, 'Slovakian', 1, 0, '2016-01-20 10:49:02'),
(627, 'Slogans ', 1, 0, '2016-01-20 10:49:10'),
(628, 'skype development', 1, 0, '2016-01-20 10:49:20'),
(629, 'Skype', 1, 0, '2016-01-20 10:49:35'),
(630, 'Sketching', 1, 0, '2016-01-20 10:49:48'),
(631, 'Sketch', 1, 0, '2016-01-20 10:49:57'),
(632, 'Skeleton ', 1, 0, '2016-01-20 10:50:07'),
(633, 'SkaDate', 1, 0, '2016-01-20 10:50:57'),
(634, 'Six Sigma', 1, 0, '2016-01-20 10:51:06'),
(635, 'SiteScope', 1, 0, '2016-01-20 10:51:18'),
(636, 'Telerik Sitefinity CMS ', 1, 0, '2016-01-20 10:51:34'),
(637, 'Sitecore', 1, 0, '2016-01-20 10:51:44'),
(638, 'SiteBuildIt ', 1, 0, '2016-01-20 10:51:52'),
(639, 'SIP ', 1, 0, '2016-01-20 10:52:00'),
(640, 'Sinhala ', 1, 0, '2016-01-20 10:52:09'),
(641, 'Singing', 1, 0, '2016-01-20 10:52:24'),
(642, 'Sinatra Framework ', 1, 0, '2016-01-20 10:52:31'),
(643, 'Simulink', 1, 0, '2016-01-20 10:52:41'),
(644, 'Simplified Chinese', 1, 0, '2016-01-20 10:52:50'),
(645, 'SimpleDB', 1, 0, '2016-01-20 10:52:59'),
(646, 'Simple DirectMedia Layer', 1, 0, '2016-01-20 10:53:10'),
(647, 'SilverStripe', 1, 0, '2016-01-20 10:53:37'),
(648, 'Silex Framework ', 1, 0, '2016-01-20 10:53:44'),
(649, 'SigmaPlot ', 1, 0, '2016-01-20 10:53:52'),
(650, 'Siemens NX ', 1, 0, '2016-01-20 10:54:00'),
(651, 'Sibelius', 1, 0, '2016-01-20 10:54:12'),
(652, 'SHOUTcast ', 1, 0, '2016-01-20 10:54:20'),
(653, 'Short Story Writing ', 1, 0, '2016-01-20 10:54:29'),
(654, 'Shopify Templates ', 1, 0, '2016-01-20 10:54:39'),
(655, 'Shopify', 1, 0, '2016-01-20 10:54:53'),
(656, 'ShiVa3D ', 1, 0, '2016-01-20 10:55:01'),
(657, 'Microsoft SharePoint Designer ', 1, 0, '2016-01-20 10:55:16'),
(658, 'Session Description Protocol ', 1, 0, '2016-01-20 10:55:23'),
(659, 'Servoy ', 1, 0, '2016-01-20 10:55:35'),
(660, 'Servlet ', 1, 0, '2016-01-20 10:55:45'),
(661, 'Service Level Management', 1, 0, '2016-01-20 10:55:55'),
(662, 'Service Cloud Development', 1, 0, '2016-01-20 10:56:05'),
(663, 'Service Cloud Administration ', 1, 0, '2016-01-20 10:56:15'),
(664, 'Sermon', 1, 0, '2016-01-20 10:56:25'),
(665, 'Serialization ', 1, 0, '2016-01-20 10:56:34'),
(666, 'Serial Port Interfacing ', 1, 0, '2016-01-20 10:56:47'),
(667, 'Serenic Navigator ', 1, 0, '2016-01-20 10:56:56'),
(668, 'Serbian', 1, 0, '2016-01-20 10:57:08'),
(669, 'Sequential Art ', 1, 0, '2016-01-20 10:57:30'),
(670, 'SEOMoz ', 1, 0, '2016-01-20 10:57:38'),
(671, 'SEO Writing ', 1, 0, '2016-01-20 10:57:46'),
(672, 'SEO Keyword Research ', 1, 0, '2016-01-20 10:57:55'),
(673, 'SEO Backlinking', 1, 0, '2016-01-20 10:58:04'),
(674, 'SEO Audit ', 1, 0, '2016-01-20 10:58:49'),
(675, 'Search Engine Optimization (SEO) ', 1, 0, '2016-01-20 10:58:57'),
(676, 'SENuke X ', 1, 0, '2016-01-20 10:59:06'),
(677, 'Sentiment analysis ', 1, 0, '2016-01-20 10:59:18'),
(678, 'sensable claytrix ', 1, 0, '2016-01-20 10:59:27'),
(679, 'Sendmail ', 1, 0, '2016-01-20 10:59:36'),
(680, 'Sencha GXT ', 1, 0, '2016-01-20 10:59:53'),
(681, 'Sencha Touch ', 1, 0, '2016-01-20 11:00:01'),
(682, 'Semiconductor ', 1, 0, '2016-01-20 11:00:08'),
(683, 'Search engine marketing (SEM)', 1, 0, '2016-01-20 11:00:22'),
(684, 'Selling ', 1, 0, '2016-01-20 11:00:34'),
(685, 'Selenium WebDriver ', 1, 0, '2016-01-20 11:00:41'),
(686, 'Selenium ', 1, 0, '2016-01-20 11:00:51'),
(687, 'Security Infrastructure', 1, 0, '2016-01-20 11:01:01'),
(688, 'Security Engineering ', 1, 0, '2016-01-20 11:01:11'),
(689, 'Security Analysis ', 1, 0, '2016-01-20 11:01:19'),
(690, 'Internet Security ', 1, 0, '2016-01-20 11:01:27'),
(691, 'Section 508 Compliance ', 1, 0, '2016-01-20 11:01:42'),
(692, 'SDLX ', 1, 0, '2016-01-20 11:02:00'),
(693, 'SDL Trados ', 1, 0, '2016-01-20 11:02:21'),
(694, 'SDL Passolo', 1, 0, '2016-01-20 11:02:34'),
(695, 'Sculpture', 1, 0, '2016-01-20 11:02:45'),
(696, 'Sculpting ', 1, 0, '2016-01-20 11:02:53'),
(697, 'ScrumWorks ', 1, 0, '2016-01-20 11:03:02'),
(698, 'Scrum', 1, 0, '2016-01-20 11:03:13'),
(699, 'Scripts & Utilities', 1, 0, '2016-01-20 11:03:23'),
(700, 'Scripting ', 1, 0, '2016-01-20 11:03:32'),
(701, 'Script.aculo.us ', 1, 0, '2016-01-20 11:03:52'),
(702, 'Screenwriting ', 1, 0, '2016-01-20 11:04:00'),
(703, 'Scrapy ', 1, 0, '2016-01-20 11:04:07'),
(704, 'scrapebox ', 1, 0, '2016-01-20 11:04:14'),
(705, 'SCORM', 1, 0, '2016-01-20 11:04:26'),
(706, 'Scientific Writing ', 1, 0, '2016-01-20 11:04:36'),
(707, 'Scientific Research ', 1, 0, '2016-01-20 11:04:45'),
(708, 'Scientific Computation', 1, 0, '2016-01-20 11:04:55'),
(709, 'Scheme ', 1, 0, '2016-01-20 11:05:03'),
(710, 'Scenario Planning', 1, 0, '2016-01-20 11:05:15'),
(711, 'Scalr ', 1, 0, '2016-01-20 11:05:24'),
(712, 'Scale Modeling ', 1, 0, '2016-01-20 11:05:34'),
(713, 'Scalable transaction processing ', 1, 0, '2016-01-20 11:05:42'),
(714, 'Scala', 1, 0, '2016-01-20 11:05:53'),
(715, 'SCADA', 1, 0, '2016-01-20 11:06:02'),
(716, 'Savant3 ', 1, 0, '2016-01-20 11:06:35'),
(717, 'Satire ', 1, 0, '2016-01-20 11:06:44'),
(718, 'sassie mystery shopping', 1, 0, '2016-01-20 11:06:52'),
(719, 'Sass', 1, 0, '2016-01-20 11:07:02'),
(720, 'SAS', 1, 0, '2016-01-20 11:07:25'),
(721, 'SilverStripe', 1, 0, '2016-01-20 11:07:35'),
(722, 'SAP Warehouse Management', 1, 0, '2016-01-20 11:07:43'),
(723, 'SAP Web Dynpro', 1, 0, '2016-01-20 11:07:54'),
(724, 'SAP Sybase Adaptive Server Enterprise ', 1, 0, '2016-01-20 11:08:02'),
(725, 'SAP Solution Manager ', 1, 0, '2016-01-20 11:08:10'),
(726, 'SAP SD', 1, 0, '2016-01-20 11:08:19'),
(727, 'SAP Programming', 1, 0, '2016-01-20 11:08:31'),
(728, 'SAP NetWeaver', 1, 0, '2016-01-20 11:08:40'),
(729, 'SAP Materials Management', 1, 0, '2016-01-20 11:08:48'),
(730, 'SAP Manufacturing Execution ', 1, 0, '2016-01-20 11:08:54'),
(731, 'SAP Logistics Execution ', 1, 0, '2016-01-20 11:09:01'),
(732, 'SAP Hana', 1, 0, '2016-01-20 11:09:12'),
(733, 'SAP AG', 1, 0, '2016-01-20 11:09:21'),
(734, 'SAP ERP HCM ', 1, 0, '2016-01-20 11:09:30'),
(735, 'SAP ERP', 1, 0, '2016-01-20 11:09:42'),
(736, 'SAP CRM', 1, 0, '2016-01-20 11:09:52'),
(737, 'SAP BusinessOne', 1, 0, '2016-01-20 11:10:03'),
(738, 'SAP Business Objects', 1, 0, '2016-01-20 11:10:12'),
(739, 'SAP BSP', 1, 0, '2016-01-20 11:10:21'),
(740, 'SAP BASIS ', 1, 0, '2016-01-20 11:10:36'),
(741, 'SAP Analysis', 1, 0, '2016-01-20 11:10:48'),
(742, 'SAP ABAP ', 1, 0, '2016-01-20 11:10:55'),
(743, 'SAP2000 ', 1, 0, '2016-01-20 11:11:02'),
(744, 'SAP', 1, 0, '2016-01-20 11:11:11'),
(745, 'Samba', 1, 0, '2016-01-20 11:11:26'),
(746, 'Salesgenie.com ', 1, 0, '2016-01-20 11:11:36'),
(747, 'Salesforce.com ', 1, 0, '2016-01-20 11:11:50'),
(748, 'Salesforce App Development ', 1, 0, '2016-01-20 11:11:57'),
(749, 'Salesforce Apex ', 1, 0, '2016-01-20 11:12:04'),
(750, 'Sales Writing ', 1, 0, '2016-01-20 11:12:11'),
(751, 'Sales Promotion ', 1, 0, '2016-01-20 11:12:19'),
(752, 'Sales management ', 1, 0, '2016-01-20 11:12:32'),
(753, 'Sales Letters ', 1, 0, '2016-01-20 11:12:42'),
(754, 'Sales ', 1, 0, '2016-01-20 11:12:53'),
(755, 'Salary Surveys ', 1, 0, '2016-01-20 11:13:00'),
(756, 'SAI ', 1, 0, '2016-01-20 11:13:08'),
(757, 'Sage Peachtree Complete Accounting ', 1, 0, '2016-01-20 11:13:23'),
(758, 'Sage ERP Accpac ', 1, 0, '2016-01-20 11:13:32'),
(759, 'Sabre ', 1, 0, '2016-01-20 11:14:13'),
(760, 'Sassu ', 1, 0, '2016-01-20 11:14:21'),
(761, 'SaaS ', 1, 0, '2016-01-20 11:14:28'),
(762, 'S ', 1, 0, '2016-01-20 11:14:38'),
(763, 'Russian Language ', 1, 0, '2016-01-20 11:20:25'),
(764, 'Rational Unified Process (RUP) ', 1, 0, '2016-01-20 11:20:34'),
(765, 'Ruby on Rails ', 1, 0, '2016-01-20 11:20:44'),
(766, 'Ruby ', 1, 0, '2016-01-20 11:20:54'),
(767, 'RTOS ', 1, 0, '2016-01-20 11:21:04'),
(768, 'RTML ', 1, 0, '2016-01-20 11:21:11'),
(769, 'RTLinux ', 1, 0, '2016-01-20 11:21:18'),
(770, 'RTL ', 1, 0, '2016-01-20 11:21:27'),
(771, 'RSS ', 1, 0, '2016-01-20 11:21:37'),
(772, 'RSpec ', 1, 0, '2016-01-20 11:21:44'),
(773, 'RPG Writing ', 1, 0, '2016-01-20 11:21:51'),
(774, 'RPG (OS/400) ', 1, 0, '2016-01-20 11:22:01'),
(775, 'RPG Development ', 1, 0, '2016-01-20 11:22:16'),
(776, 'Rotoscoping ', 1, 0, '2016-01-20 11:22:24'),
(777, 'Robotscope ', 1, 0, '2016-01-20 11:22:32'),
(778, 'Root Cause Analysis ', 1, 0, '2016-01-20 11:22:38'),
(779, 'Roomorama API ', 1, 0, '2016-01-20 11:22:45'),
(780, 'Romanian ', 1, 0, '2016-01-20 11:22:53'),
(781, 'Robotics ', 1, 0, '2016-01-20 11:23:00'),
(782, 'Robot Framework ', 1, 0, '2016-01-20 11:23:11'),
(783, 'Java Remote Method Invocation (Java RMI) ', 1, 0, '2016-01-20 11:23:22'),
(784, 'Risk management ', 1, 0, '2016-01-20 11:23:35'),
(785, 'RightScale ', 1, 0, '2016-01-20 11:23:42'),
(786, 'Richfaces ', 1, 0, '2016-01-20 11:23:48'),
(787, 'Rhodes Framework ', 1, 0, '2016-01-20 11:23:55'),
(788, 'Rhino Service Bus ', 1, 0, '2016-01-20 11:24:02'),
(789, 'RhinoScript ', 1, 0, '2016-01-20 11:24:12'),
(790, 'Rhinoceros 3D ', 1, 0, '2016-01-20 11:24:23'),
(791, 'Red Hat Enterprise Linux (RHEL) ', 1, 0, '2016-01-20 11:24:38'),
(792, 'Red Hat Certified Engineer (RHCE) ', 1, 0, '2016-01-20 11:24:47'),
(793, 'RFID ', 1, 0, '2016-01-20 11:27:42'),
(794, 'Autodesk Revit Architecture ', 1, 0, '2016-01-20 11:27:50'),
(795, 'Reviews ', 1, 0, '2016-01-20 11:28:03'),
(796, 'Reverse engineering ', 1, 0, '2016-01-20 11:28:15'),
(797, 'RETS ', 1, 0, '2016-01-20 11:28:25'),
(798, 'Retail Ops Management ', 1, 0, '2016-01-20 11:28:32'),
(799, 'Retail Merchandising ', 1, 0, '2016-01-20 11:28:41'),
(800, 'Resume Writing ', 1, 0, '2016-01-20 11:28:58'),
(801, 'REST ', 1, 0, '2016-01-20 11:29:08'),
(802, 'Responsys Marketing ', 1, 0, '2016-01-20 11:29:25'),
(803, 'Responsys Development ', 1, 0, '2016-01-20 11:29:33'),
(804, 'Responsys Administration ', 1, 0, '2016-01-20 11:30:41'),
(805, 'Responsive Web Design ', 1, 0, '2016-01-20 11:30:49'),
(806, 'Resource Description Framework (RDF) ', 1, 0, '2016-01-20 11:30:58'),
(807, 'Resin ', 1, 0, '2016-01-20 11:31:05'),
(808, 'Research Papers ', 1, 0, '2016-01-20 11:31:12'),
(809, 'Research ', 1, 0, '2016-01-20 11:31:22'),
(810, 'Requirements analysis ', 1, 0, '2016-01-20 11:31:35'),
(811, 'Requirement Management ', 1, 0, '2016-01-20 11:31:44'),
(812, 'Reputation Management ', 1, 0, '2016-01-20 11:31:55'),
(813, 'RepRap ', 1, 0, '2016-01-20 11:32:03'),
(814, 'report writing ', 1, 0, '2016-01-20 11:32:10'),
(815, 'Remoting ', 1, 0, '2016-01-20 11:32:17'),
(816, 'Remote Sensing ', 1, 0, '2016-01-20 11:32:24'),
(817, 'Relationship Management ', 1, 0, '2016-01-20 11:32:38'),
(818, 'Relational Databases ', 1, 0, '2016-01-20 11:32:46'),
(819, 'Regular Expressions ', 1, 0, '2016-01-20 11:32:54'),
(820, 'Regression testing ', 1, 0, '2016-01-20 11:33:05'),
(821, 'Refinery CMS ', 1, 0, '2016-01-20 11:33:13'),
(822, 'Redmine ', 1, 0, '2016-01-20 11:33:20'),
(823, 'Redis ', 1, 0, '2016-01-20 11:33:36'),
(824, 'Red Hat Administration ', 1, 0, '2016-01-20 11:33:43'),
(825, 'Red5 ', 1, 0, '2016-01-20 11:33:57'),
(826, 'Recruiting ', 1, 0, '2016-01-20 11:34:05'),
(827, 'Records Management ', 1, 0, '2016-01-20 11:34:11'),
(828, 'Recommender Systems ', 1, 0, '2016-01-20 11:34:20'),
(829, 'Recipe Writing ', 1, 0, '2016-01-20 11:34:27'),
(830, 'Receptionist Skills ', 1, 0, '2016-01-20 11:34:36'),
(831, 'Receipt Parsing ', 1, 0, '2016-01-20 11:34:44'),
(832, 'Realist Painting ', 1, 0, '2016-01-20 11:34:53'),
(833, 'Realbasic ', 1, 0, '2016-01-20 11:35:02'),
(834, 'Real time stream processing ', 1, 0, '2016-01-20 11:35:13'),
(835, 'Real Estate Management ', 1, 0, '2016-01-20 11:35:19'),
(836, 'Real Estate Law ', 1, 0, '2016-01-20 11:35:28'),
(837, 'Real Estate IDX ', 1, 0, '2016-01-20 11:35:36'),
(838, 'Real Estate Appraisal ', 1, 0, '2016-01-20 11:35:45'),
(839, 'Razor Template Engine ', 1, 0, '2016-01-20 11:35:55'),
(840, 'IBM Rational Rose ', 1, 0, '2016-01-20 11:36:20'),
(841, 'Retail Sales Management ', 1, 0, '2016-01-20 11:36:27'),
(842, 'Raspberry Pi ', 1, 0, '2016-01-20 11:36:35'),
(843, 'RapidWorks ', 1, 0, '2016-01-20 11:36:47'),
(844, 'Rapid Prototyping ', 1, 0, '2016-01-20 11:36:55'),
(845, 'Rapid Miner ', 1, 0, '2016-01-20 11:37:02'),
(846, 'Raphael JS ', 1, 0, '2016-01-20 11:37:09'),
(847, 'RAID Administration ', 1, 0, '2016-01-20 11:37:17'),
(848, 'RADIUS ', 1, 0, '2016-01-20 11:37:27'),
(849, 'Radio personality ', 1, 0, '2016-01-20 11:37:35'),
(850, 'Radio Broadcasting ', 1, 0, '2016-01-20 11:37:42'),
(851, 'Radiant Zemax ', 1, 0, '2016-01-20 11:37:50'),
(852, 'Radiant CMS ', 1, 0, '2016-01-20 11:38:00'),
(853, 'Rackspace Cloud Servers ', 1, 0, '2016-01-20 11:38:08'),
(854, 'Rackspace ', 1, 0, '2016-01-20 11:38:16'),
(855, 'RabbitMQ ', 1, 0, '2016-01-20 11:38:24'),
(856, 'R-Hadoop ', 1, 0, '2016-01-20 11:38:34'),
(857, 'R ', 1, 0, '2016-01-20 11:38:44'),
(858, 'QuickFIX ', 1, 0, '2016-01-20 11:41:41'),
(859, 'quick sales system ', 1, 0, '2016-01-20 11:41:47'),
(860, 'Quartz Composer ', 1, 0, '2016-01-20 11:41:55'),
(861, 'quartz ', 1, 0, '2016-01-20 11:42:03'),
(862, 'Quark Xpress ', 1, 0, '2016-01-20 11:42:11'),
(863, 'Quantity Surveying ', 1, 0, '2016-01-20 11:42:19'),
(864, 'Quantitative Analysis ', 1, 0, '2016-01-20 11:42:26'),
(865, 'Qualitative Research ', 1, 0, '2016-01-20 11:42:37'),
(866, 'Qt ', 1, 0, '2016-01-20 11:42:45'),
(867, 'QS Cad ', 1, 0, '2016-01-20 11:42:52'),
(868, 'Qooxdoo ', 1, 0, '2016-01-20 11:43:12'),
(869, 'QNX ', 1, 0, '2016-01-20 11:43:19'),
(870, 'Qmail ', 1, 0, '2016-01-20 11:43:30'),
(871, 'QlikTech QlikView ', 1, 0, '2016-01-20 11:43:36'),
(872, 'qhse ', 1, 0, '2016-01-20 11:43:43'),
(873, 'QGIS ', 1, 0, '2016-01-20 11:43:50'),
(874, 'Qcodo ', 1, 0, '2016-01-20 11:43:57'),
(875, 'QA Management ', 1, 0, '2016-01-20 11:44:04'),
(876, 'QA Engineering ', 1, 0, '2016-01-20 11:44:13'),
(877, 'Quality of Service (Q-oS) ', 1, 0, '2016-01-20 11:44:23'),
(878, 'Q ', 1, 0, '2016-01-20 11:44:31'),
(879, 'Python SciPy ', 1, 0, '2016-01-20 11:46:18'),
(880, 'Python Numpy ', 1, 0, '2016-01-20 11:46:24'),
(881, 'Python ', 1, 0, '2016-01-20 11:46:33'),
(882, 'pyro ', 1, 0, '2016-01-20 11:46:40'),
(883, 'PyQt ', 1, 0, '2016-01-20 11:48:01'),
(884, 'Pylons ', 1, 0, '2016-01-20 11:48:07'),
(885, 'Pyjamas ', 1, 0, '2016-01-20 11:48:16'),
(886, 'Pure Data ', 1, 0, '2016-01-20 11:48:31'),
(887, 'Purchasing Management ', 1, 0, '2016-01-20 11:48:38'),
(888, 'Puppet Administration ', 1, 0, '2016-01-20 11:48:50'),
(889, 'Punjabi ', 1, 0, '2016-01-20 11:48:57'),
(890, 'punching ', 1, 0, '2016-01-20 11:49:17'),
(891, 'Punch Home Design Studio Pro ', 1, 0, '2016-01-20 11:49:26'),
(892, 'Publishing Fundamentals ', 1, 0, '2016-01-20 11:49:32'),
(893, 'Public speaking ', 1, 0, '2016-01-20 11:49:40'),
(894, 'Public Relations ', 1, 0, '2016-01-20 11:49:46'),
(895, 'PTGui ', 1, 0, '2016-01-20 11:49:54'),
(896, 'PTC Creo Elements/Pro ', 1, 0, '2016-01-20 11:50:27'),
(897, 'Psychometric Examination ', 1, 0, '2016-01-20 11:50:37'),
(898, 'PSPICE ', 1, 0, '2016-01-20 11:50:48'),
(899, 'PSD2CMS ', 1, 0, '2016-01-20 11:50:55'),
(900, 'PSD to XHTML ', 1, 0, '2016-01-20 11:51:02'),
(901, 'PSD to Wordpress ', 1, 0, '2016-01-20 11:51:23'),
(902, 'PSD to MailChimp ', 1, 0, '2016-01-20 11:51:31'),
(903, 'psd to html ', 1, 0, '2016-01-20 11:51:41'),
(904, 'Prototype Javascript Framework ', 1, 0, '2016-01-20 11:51:50'),
(905, 'Protoshare ', 1, 0, '2016-01-20 11:51:58'),
(906, 'ProTools ', 1, 0, '2016-01-20 11:52:50'),
(907, 'Proposal Writing ', 1, 0, '2016-01-20 11:52:59'),
(908, 'Property Tax ', 1, 0, '2016-01-20 11:53:11'),
(909, 'Property Management ', 1, 0, '2016-01-20 11:53:20'),
(910, 'Property Development ', 1, 0, '2016-01-20 11:53:30'),
(911, 'Propellerhead Reason ', 1, 0, '2016-01-20 11:53:38'),
(912, 'Proofreading ', 1, 0, '2016-01-20 11:53:46'),
(913, 'Prolog ', 1, 0, '2016-01-20 11:53:57'),
(914, 'Project Scheduling ', 1, 0, '2016-01-20 11:54:05'),
(915, 'Project Planning ', 1, 0, '2016-01-20 11:54:12'),
(916, 'Project Management professional ', 1, 0, '2016-01-20 11:54:23'),
(917, 'Project management ', 1, 0, '2016-01-20 11:54:58'),
(918, 'Program Management ', 1, 0, '2016-01-20 11:55:08'),
(919, 'Pro-E ', 1, 0, '2016-01-20 11:55:17'),
(920, 'Product management ', 1, 0, '2016-01-20 11:55:28'),
(921, 'Product Liability ', 1, 0, '2016-01-20 11:55:35'),
(922, 'Product Development ', 1, 0, '2016-01-20 11:55:42'),
(923, 'Product Design ', 1, 0, '2016-01-20 11:55:53'),
(924, 'Product Descriptions ', 1, 0, '2016-01-20 11:56:00'),
(925, 'Processing ', 1, 0, '2016-01-20 11:56:08'),
(926, 'Process improvement ', 1, 0, '2016-01-20 11:56:15'),
(927, 'Process architecture ', 1, 0, '2016-01-20 11:56:22'),
(928, 'Private Clouds ', 1, 0, '2016-01-20 11:56:57'),
(929, 'Privacy ', 1, 0, '2016-01-20 11:57:04');
INSERT INTO `skills` (`id`, `name`, `active`, `delete_remove`, `date_added`) VALUES
(930, 'Print Layout Design ', 1, 0, '2016-01-20 11:57:11'),
(931, 'Print design ', 1, 0, '2016-01-20 11:57:18'),
(932, 'Print Advertising ', 1, 0, '2016-01-20 11:57:28'),
(933, 'PrimeFaces ', 1, 0, '2016-01-20 11:57:36'),
(934, 'Oracle Primavera ', 1, 0, '2016-01-20 11:57:43'),
(935, 'Prezi ', 1, 0, '2016-01-20 11:57:50'),
(936, 'PrestaShop ', 1, 0, '2016-01-20 11:57:57'),
(937, 'Press Release Writing ', 1, 0, '2016-01-20 11:58:08'),
(938, 'Press Advertising ', 1, 0, '2016-01-20 11:58:20'),
(939, 'PreSonus Studio One ', 1, 0, '2016-01-20 11:58:36'),
(940, 'Presentations ', 1, 0, '2016-01-20 11:58:43'),
(941, 'Presentation Design ', 1, 0, '2016-01-20 11:58:50'),
(942, 'Predictive Analytics ', 1, 0, '2016-01-20 12:00:25'),
(943, 'Prepress ', 1, 0, '2016-01-20 12:00:40'),
(944, 'PRADO PHP Framework ', 1, 0, '2016-01-20 12:00:46'),
(945, 'Pay Per Click Advertising ', 1, 0, '2016-01-20 12:00:54'),
(946, 'Windows PowerShell ', 1, 0, '2016-01-20 12:01:01'),
(947, 'Power Builder ', 1, 0, '2016-01-20 12:01:08'),
(948, 'PostScript ', 1, 0, '2016-01-20 12:01:20'),
(949, 'PostgreSQL Programming ', 1, 0, '2016-01-20 12:01:30'),
(950, 'PostgreSQL Administration ', 1, 0, '2016-01-20 12:01:41'),
(951, 'Postfix SMTP Server ', 1, 0, '2016-01-20 12:01:49'),
(952, 'Posterous ', 1, 0, '2016-01-20 12:01:57'),
(953, 'Poster Design ', 1, 0, '2016-01-20 12:02:06'),
(954, 'Poser ', 1, 0, '2016-01-20 12:02:17'),
(955, 'POS Terminal Development ', 1, 0, '2016-01-20 12:02:24'),
(956, 'Portuguese ', 1, 0, '2016-01-20 12:02:33'),
(957, 'Portlets ', 1, 0, '2016-01-20 12:02:41'),
(958, 'Portfolio Performance Modeling ', 1, 0, '2016-01-20 12:02:51'),
(959, 'Portrait Painting ', 1, 0, '2016-01-20 12:02:59'),
(960, 'Pomodoro Technique ', 1, 0, '2016-01-20 12:03:11'),
(961, 'Polymer Clay Sculpting ', 1, 0, '2016-01-20 12:03:19'),
(962, 'Polish ', 1, 0, '2016-01-20 12:03:30'),
(963, 'Policy Writing ', 1, 0, '2016-01-20 12:03:39'),
(964, 'Poetry ', 1, 0, '2016-01-20 12:03:52'),
(965, 'Podio ', 1, 0, '2016-01-20 12:04:15'),
(966, 'Pocket PC ', 1, 0, '2016-01-20 12:04:29'),
(967, 'PMDS ', 1, 0, '2016-01-20 12:04:37'),
(968, 'Plumbing ', 1, 0, '2016-01-20 12:04:44'),
(969, 'Plone ', 1, 0, '2016-01-20 12:04:54'),
(970, 'Plivo ', 1, 0, '2016-01-20 12:05:01'),
(971, 'Pligg ', 1, 0, '2016-01-20 12:05:08'),
(972, 'Plesk ', 1, 0, '2016-01-20 12:05:16'),
(973, 'PLC Programming ', 1, 0, '2016-01-20 12:05:24'),
(974, 'PLC & SCADA ', 1, 0, '2016-01-20 12:05:33'),
(975, 'Play Framework ', 1, 0, '2016-01-20 12:05:41'),
(976, 'Platform Migration ', 1, 0, '2016-01-20 12:05:54'),
(977, 'Pixologic Zbrush ', 1, 0, '2016-01-20 12:06:06'),
(978, 'Pinterest Marketing ', 1, 0, '2016-01-20 12:06:13'),
(979, 'Pinnacle Studio ', 1, 0, '2016-01-20 12:06:21'),
(980, 'Pig ', 1, 0, '2016-01-20 12:06:28'),
(981, 'Piano Performance ', 1, 0, '2016-01-20 12:06:37'),
(982, 'Piano Composition ', 1, 0, '2016-01-20 12:06:48'),
(983, 'Physics ', 1, 0, '2016-01-20 12:06:59'),
(984, 'Physical Fitness ', 1, 0, '2016-01-20 12:07:15'),
(985, 'PHP-Nuke ', 1, 0, '2016-01-20 12:07:23'),
(986, 'phpMyDirectory ', 1, 0, '2016-01-20 12:07:30'),
(987, 'phpMyAdmin ', 1, 0, '2016-01-20 12:07:41'),
(988, 'phpfox ', 1, 0, '2016-01-20 12:07:51'),
(989, 'PhpBB ', 1, 0, '2016-01-20 12:08:00'),
(990, 'PHP ', 1, 0, '2016-01-20 12:08:10'),
(991, 'PhotoScape ', 1, 0, '2016-01-20 12:08:56'),
(992, 'Photography ', 1, 0, '2016-01-20 12:09:04'),
(993, 'Photograph Color Correction ', 1, 0, '2016-01-20 12:09:11'),
(994, 'Photo Retouching ', 1, 0, '2016-01-20 12:09:18'),
(995, 'Photo Manipulation ', 1, 0, '2016-01-20 12:09:28'),
(996, 'Photo Editing ', 1, 0, '2016-01-20 12:09:37'),
(997, 'PhoneGap ', 1, 0, '2016-01-20 12:09:43'),
(998, 'Phone Support ', 1, 0, '2016-01-20 12:09:56'),
(999, 'Phing ', 1, 0, '2016-01-20 12:10:05'),
(1000, 'PfSense ', 1, 0, '2016-01-20 12:10:15'),
(1001, 'Petroleum Engineering ', 1, 0, '2016-01-20 12:10:27'),
(1002, 'PESTEL ', 1, 0, '2016-01-20 12:10:37'),
(1003, 'Pervasive Software ', 1, 0, '2016-01-20 12:10:44'),
(1004, 'Personal Development ', 1, 0, '2016-01-20 12:10:52'),
(1005, 'Persian ', 1, 0, '2016-01-20 12:11:01'),
(1006, 'PerlDancer ', 1, 0, '2016-01-20 12:11:07'),
(1007, 'Perl Mojolicious ', 1, 0, '2016-01-20 12:11:15'),
(1008, 'Perl Catalyst ', 1, 0, '2016-01-20 12:11:22'),
(1009, 'Perl ', 1, 0, '2016-01-20 12:11:40'),
(1010, 'Performing arts ', 1, 0, '2016-01-20 12:11:50'),
(1011, 'Performance Tuning ', 1, 0, '2016-01-20 12:11:57'),
(1012, 'Performance testing ', 1, 0, '2016-01-20 12:12:05'),
(1013, 'Perforce ', 1, 0, '2016-01-20 12:12:17'),
(1014, 'Oracle Peoplesoft Development ', 1, 0, '2016-01-20 12:12:24'),
(1015, 'Oracle Peoplesoft Administration ', 1, 0, '2016-01-20 12:12:31'),
(1016, 'PeopleCode ', 1, 0, '2016-01-20 12:12:39'),
(1017, 'Pentaho ', 1, 0, '2016-01-20 12:12:47'),
(1018, 'Penetration Testing ', 1, 0, '2016-01-20 12:12:54'),
(1019, 'PEAR ', 1, 0, '2016-01-20 12:13:02'),
(1020, 'Peachtree Accounting ', 1, 0, '2016-01-20 12:13:09'),
(1021, 'PDF Conversion ', 1, 0, '2016-01-20 12:13:17'),
(1022, 'PCI Compliance ', 1, 0, '2016-01-20 12:13:27'),
(1023, 'PCB Design ', 1, 0, '2016-01-20 12:13:38'),
(1024, 'PCAP ', 1, 0, '2016-01-20 12:13:47'),
(1025, 'PBworks Development ', 1, 0, '2016-01-20 12:13:55'),
(1026, 'PBwiki ', 1, 0, '2016-01-20 12:14:07'),
(1027, 'Payroll Processing ', 1, 0, '2016-01-20 12:14:14'),
(1028, 'Paypal Integration ', 1, 0, '2016-01-20 12:14:20'),
(1029, 'PayPal Development ', 1, 0, '2016-01-20 12:14:28'),
(1030, 'Payment Processing ', 1, 0, '2016-01-20 12:14:35'),
(1031, 'Payment Gateway Integration ', 1, 0, '2016-01-20 12:14:47'),
(1032, 'Pay per click ', 1, 0, '2016-01-20 12:14:56'),
(1033, 'Pattern recognition ', 1, 0, '2016-01-20 12:15:27'),
(1034, 'Patent Law ', 1, 0, '2016-01-20 12:15:34'),
(1035, 'Pashto ', 1, 0, '2016-01-20 12:15:42'),
(1036, 'Pascal ', 1, 0, '2016-01-20 12:15:48'),
(1037, 'ParticleIllusion ', 1, 0, '2016-01-20 12:15:55'),
(1038, 'Parse Mobile App Platform ', 1, 0, '2016-01-20 12:16:07'),
(1039, 'Pardot Marketing ', 1, 0, '2016-01-20 12:16:15'),
(1040, 'Pardot Development ', 1, 0, '2016-01-20 12:16:25'),
(1041, 'Pardot Development ', 1, 0, '2016-01-20 12:16:34'),
(1042, 'Pardot Administration ', 1, 0, '2016-01-20 12:16:41'),
(1043, 'Parallels Virtual Desktop ', 1, 0, '2016-01-20 12:16:48'),
(1044, 'Paralegal Services ', 1, 0, '2016-01-20 12:16:56'),
(1045, 'Papervision3D ', 1, 0, '2016-01-20 12:17:04'),
(1046, 'Papercraft ', 1, 0, '2016-01-20 12:17:11'),
(1047, 'Panoramic Stitching ', 1, 0, '2016-01-20 12:17:19'),
(1048, 'Palm App Development ', 1, 0, '2016-01-20 12:17:28'),
(1049, 'Palm', 1, 0, '2016-01-20 12:17:40'),
(1050, 'Paint.NET ', 1, 0, '2016-01-20 12:17:49'),
(1051, 'Packaging Design ', 1, 0, '2016-01-20 12:17:56'),
(1052, 'P-CAD ', 1, 0, '2016-01-20 12:18:04'),
(1053, 'Outbound Sales ', 1, 0, '2016-01-20 12:20:13'),
(1054, 'OSPF ', 1, 0, '2016-01-20 12:20:21'),
(1055, 'OSGi ', 1, 0, '2016-01-20 12:20:31'),
(1056, 'OsCommerce ', 1, 0, '2016-01-20 12:20:44'),
(1057, 'osclass ', 1, 0, '2016-01-20 12:20:49'),
(1058, 'OS/2 ', 1, 0, '2016-01-20 12:21:00'),
(1059, 'ORMLite ', 1, 0, '2016-01-20 12:21:08'),
(1060, 'ORM ', 1, 0, '2016-01-20 12:21:17'),
(1061, 'Organizational Development ', 1, 0, '2016-01-20 12:21:25'),
(1062, 'Organizational Behavior ', 1, 0, '2016-01-20 12:21:37'),
(1063, 'Order processing ', 1, 0, '2016-01-20 12:21:45'),
(1064, 'Order Entry ', 1, 0, '2016-01-20 12:21:52'),
(1065, 'Orchard CMS ', 1, 0, '2016-01-20 12:22:00'),
(1066, 'OrCAD ', 1, 0, '2016-01-20 12:22:07'),
(1067, 'OrangeCRM ', 1, 0, '2016-01-20 12:22:14'),
(1068, 'Oracle User Productivity Kit ', 1, 0, '2016-01-20 12:22:29'),
(1069, 'Oracle Upgrade ', 1, 0, '2016-01-20 12:22:36'),
(1070, 'Oracle Unified Method ', 1, 0, '2016-01-20 12:22:44'),
(1071, 'Oracle Universal Content Management ', 1, 0, '2016-01-20 12:22:51'),
(1072, 'Oracle Transportation Management ', 1, 0, '2016-01-20 12:22:59'),
(1073, 'Oracle Team Productivity Center ', 1, 0, '2016-01-20 12:23:43'),
(1074, 'Oracle Taleo ', 1, 0, '2016-01-20 12:23:51'),
(1075, 'Oracle Sun Ray ', 1, 0, '2016-01-20 12:24:34'),
(1076, 'Oracle SOA Suite ', 1, 0, '2016-01-20 12:24:44'),
(1077, 'Oracle Siebel ', 1, 0, '2016-01-20 12:24:52'),
(1078, 'Oracle RightNow ', 1, 0, '2016-01-20 12:25:03'),
(1079, 'Oracle Reports ', 1, 0, '2016-01-20 12:25:13'),
(1080, 'Oracle Real Application Clusters (RAC) ', 1, 0, '2016-01-20 12:25:23'),
(1081, 'Oracle Programming ', 1, 0, '2016-01-20 12:25:30'),
(1082, 'Oracle Primavera ', 1, 0, '2016-01-20 12:26:07'),
(1083, 'Oracle Policy Automation', 1, 0, '2016-01-20 12:26:18'),
(1084, 'Oracle PLSQL ', 1, 0, '2016-01-20 12:26:25'),
(1085, 'Oracle PL/SQL ', 1, 0, '2016-01-20 12:26:33'),
(1086, 'oracle performance tuning ', 1, 0, '2016-01-20 12:26:41'),
(1087, 'Oracle Patching ', 1, 0, '2016-01-20 12:27:35'),
(1088, 'Orace OBIEE Plus ', 1, 0, '2016-01-20 12:27:50'),
(1089, 'Oracle Java EE ', 1, 0, '2016-01-20 12:27:57'),
(1090, 'Oracle Hyperion Planning ', 1, 0, '2016-01-20 12:28:04'),
(1091, 'Oracle Global Trade Management ', 1, 0, '2016-01-20 12:28:11'),
(1092, 'Oracle Fusion Middleware ', 1, 0, '2016-01-20 12:28:18'),
(1093, 'Oracle Fusion Applications ', 1, 0, '2016-01-20 12:28:25'),
(1094, 'Oracle Forms ', 1, 0, '2016-01-20 12:28:33'),
(1095, 'Oracle Financials Applications ', 1, 0, '2016-01-20 12:28:40'),
(1096, 'Oracle Enterprise Service Bus', 1, 0, '2016-01-20 12:28:49'),
(1097, 'Oracle Endeca ', 1, 0, '2016-01-20 12:28:57'),
(1098, 'Oracle E-Business Suite ', 1, 0, '2016-01-20 12:29:09'),
(1099, 'Oracle Demantra ', 1, 0, '2016-01-20 12:29:41'),
(1100, 'Oracle Database Administration ', 1, 0, '2016-01-20 12:30:06'),
(1101, 'Oracle database ', 1, 0, '2016-01-20 12:30:14'),
(1102, 'Oracle Data Guard ', 1, 0, '2016-01-20 12:30:22'),
(1103, 'Oracle CRM On Demand ', 1, 0, '2016-01-20 12:31:02'),
(1104, 'Oracle Complex Events Processing ', 1, 0, '2016-01-20 12:31:10'),
(1105, 'Oracle BRM ', 1, 0, '2016-01-20 12:31:21'),
(1106, 'Oracle ATG Web Commerce ', 1, 0, '2016-01-20 12:31:28'),
(1107, 'Oracle Application Server ', 1, 0, '2016-01-20 12:31:38'),
(1108, 'Oracle Application Framework ', 1, 0, '2016-01-20 12:31:46'),
(1109, 'Oracle APEX ', 1, 0, '2016-01-20 12:31:53'),
(1110, 'Oracle Agile ', 1, 0, '2016-01-20 12:32:00'),
(1111, 'Oracle Administration ', 1, 0, '2016-01-20 12:32:09'),
(1112, 'Optimizepress ', 1, 0, '2016-01-20 12:32:33'),
(1113, 'Optimizely ', 1, 0, '2016-01-20 12:32:40'),
(1114, 'Operations Research ', 1, 0, '2016-01-20 12:32:47'),
(1115, 'Operations Management ', 1, 0, '2016-01-20 12:32:55'),
(1116, 'Operating Systems Development ', 1, 0, '2016-01-20 12:33:02'),
(1117, 'OpenX ', 1, 0, '2016-01-20 12:33:14'),
(1118, 'OpenWrt ', 1, 0, '2016-01-20 12:34:31'),
(1119, 'OpenVZ ', 1, 0, '2016-01-20 12:34:39'),
(1120, 'OpenVPN ', 1, 0, '2016-01-20 12:34:47'),
(1121, 'OpenVMS ', 1, 0, '2016-01-20 12:34:54'),
(1122, 'OpenVBX ', 1, 0, '2016-01-20 12:35:01'),
(1123, 'OpenType ', 1, 0, '2016-01-20 12:35:08'),
(1124, 'OpenTok Development ', 1, 0, '2016-01-20 12:35:15'),
(1125, 'opentext ', 1, 0, '2016-01-20 12:35:23'),
(1126, 'openSUSE ', 1, 0, '2016-01-20 12:35:35'),
(1127, 'OpenStack ', 1, 0, '2016-01-20 12:35:54'),
(1128, 'OpenSocial ', 1, 0, '2016-01-20 12:36:01'),
(1129, 'OpenSIPS ', 1, 0, '2016-01-20 12:36:08'),
(1130, 'OpenLayers ', 1, 0, '2016-01-20 12:36:15'),
(1131, 'OpenGL ES ', 1, 0, '2016-01-20 12:36:23'),
(1132, 'OpenGL ', 1, 0, '2016-01-20 12:36:30'),
(1133, 'Openflow ', 1, 0, '2016-01-20 12:36:59'),
(1134, 'OpenERP Development ', 1, 0, '2016-01-20 12:37:05'),
(1135, 'OpenERP Administration ', 1, 0, '2016-01-20 12:37:11'),
(1136, 'openemm ', 1, 0, '2016-01-20 12:37:19'),
(1137, 'OpenCV ', 1, 0, '2016-01-20 12:37:27'),
(1138, 'OpenCL ', 1, 0, '2016-01-20 12:37:50'),
(1139, 'OpenCart ', 1, 0, '2016-01-20 12:38:02'),
(1140, 'OpenBSD ', 1, 0, '2016-01-20 12:38:08'),
(1141, 'OpenBravo PoS ', 1, 0, '2016-01-20 12:38:15'),
(1142, 'OpenACS ', 1, 0, '2016-01-20 12:38:21'),
(1143, 'OpenOffice ', 1, 0, '2016-01-20 12:38:30'),
(1144, 'ooVoo Development ', 1, 0, '2016-01-20 12:38:51'),
(1145, 'OOPS ', 1, 0, '2016-01-20 12:39:03'),
(1146, 'Object Oriented Programming (OOP) ', 1, 0, '2016-01-20 12:39:34'),
(1147, 'Online Writing ', 1, 0, '2016-01-20 12:39:41'),
(1148, 'Online Help ', 1, 0, '2016-01-20 12:39:48'),
(1149, 'Online Community Management ', 1, 0, '2016-01-20 12:39:55'),
(1150, 'On-Page Optimization ', 1, 0, '2016-01-20 12:40:01'),
(1151, 'OmniGraffle ', 1, 0, '2016-01-20 12:40:09'),
(1152, 'Online Transaction Processing (OLTP) ', 1, 0, '2016-01-20 12:40:18'),
(1153, 'OLE Automation ', 1, 0, '2016-01-20 12:40:25'),
(1154, 'OLAP ', 1, 0, '2016-01-20 12:40:32'),
(1155, 'Oil painting ', 1, 0, '2016-01-20 12:40:45'),
(1156, 'OGRE ', 1, 0, '2016-01-20 12:40:54'),
(1157, 'Office Administration ', 1, 0, '2016-01-20 12:41:01'),
(1158, 'Off-page Optimization ', 1, 0, '2016-01-20 12:41:08'),
(1159, 'Odoo ', 1, 0, '2016-01-20 12:41:18'),
(1160, 'odesk api ', 1, 0, '2016-01-20 12:41:27'),
(1161, 'ODBC ', 1, 0, '2016-01-20 12:41:35'),
(1162, 'OCX ', 1, 0, '2016-01-20 12:41:54'),
(1163, 'GNU Octave ', 1, 0, '2016-01-20 12:42:03'),
(1164, 'OCR Tesseract ', 1, 0, '2016-01-20 12:42:15'),
(1165, 'OCR algorithms ', 1, 0, '2016-01-20 12:42:22'),
(1166, 'Occupational Health ', 1, 0, '2016-01-20 12:42:36'),
(1167, 'OCaml ', 1, 0, '2016-01-20 12:42:44'),
(1168, 'Objective-J ', 1, 0, '2016-01-20 12:42:52'),
(1169, 'Objective-C ', 1, 0, '2016-01-20 12:43:01'),
(1170, 'Object Pascal ', 1, 0, '2016-01-20 12:43:09'),
(1171, 'Object Oriented PHP ', 1, 0, '2016-01-20 12:43:19'),
(1172, 'Object oriented design ', 1, 0, '2016-01-20 12:43:27'),
(1173, 'OAuth ', 1, 0, '2016-01-20 12:43:34'),
(1174, 'NVIDIA Mental Ray ', 1, 0, '2016-01-20 13:04:34'),
(1175, 'Nutrition ', 1, 0, '2016-01-20 13:04:41'),
(1176, 'Nursing ', 1, 0, '2016-01-20 13:04:48'),
(1177, 'NUKE ', 1, 0, '2016-01-20 13:04:58'),
(1178, 'Nuendo ', 1, 0, '2016-01-20 13:05:04'),
(1179, 'nservicebus ', 1, 0, '2016-01-20 13:05:11'),
(1180, 'Novell NetWare ', 1, 0, '2016-01-20 13:05:59'),
(1181, 'Notary public ', 1, 0, '2016-01-20 13:06:07'),
(1182, 'NoSQL ', 1, 0, '2016-01-20 13:06:14'),
(1183, 'Norwegian ', 1, 0, '2016-01-20 13:06:22'),
(1184, 'NopCommerce ', 1, 0, '2016-01-20 13:06:44'),
(1185, 'Non-linear editing system ', 1, 0, '2016-01-20 13:06:51'),
(1186, 'Non-Fiction Writing ', 1, 0, '2016-01-20 13:07:02'),
(1187, 'Non-disclosure Agreements ', 1, 0, '2016-01-20 13:07:10'),
(1188, 'Node.js ', 1, 0, '2016-01-20 13:07:18'),
(1189, 'Ning Marketing ', 1, 0, '2016-01-20 13:07:26'),
(1190, 'Ning Development ', 1, 0, '2016-01-20 13:07:33'),
(1191, 'NI Multisim ', 1, 0, '2016-01-20 13:07:43'),
(1192, 'NHibernate ', 1, 0, '2016-01-20 13:07:55'),
(1193, 'Nginx ', 1, 0, '2016-01-20 13:08:04'),
(1194, 'ngcore ', 1, 0, '2016-01-20 13:08:10'),
(1195, 'NFS Implementation ', 1, 0, '2016-01-20 13:08:16'),
(1196, 'NFS Administration ', 1, 0, '2016-01-20 13:08:23'),
(1197, 'Nextengine ', 1, 0, '2016-01-20 13:08:29'),
(1198, 'Next Limit RealFlow', 1, 0, '2016-01-20 13:09:21'),
(1199, 'Next Limit Maxwell Render ', 1, 0, '2016-01-20 13:09:28'),
(1200, 'Nexmo ', 1, 0, '2016-01-20 13:09:34'),
(1201, 'Newsletter Writing ', 1, 0, '2016-01-20 13:09:43'),
(1202, 'News Writing Style ', 1, 0, '2016-01-20 13:09:50'),
(1203, 'Neuro-linguistic programming ', 1, 0, '2016-01-20 13:09:58'),
(1204, 'Network Security ', 1, 0, '2016-01-20 13:10:08'),
(1205, 'Network Programming ', 1, 0, '2016-01-20 13:10:15'),
(1206, 'Network Planning ', 1, 0, '2016-01-20 13:10:23'),
(1207, 'Network Pentesting ', 1, 0, '2016-01-20 13:10:29'),
(1208, 'Network Monitoring ', 1, 0, '2016-01-20 13:10:37'),
(1209, 'Network Engineering ', 1, 0, '2016-01-20 13:10:44'),
(1210, 'Network Design ', 1, 0, '2016-01-20 13:10:54'),
(1211, 'Network Analysis ', 1, 0, '2016-01-20 13:11:01'),
(1212, 'Network Administration ', 1, 0, '2016-01-20 13:11:18'),
(1213, 'NetSuite Development ', 1, 0, '2016-01-20 13:11:26'),
(1214, 'NetSuite Administration ', 1, 0, '2016-01-20 13:11:33'),
(1215, 'Netfabb ', 1, 0, '2016-01-20 13:11:41'),
(1216, 'Netezza ', 1, 0, '2016-01-20 13:11:47'),
(1217, 'NetBSD ', 1, 0, '2016-01-20 13:11:54'),
(1218, 'NetBeans ', 1, 0, '2016-01-20 13:12:03'),
(1219, 'Neo4j ', 1, 0, '2016-01-20 13:12:11'),
(1220, 'Negotiation ', 1, 0, '2016-01-20 13:12:19'),
(1221, 'Navigation System Implementation ', 1, 0, '2016-01-20 13:12:26'),
(1222, 'Navigation System Design', 1, 0, '2016-01-20 13:12:36'),
(1223, 'Natural language processing ', 1, 0, '2016-01-20 13:12:46'),
(1224, 'Narration ', 1, 0, '2016-01-20 13:12:55'),
(1225, 'Nanotechnology ', 1, 0, '2016-01-20 13:13:01'),
(1226, 'Nagios ', 1, 0, '2016-01-20 13:13:08'),
(1227, 'n2cms ', 1, 0, '2016-01-20 13:13:15'),
(1228, 'MySQL Programming ', 1, 0, '2016-01-20 13:15:24'),
(1229, 'MySQL Administration ', 1, 0, '2016-01-20 13:15:31'),
(1230, 'Myspace Marketing ', 1, 0, '2016-01-20 13:15:37'),
(1231, 'MySpace API ', 1, 0, '2016-01-20 13:15:43'),
(1232, 'MYOB Administration ', 1, 0, '2016-01-20 13:15:50'),
(1233, 'MXML ', 1, 0, '2016-01-20 13:15:58'),
(1234, 'Model View ViewModel (MVVT) ', 1, 0, '2016-01-20 13:16:06'),
(1235, 'MVC Framework ', 1, 0, '2016-01-20 13:16:13'),
(1236, 'Music Producing ', 1, 0, '2016-01-20 13:16:28'),
(1237, 'Music engraving ', 1, 0, '2016-01-20 13:16:35'),
(1238, 'Music Dubbing ', 1, 0, '2016-01-20 13:16:43'),
(1239, 'Musical composition ', 1, 0, '2016-01-20 13:16:48'),
(1240, 'Music Arrangement ', 1, 0, '2016-01-20 13:16:55'),
(1241, 'Music', 1, 0, '2016-01-20 13:17:19'),
(1242, 'Murals ', 1, 0, '2016-01-20 13:17:28'),
(1243, 'Munin ', 1, 0, '2016-01-20 13:17:36'),
(1244, 'Multithreaded Programming ', 1, 0, '2016-01-20 13:17:44'),
(1245, 'Multi-touch Hardware Programming ', 1, 0, '2016-01-20 13:17:50'),
(1246, 'Multi-touch Hardware Development ', 1, 0, '2016-01-20 13:18:00'),
(1247, 'Multi Level Marketing (MLM) ', 1, 0, '2016-01-20 13:18:11'),
(1248, 'mtek ', 1, 0, '2016-01-20 13:18:19'),
(1249, 'Microsoft adCenter ', 1, 0, '2016-01-20 13:18:27'),
(1250, 'Microsoft Visual Studio LightSwitch ', 1, 0, '2016-01-20 13:18:33'),
(1251, 'MS Office 365 ', 1, 0, '2016-01-20 13:19:59'),
(1252, 'MS-DOS Administration ', 1, 0, '2016-01-20 13:20:05'),
(1253, 'Multi Router Traffic Grapher (MRTG) ', 1, 0, '2016-01-20 13:20:15'),
(1254, 'MQL 4', 1, 0, '2016-01-20 13:20:27'),
(1255, 'Multiprotocol Label Switching (MPLS) ', 1, 0, '2016-01-20 13:20:39'),
(1256, 'MPD ', 1, 0, '2016-01-20 13:20:48'),
(1257, 'Mozenda Scraper ', 1, 0, '2016-01-20 13:20:55'),
(1258, 'MovableType ', 1, 0, '2016-01-20 13:21:02'),
(1259, 'Motivational Speaking ', 1, 0, '2016-01-20 13:21:13'),
(1260, 'Motion graphics ', 1, 0, '2016-01-20 13:21:20'),
(1261, 'Microsoft Office SharePoint Server ', 1, 0, '2016-01-20 13:21:27'),
(1262, 'morae ', 1, 0, '2016-01-20 13:21:39'),
(1263, 'Mootools ', 1, 0, '2016-01-20 13:21:45'),
(1264, 'MoonScript ', 1, 0, '2016-01-20 13:21:53'),
(1265, 'Moonfruit SiteMaker ', 1, 0, '2016-01-20 13:22:00'),
(1266, 'Moodle ', 1, 0, '2016-01-20 13:22:07'),
(1267, 'Mono ', 1, 0, '2016-01-20 13:22:13'),
(1268, 'Mongrel ', 1, 0, '2016-01-20 13:22:20'),
(1269, 'MongoDB ', 1, 0, '2016-01-20 13:22:28'),
(1270, 'Molecule Editors ', 1, 0, '2016-01-20 13:22:34'),
(1271, 'MODx ', 1, 0, '2016-01-20 13:22:40'),
(1272, 'Modul8 ', 1, 0, '2016-01-20 13:22:47'),
(1273, 'Model Sheet Drawing ', 1, 0, '2016-01-20 13:22:54'),
(1274, 'Model Sheet Design ', 1, 0, '2016-01-20 13:23:05'),
(1275, 'Mockito ', 1, 0, '2016-01-20 13:23:15'),
(1276, 'Mocha ', 1, 0, '2016-01-20 13:23:22'),
(1277, 'Mobile UI Design ', 1, 0, '2016-01-20 13:23:31'),
(1278, 'Mobile Programming ', 1, 0, '2016-01-20 13:23:37'),
(1279, 'Mobile Development Framework ', 1, 0, '2016-01-20 13:23:47'),
(1280, 'Mobile App Testing ', 1, 0, '2016-01-20 13:23:53'),
(1281, 'Mobile App Development ', 1, 0, '2016-01-20 13:24:00'),
(1282, 'Mobile Advertising ', 1, 0, '2016-01-20 13:24:07'),
(1283, 'mobi ', 1, 0, '2016-01-20 13:24:23'),
(1284, 'MLS Consulting ', 1, 0, '2016-01-20 13:24:32'),
(1285, 'Mixpanel ', 1, 0, '2016-01-20 13:24:39'),
(1286, 'Miva Merchant ', 1, 0, '2016-01-20 13:24:51'),
(1287, 'Minitab ', 1, 0, '2016-01-20 13:24:58'),
(1288, 'Mining Engineering ', 1, 0, '2016-01-20 13:25:05'),
(1289, 'Minecraft ', 1, 0, '2016-01-20 13:25:25'),
(1290, 'MindTouch ', 1, 0, '2016-01-20 13:25:31'),
(1291, 'Mind Mapping ', 1, 0, '2016-01-20 13:25:38'),
(1292, 'Mikrotik RouterOS ', 1, 0, '2016-01-20 13:25:44'),
(1293, 'Mikrotik RouterBOARD ', 1, 0, '2016-01-20 13:25:51'),
(1294, 'MIDI ', 1, 0, '2016-01-20 13:25:58'),
(1295, 'MicroStrategy ', 1, 0, '2016-01-20 13:26:05'),
(1296, 'Microstock Photography ', 1, 0, '2016-01-20 13:26:11'),
(1297, 'Microstration v8 ', 1, 0, '2016-01-20 13:26:24'),
(1298, 'Microsoft Word ', 1, 0, '2016-01-20 13:26:34'),
(1299, 'Microsoft Windows Server ', 1, 0, '2016-01-20 13:26:48'),
(1300, 'Microsoft Windows Powershell ', 1, 0, '2016-01-20 13:26:54'),
(1301, 'Microsoft Visual Studio ', 1, 0, '2016-01-20 13:27:01'),
(1302, 'Microsoft Visual C++ ', 1, 0, '2016-01-20 13:27:45'),
(1303, 'Visual Basic ', 1, 0, '2016-01-20 13:27:57'),
(1304, 'Microsoft Visio ', 1, 0, '2016-01-20 13:28:06'),
(1305, 'Microsoft Virtual Server ', 1, 0, '2016-01-20 13:28:24'),
(1306, 'Microsoft Transaction Server (MTS) ', 1, 0, '2016-01-20 13:28:35'),
(1307, 'Microsoft SQL SSRS ', 1, 0, '2016-01-20 13:28:45'),
(1308, 'Microsoft SQL SSAS ', 1, 0, '2016-01-20 13:28:52'),
(1309, 'Microsoft SQL Server Service Broker ', 1, 0, '2016-01-20 13:29:03'),
(1310, 'Microsoft SQL Server Notification Services ', 1, 0, '2016-01-20 13:29:09'),
(1311, 'Microsoft SQL Server Programming ', 1, 0, '2016-01-20 13:29:16'),
(1312, 'Microsoft SQL Server Administration ', 1, 0, '2016-01-20 13:29:26'),
(1313, 'Microsoft SQL CE ', 1, 0, '2016-01-20 13:29:36'),
(1314, 'Microsoft Small Business Server Administration ', 1, 0, '2016-01-20 13:30:16'),
(1315, 'Microsoft Silverlight ', 1, 0, '2016-01-20 13:30:25'),
(1316, 'Microsoft SharePoint Development ', 1, 0, '2016-01-20 13:30:35'),
(1317, 'Microsoft SharePoint Administration ', 1, 0, '2016-01-20 13:30:42'),
(1318, 'Microsoft Server ', 1, 0, '2016-01-20 13:30:50'),
(1319, 'Microsoft SCVMM ', 1, 0, '2016-01-20 13:30:57'),
(1320, 'Microsoft SCCM ', 1, 0, '2016-01-20 13:31:09'),
(1321, 'Microsoft Publisher ', 1, 0, '2016-01-20 13:31:18'),
(1322, 'Microsoft Project ', 1, 0, '2016-01-20 13:31:32'),
(1323, 'Microsoft PowerPoint ', 1, 0, '2016-01-20 13:31:43'),
(1324, 'Microsoft Outlook Development ', 1, 0, '2016-01-20 13:31:50'),
(1325, 'Microsoft Outlook ', 1, 0, '2016-01-20 13:31:59'),
(1326, 'Microsoft OneNote ', 1, 0, '2016-01-20 13:32:07'),
(1327, 'Microsoft Office ', 1, 0, '2016-01-20 13:32:17'),
(1328, 'Microsoft Message Queue Server (MMSQ) ', 1, 0, '2016-01-20 13:32:31'),
(1329, 'Microsoft MapPoint ', 1, 0, '2016-01-20 13:32:40'),
(1330, 'Microsoft Lync Server ', 1, 0, '2016-01-20 13:32:51'),
(1331, 'Microsoft Kinect Development ', 1, 0, '2016-01-20 13:32:58'),
(1332, 'Microsoft Infopath ', 1, 0, '2016-01-20 13:33:06'),
(1333, 'Microsoft Hyper-V Server ', 1, 0, '2016-01-20 13:33:16'),
(1334, 'Microsoft Hyper V ', 1, 0, '2016-01-20 13:33:28'),
(1335, 'Microsoft Dynamics GP ', 1, 0, '2016-01-20 13:34:09'),
(1336, 'Microsoft Expression Studio ', 1, 0, '2016-01-20 13:34:16'),
(1337, 'Microsoft Exchange Server ', 1, 0, '2016-01-20 13:34:26'),
(1338, 'Microsoft Excel PowerPivot ', 1, 0, '2016-01-20 13:34:33'),
(1339, 'Microsoft Excel ', 1, 0, '2016-01-20 13:34:47'),
(1340, 'Microsoft Entity Framework ', 1, 0, '2016-01-20 13:34:58'),
(1341, 'Microsoft Dynamics ERP ', 1, 0, '2016-01-20 13:35:08'),
(1342, 'Microsoft Dynamics Development ', 1, 0, '2016-01-20 13:35:15'),
(1343, 'Microsoft Dynamics CRM ', 1, 0, '2016-01-20 13:35:24'),
(1344, 'Microsoft Dynamics Administration ', 1, 0, '2016-01-20 13:35:32'),
(1345, 'Windows Media Connect ', 1, 0, '2016-01-20 13:36:57'),
(1346, 'Microsoft Commerce Server ', 1, 0, '2016-01-20 13:37:28'),
(1347, 'Microsoft Certified Information Technology Professional (MCITP) ', 1, 0, '2016-01-20 13:37:40'),
(1348, 'Microsoft Business Intelligence Studio ', 1, 0, '2016-01-20 13:37:47'),
(1349, 'Microsoft Active Directory ', 1, 0, '2016-01-20 13:38:01'),
(1350, 'Microsoft Access Programming ', 1, 0, '2016-01-20 13:38:09'),
(1351, 'Microsoft Access Administration ', 1, 0, '2016-01-20 13:38:14'),
(1352, 'Microcontroller Programming ', 1, 0, '2016-01-20 13:44:29'),
(1353, 'Microcontroller Design ', 1, 0, '2016-01-20 13:44:37'),
(1354, 'Microsoft Foundation Classes (MFC) ', 1, 0, '2016-01-20 13:44:45'),
(1355, 'Methods Engineering ', 1, 0, '2016-01-20 13:44:54'),
(1356, 'Meteor ', 1, 0, '2016-01-20 13:45:02'),
(1357, 'MetaTrader 4 (MT4) ', 1, 0, '2016-01-20 13:45:12'),
(1358, 'Merise ', 1, 0, '2016-01-20 13:45:23'),
(1359, 'Mercurial ', 1, 0, '2016-01-20 13:45:31'),
(1360, 'MerchantRun GlobalLink ', 1, 0, '2016-01-20 13:45:38'),
(1361, 'MerchantRun ', 1, 0, '2016-01-20 13:45:48'),
(1362, 'Menu Design ', 1, 0, '2016-01-20 13:45:55'),
(1363, 'Memcached ', 1, 0, '2016-01-20 13:46:02'),
(1364, 'Meego Development ', 1, 0, '2016-01-20 13:46:09'),
(1365, 'Medical Writing ', 1, 0, '2016-01-20 13:46:17'),
(1366, 'Medical Translation ', 1, 0, '2016-01-20 13:46:24'),
(1367, 'Medical transcription ', 1, 0, '2016-01-20 13:46:33'),
(1368, 'Medical Records Research ', 1, 0, '2016-01-20 13:48:13'),
(1369, 'Medical Law ', 1, 0, '2016-01-20 13:48:25'),
(1370, 'Medical Informatics ', 1, 0, '2016-01-20 13:48:33'),
(1371, 'Medical Imaging ', 1, 0, '2016-01-20 13:48:41'),
(1372, 'Medical Illustration ', 1, 0, '2016-01-20 13:48:52'),
(1373, 'Medical Billing and Coding ', 1, 0, '2016-01-20 13:49:03'),
(1374, 'MediaWiki ', 1, 0, '2016-01-20 13:49:10'),
(1375, 'Media relations ', 1, 0, '2016-01-20 13:49:17'),
(1376, 'Media buying ', 1, 0, '2016-01-20 13:49:24'),
(1377, 'Mechatronics ', 1, 0, '2016-01-20 13:49:32'),
(1378, 'Mechanical Engineering ', 1, 0, '2016-01-20 13:49:39'),
(1379, 'Mechanical Design ', 1, 0, '2016-01-20 13:50:09'),
(1380, 'MCP ', 1, 0, '2016-01-20 13:50:21'),
(1381, 'Multi-Criteria Decision Analysis ', 1, 0, '2016-01-20 13:50:29'),
(1382, 'McAfee VirusScan ', 1, 0, '2016-01-20 13:50:38'),
(1383, 'McAfee SAAS ', 1, 0, '2016-01-20 13:50:49'),
(1384, 'McAfee ePolicy Orchestrator ', 1, 0, '2016-01-20 13:50:56'),
(1385, 'Maxon Cinema 4D ', 1, 0, '2016-01-20 13:51:04'),
(1386, 'Maxon BodyPaint 3D ', 1, 0, '2016-01-20 13:51:17'),
(1387, 'Max ', 1, 0, '2016-01-20 13:51:26'),
(1388, 'Apache Maven ', 1, 0, '2016-01-20 13:51:34'),
(1389, 'MATLAB', 1, 0, '2016-01-20 13:51:57'),
(1390, 'Mathematics ', 1, 0, '2016-01-20 13:52:50'),
(1391, 'Mathematica ', 1, 0, '2016-01-20 13:53:35'),
(1392, 'MathCad ', 1, 0, '2016-01-20 13:53:44'),
(1393, 'Materials Engineering ', 1, 0, '2016-01-20 13:53:58'),
(1394, 'Mastercam ', 1, 0, '2016-01-20 13:54:08'),
(1395, 'Master Production Schedule ', 1, 0, '2016-01-20 13:54:17'),
(1396, 'Martial Arts ', 1, 0, '2016-01-20 13:54:42'),
(1397, 'Marriage Counseling ', 1, 0, '2016-01-20 13:54:51'),
(1398, 'Marketo ', 1, 0, '2016-01-20 13:55:01'),
(1399, 'Marketing strategy ', 1, 0, '2016-01-20 13:55:12'),
(1400, 'Marketing Cloud Marketing ', 1, 0, '2016-01-20 13:56:19'),
(1401, 'Marketing Cloud Development ', 1, 0, '2016-01-20 13:56:31'),
(1402, 'Marketing Cloud Administration ', 1, 0, '2016-01-20 13:56:50'),
(1403, 'Marketing Automation ', 1, 0, '2016-01-20 13:57:00'),
(1404, 'Market research ', 1, 0, '2016-01-20 13:57:12'),
(1405, 'Marathi ', 1, 0, '2016-01-20 13:57:29'),
(1406, 'MapReduce ', 1, 0, '2016-01-20 13:59:03'),
(1407, 'Mapr ', 1, 0, '2016-01-20 13:59:22'),
(1408, 'Maple ', 1, 0, '2016-01-20 13:59:32'),
(1409, 'Mapinfo ', 1, 0, '2016-01-20 13:59:43'),
(1410, 'MAPI ', 1, 0, '2016-01-20 13:59:55'),
(1411, 'Manufacturing Design ', 1, 0, '2016-01-20 14:00:13'),
(1412, 'Manufacturing ', 1, 0, '2016-01-20 14:00:44'),
(1413, 'Manual Test Execution ', 1, 0, '2016-01-20 14:01:32'),
(1414, 'Mantis ', 1, 0, '2016-01-20 14:02:43'),
(1415, 'Manga ', 1, 0, '2016-01-20 14:03:00'),
(1416, 'Mandarin ', 1, 0, '2016-01-20 14:03:10'),
(1417, 'Management Skills ', 1, 0, '2016-01-20 14:03:23'),
(1418, 'Management Development ', 1, 0, '2016-01-20 14:03:38'),
(1419, 'Management Consulting ', 1, 0, '2016-01-20 14:04:30'),
(1420, 'ManageEngine ', 1, 0, '2016-01-20 14:04:47'),
(1421, 'Mambo ', 1, 0, '2016-01-20 14:04:59'),
(1422, 'Malware ', 1, 0, '2016-01-20 14:05:11'),
(1423, 'Malayalam ', 1, 0, '2016-01-20 14:05:23'),
(1424, 'Malay ', 1, 0, '2016-01-20 14:05:37'),
(1425, 'Makerbot ', 1, 0, '2016-01-20 14:05:50'),
(1426, 'Make Build Script ', 1, 0, '2016-01-20 14:06:13'),
(1427, 'MailEnable ', 1, 0, '2016-01-20 14:06:26'),
(1428, 'mailchimp ', 1, 0, '2016-01-20 14:06:43'),
(1429, 'Mail Server Implementation ', 1, 0, '2016-01-20 14:06:54'),
(1430, 'Mail Merge ', 1, 0, '2016-01-20 14:07:46'),
(1431, 'Magic Tricks ', 1, 0, '2016-01-20 14:08:00'),
(1432, 'Magic Bullet Looks ', 1, 0, '2016-01-20 14:08:09'),
(1433, 'Magic Bullet Colorista ', 1, 0, '2016-01-20 14:08:29'),
(1434, 'Magento ', 1, 0, '2016-01-20 14:08:46'),
(1435, 'Magazine Layout ', 1, 0, '2016-01-20 14:09:02'),
(1436, 'Maemo ', 1, 0, '2016-01-20 14:09:21'),
(1437, 'MadCap Software ', 1, 0, '2016-01-20 14:09:37'),
(1438, 'Machine learning ', 1, 0, '2016-01-20 14:09:48'),
(1439, 'Machine Design ', 1, 0, '2016-01-20 14:10:09'),
(1440, 'Macedonian ', 1, 0, '2016-01-20 14:11:10'),
(1441, 'Macaw ', 1, 0, '2016-01-20 14:11:30'),
(1442, 'Mac OSX Administration ', 1, 0, '2016-01-20 14:11:53'),
(1443, 'Mac OS App Development ', 1, 0, '2016-01-20 14:12:05'),
(1444, 'm0n0wall ', 1, 0, '2016-01-20 14:12:15'),
(1445, 'Lyrics Writing ', 1, 0, '2016-01-20 14:12:40'),
(1446, 'Lucene Search ', 1, 0, '2016-01-20 14:12:50'),
(1447, 'Lua ', 1, 0, '2016-01-20 14:13:00'),
(1448, 'Loyalty Marketing ', 1, 0, '2016-01-20 14:13:12'),
(1449, 'Lotus Notes ', 1, 0, '2016-01-20 14:13:26'),
(1450, 'IBM Lotus Domino ', 1, 0, '2016-01-20 14:13:51'),
(1451, 'Lotus Approach ', 1, 0, '2016-01-20 14:14:01'),
(1452, 'Logo Design ', 1, 0, '2016-01-20 14:14:13'),
(1453, 'LogMeIn Rescue ', 1, 0, '2016-01-20 14:14:27'),
(1454, 'LogMeIn Hamachi ', 1, 0, '2016-01-20 14:15:57'),
(1455, 'LogiXML ', 1, 0, '2016-01-20 14:16:08'),
(1456, 'Logistics & Shipping ', 1, 0, '2016-01-20 14:16:23'),
(1457, 'Logic Pro ', 1, 0, '2016-01-20 14:16:57'),
(1458, 'Log4j ', 1, 0, '2016-01-20 14:17:07'),
(1459, 'Localization ', 1, 0, '2016-01-20 14:17:28'),
(1460, 'LoadRunner ', 1, 0, '2016-01-20 14:17:46'),
(1461, 'Load testing ', 1, 0, '2016-01-20 14:18:05'),
(1462, 'Load Balancing ', 1, 0, '2016-01-20 14:18:18'),
(1463, 'Learning Management System (LMS) ', 1, 0, '2016-01-20 14:18:36'),
(1464, 'LivePerson ', 1, 0, '2016-01-20 14:18:54'),
(1465, 'Live Chat Software ', 1, 0, '2016-01-20 14:19:11'),
(1466, 'Live Chat Operator ', 1, 0, '2016-01-20 14:19:22'),
(1467, 'Litigation ', 1, 0, '2016-01-20 14:19:38'),
(1468, 'Lithuanian ', 1, 0, '2016-01-20 14:19:52'),
(1469, 'Lithium Framework ', 1, 0, '2016-01-20 14:20:02'),
(1470, 'Literature Review ', 1, 0, '2016-01-20 14:20:53'),
(1471, 'Lisp ', 1, 0, '2016-01-20 14:21:03'),
(1472, 'LiquidPlanner ', 1, 0, '2016-01-20 14:21:22'),
(1473, 'Linux System Administration ', 1, 0, '2016-01-20 14:21:35'),
(1474, 'Slackware Linux ', 1, 0, '2016-01-20 14:21:44'),
(1475, 'linq to sql ', 1, 0, '2016-01-20 14:21:52'),
(1476, 'linq to entities ', 1, 0, '2016-01-20 14:22:00'),
(1477, 'LINQ ', 1, 0, '2016-01-20 14:22:11'),
(1478, 'Linkvana ', 1, 0, '2016-01-20 14:22:20'),
(1479, 'LinkedIn Recruiting ', 1, 0, '2016-01-20 14:23:35'),
(1480, 'LinkedIn Development ', 1, 0, '2016-01-20 14:23:53'),
(1481, 'Link Wheel ', 1, 0, '2016-01-20 14:24:02'),
(1482, 'Link Building ', 1, 0, '2016-01-20 14:24:13'),
(1483, 'Linguistics ', 1, 0, '2016-01-20 14:24:29'),
(1484, 'lingo ', 1, 0, '2016-01-20 14:24:42'),
(1485, 'Linear Programming ', 1, 0, '2016-01-20 14:24:59'),
(1486, 'LimeSurvey ', 1, 0, '2016-01-20 14:25:08'),
(1487, 'LimeJS ', 1, 0, '2016-01-20 14:25:17'),
(1488, 'Lightworks ', 1, 0, '2016-01-20 14:25:25'),
(1489, 'Lightwave 3d ', 1, 0, '2016-01-20 14:25:35'),
(1490, 'Lighttpd ', 1, 0, '2016-01-20 14:25:45'),
(1491, 'Lighting Design ', 1, 0, '2016-01-20 14:25:55'),
(1492, 'Liferay ', 1, 0, '2016-01-20 14:26:03'),
(1493, 'Licensing ', 1, 0, '2016-01-20 14:26:12'),
(1494, 'LibreOffice ', 1, 0, '2016-01-20 14:26:20'),
(1495, 'libGDX ', 1, 0, '2016-01-20 14:26:29'),
(1496, 'libcurl ', 1, 0, '2016-01-20 14:26:37'),
(1497, 'LexisNexis Practice Advisor ', 1, 0, '2016-01-20 14:26:45'),
(1498, 'LexisNexis Accurint ', 1, 0, '2016-01-20 14:26:55'),
(1499, 'Level Design ', 1, 0, '2016-01-20 14:27:03'),
(1500, 'Lettering ', 1, 0, '2016-01-20 14:27:25'),
(1501, 'Letter Writing ', 1, 0, '2016-01-20 14:27:36'),
(1502, 'Lesson Plan Writing ', 1, 0, '2016-01-20 14:27:46'),
(1503, 'LESS ', 1, 0, '2016-01-20 14:27:59'),
(1504, 'Leptonica ', 1, 0, '2016-01-20 14:28:11'),
(1505, 'LemonStand ', 1, 0, '2016-01-20 14:28:20'),
(1506, 'Legal writing ', 1, 0, '2016-01-20 14:28:31'),
(1507, 'Legal Translation ', 1, 0, '2016-01-20 14:28:50'),
(1508, 'Legal Transcription ', 1, 0, '2016-01-20 14:29:04'),
(1509, 'Legal research ', 1, 0, '2016-01-20 14:29:17'),
(1510, 'Legal Consulting ', 1, 0, '2016-01-20 14:30:08'),
(1511, 'Lectora ', 1, 0, '2016-01-20 14:30:32'),
(1512, 'Lean Consulting ', 1, 0, '2016-01-20 14:30:52'),
(1513, 'Lead generation ', 1, 0, '2016-01-20 14:31:02'),
(1514, 'LDAP ', 1, 0, '2016-01-20 14:31:11'),
(1515, 'Latvian ', 1, 0, '2016-01-20 14:31:22'),
(1516, 'LaTeX ', 1, 0, '2016-01-20 14:35:36'),
(1517, 'Lasso ', 1, 0, '2016-01-20 14:35:48'),
(1518, 'laser engraving ', 1, 0, '2016-01-20 14:36:04'),
(1519, 'Laravel Framework ', 1, 0, '2016-01-20 14:36:13'),
(1520, 'Filipino - Visayan Dialect ', 1, 0, '2016-01-20 14:36:21'),
(1521, 'Landscape design ', 1, 0, '2016-01-20 14:36:29'),
(1522, 'Landing Pages ', 1, 0, '2016-01-20 14:36:49'),
(1523, 'LANDesk ', 1, 0, '2016-01-20 14:37:07'),
(1524, 'LAN Implementation ', 1, 0, '2016-01-20 14:37:14'),
(1525, 'LAN Administration ', 1, 0, '2016-01-20 14:37:30'),
(1526, 'LAMP Administration ', 1, 0, '2016-01-20 14:37:39'),
(1527, 'LabWindows/CVI ', 1, 0, '2016-01-20 14:37:47'),
(1528, 'LabVIEW ', 1, 0, '2016-01-20 14:37:58'),
(1529, 'Label and Package Design ', 1, 0, '2016-01-20 14:38:14'),
(1530, 'Kyrgyz ', 1, 0, '2016-01-20 14:40:05'),
(1531, 'KVM Virtualization ', 1, 0, '2016-01-20 14:40:18'),
(1532, 'KVM Switches ', 1, 0, '2016-01-20 14:40:47'),
(1533, 'KVM ', 1, 0, '2016-01-20 14:41:00'),
(1534, 'Korn shell ', 1, 0, '2016-01-20 14:41:14'),
(1535, 'Korean ', 1, 0, '2016-01-20 14:41:24'),
(1536, 'Kohana ', 1, 0, '2016-01-20 14:41:33'),
(1537, 'KnockoutJS ', 1, 0, '2016-01-20 14:41:41'),
(1538, 'KiXtart ', 1, 0, '2016-01-20 14:41:49'),
(1539, 'KitchenDraw ', 1, 0, '2016-01-20 14:42:00'),
(1540, 'KISSMetrics ', 1, 0, '2016-01-20 14:42:09'),
(1541, 'Kindle Fire Apps ', 1, 0, '2016-01-20 14:42:18'),
(1542, 'Kindle Fire ', 1, 0, '2016-01-20 14:42:27'),
(1543, 'Kindle App Development ', 1, 0, '2016-01-20 14:42:35'),
(1544, 'Kickstarter Marketing ', 1, 0, '2016-01-20 14:42:45'),
(1545, 'Keynote ', 1, 0, '2016-01-20 14:42:53'),
(1546, 'Keyboarding ', 1, 0, '2016-01-20 14:44:42'),
(1547, 'Key/Value Stores ', 1, 0, '2016-01-20 14:44:54'),
(1548, 'Kernel ', 1, 0, '2016-01-20 14:45:03'),
(1549, 'Kerkythea ', 1, 0, '2016-01-20 14:45:18'),
(1550, 'Kerberos ', 1, 0, '2016-01-20 14:45:30'),
(1551, 'Kentico CMS ', 1, 0, '2016-01-20 14:45:42'),
(1552, 'Kendo UI ', 1, 0, '2016-01-20 14:45:53'),
(1553, 'Kannada ', 1, 0, '2016-01-20 14:46:02'),
(1554, 'Kaltura ', 1, 0, '2016-01-20 14:46:14'),
(1555, 'Kajabi ', 1, 0, '2016-01-20 14:46:19'),
(1556, 'Kaizen ', 1, 0, '2016-01-20 14:46:27'),
(1557, 'Junos ', 1, 0, '2016-01-20 14:46:37'),
(1558, 'JUnit ', 1, 0, '2016-01-20 14:46:54'),
(1559, 'Juniper Routers ', 1, 0, '2016-01-20 14:47:02'),
(1560, 'JSTL ', 1, 0, '2016-01-20 14:47:11'),
(1561, 'JSP ', 1, 0, '2016-01-20 14:47:19'),
(1562, 'json ', 1, 0, '2016-01-20 14:47:29'),
(1563, 'Jsharp ', 1, 0, '2016-01-20 14:47:37'),
(1564, 'JavaServer Faces (JSF) ', 1, 0, '2016-01-20 14:47:45'),
(1565, 'JQuery Mobile ', 1, 0, '2016-01-20 14:47:53'),
(1566, 'jQuery ', 1, 0, '2016-01-20 14:48:02'),
(1567, 'JPA ', 1, 0, '2016-01-20 14:48:11'),
(1568, 'Joomla Migration ', 1, 0, '2016-01-20 14:53:08'),
(1569, 'Joomla Fabrik ', 1, 0, '2016-01-20 14:53:42'),
(1570, 'Joomla! ', 1, 0, '2016-01-20 14:53:52'),
(1571, 'JOnAS ', 1, 0, '2016-01-20 14:53:59'),
(1572, 'JomSocial Development ', 1, 0, '2016-01-20 14:54:06'),
(1573, 'Job Description Writing ', 1, 0, '2016-01-20 14:54:14'),
(1574, 'Job Definition Format (JDF) ', 1, 0, '2016-01-20 14:54:22'),
(1575, 'Job Costing ', 1, 0, '2016-01-20 14:54:30'),
(1576, 'JNDI ', 1, 0, '2016-01-20 14:54:43'),
(1577, 'JNCIA-Junos ', 1, 0, '2016-01-20 14:54:53'),
(1578, 'JMS ', 1, 0, '2016-01-20 14:55:01'),
(1579, 'JMeter ', 1, 0, '2016-01-20 14:55:08'),
(1580, 'Jinja2 ', 1, 0, '2016-01-20 14:55:15'),
(1581, 'Jingle Program Production ', 1, 0, '2016-01-20 14:55:24'),
(1582, 'Jimdo ', 1, 0, '2016-01-20 14:55:31'),
(1583, 'Jig and Fixture Design ', 1, 0, '2016-01-20 14:55:39'),
(1584, 'JFC ', 1, 0, '2016-01-20 14:55:47'),
(1585, 'Jewish Theology ', 1, 0, '2016-01-20 14:55:55'),
(1586, 'Jewelry Design ', 1, 0, '2016-01-20 14:56:11'),
(1587, 'JetPack ', 1, 0, '2016-01-20 14:56:20'),
(1588, 'Jenkins ', 1, 0, '2016-01-20 14:56:27'),
(1589, 'JDeveloper ', 1, 0, '2016-01-20 14:56:35'),
(1590, 'JDBC ', 1, 0, '2016-01-20 14:56:42'),
(1591, 'Oracle JD Edwards EnterpriseOne ', 1, 0, '2016-01-20 14:56:59'),
(1592, 'JCL ', 1, 0, '2016-01-20 14:57:09'),
(1593, 'JBPM ', 1, 0, '2016-01-20 14:57:15'),
(1594, 'JBoss Seam ', 1, 0, '2016-01-20 14:57:24'),
(1595, 'JBoss ', 1, 0, '2016-01-20 14:57:32'),
(1596, 'JAXB ', 1, 0, '2016-01-20 14:57:40'),
(1597, 'JavaScript ', 1, 0, '2016-01-20 14:57:48'),
(1598, 'Javanese ', 1, 0, '2016-01-20 14:58:05'),
(1599, 'JavaFX ', 1, 0, '2016-01-20 14:58:14'),
(1600, 'Java Servlets Development ', 1, 0, '2016-01-20 14:58:24'),
(1601, 'Java ME ', 1, 0, '2016-01-20 14:58:39'),
(1602, 'Java EE ', 1, 0, '2016-01-20 14:58:47'),
(1603, 'Java ', 1, 0, '2016-01-20 14:58:54'),
(1604, 'JasperReports ', 1, 0, '2016-01-20 14:59:03'),
(1605, 'Japanese ', 1, 0, '2016-01-20 14:59:11'),
(1606, 'J2SE ', 1, 0, '2016-01-20 14:59:20'),
(1607, 'J2ME ', 1, 0, '2016-01-20 14:59:28'),
(1608, 'J2EE ', 1, 0, '2016-01-20 14:59:36'),
(1609, 'IT Service Management ', 1, 0, '2016-01-20 18:45:33'),
(1610, 'ITK ', 1, 0, '2016-01-20 18:45:43'),
(1611, 'ITIL ', 1, 0, '2016-01-20 18:45:50'),
(1612, 'iTextSharp ', 1, 0, '2016-01-20 18:45:57'),
(1613, 'Italian ', 1, 0, '2016-01-20 18:46:06'),
(1614, 'IT Management ', 1, 0, '2016-01-20 18:46:15'),
(1615, 'Issue Tracking Systems ', 1, 0, '2016-01-20 18:47:56'),
(1616, 'ISO 9001 ', 1, 0, '2016-01-20 18:48:07'),
(1617, 'ISO 9000 ', 1, 0, '2016-01-20 18:48:16'),
(1618, 'Islamic theology ', 1, 0, '2016-01-20 18:48:23'),
(1619, 'Islamic Banking ', 1, 0, '2016-01-20 18:48:31'),
(1620, 'ISEB ', 1, 0, '2016-01-20 18:48:38'),
(1621, 'ISA Server ', 1, 0, '2016-01-20 18:48:49'),
(1622, 'IRM Income Tax Audits ', 1, 0, '2016-01-20 18:48:57'),
(1623, 'IronPython ', 1, 0, '2016-01-20 18:49:30'),
(1624, 'ireport ', 1, 0, '2016-01-20 18:49:38'),
(1625, 'IRC Server Administration ', 1, 0, '2016-01-20 18:49:46'),
(1626, 'Iptables ', 1, 0, '2016-01-20 18:50:01'),
(1627, 'IPsec ', 1, 0, '2016-01-20 18:50:10'),
(1628, 'IPMI ', 1, 0, '2016-01-20 18:50:36'),
(1629, 'iPhone UI Design ', 1, 0, '2016-01-20 18:50:44'),
(1630, 'iPhone App Development ', 1, 0, '2016-01-20 18:50:51'),
(1631, 'iPad UI Design ', 1, 0, '2016-01-20 18:51:05'),
(1632, 'iPad App Development ', 1, 0, '2016-01-20 18:51:13'),
(1633, 'iOS Development ', 1, 0, '2016-01-20 18:51:20'),
(1634, 'Ionic Framework ', 1, 0, '2016-01-20 18:51:28'),
(1635, 'Invoicing ', 1, 0, '2016-01-20 18:51:36'),
(1636, 'Invitation Design ', 1, 0, '2016-01-20 18:51:45'),
(1637, 'Investment Research ', 1, 0, '2016-01-20 18:51:53'),
(1638, 'Investigative Reporting ', 1, 0, '2016-01-20 18:52:01'),
(1639, 'Inventory Management ', 1, 0, '2016-01-20 18:52:11'),
(1640, 'Intuit Quicken ', 1, 0, '2016-01-20 18:52:21'),
(1641, 'Intuit QuickBooks ', 1, 0, '2016-01-20 18:52:30'),
(1642, 'Intuit Lacerte Tax ', 1, 0, '2016-01-20 18:52:44'),
(1643, 'Intranet Implementation ', 1, 0, '2016-01-20 18:52:51'),
(1644, 'Intranet Architecture ', 1, 0, '2016-01-20 18:54:06'),
(1645, 'Interviewing ', 1, 0, '2016-01-20 18:54:14'),
(1646, 'Intersystems Cache ', 1, 0, '2016-01-20 18:54:21'),
(1647, 'interspire ', 1, 0, '2016-01-20 18:54:28'),
(1648, 'Interprise Suite ERP ', 1, 0, '2016-01-20 18:54:37'),
(1649, 'internet surveys ', 1, 0, '2016-01-20 18:54:49'),
(1650, 'Internet Security ', 1, 0, '2016-01-20 18:55:06'),
(1651, 'Internet research ', 1, 0, '2016-01-20 18:55:22'),
(1652, 'Internet Marketing ', 1, 0, '2016-01-20 18:55:29'),
(1653, 'International taxation ', 1, 0, '2016-01-20 18:55:37'),
(1654, 'International Law ', 1, 0, '2016-01-20 18:55:58'),
(1655, 'Internal Auditing ', 1, 0, '2016-01-20 18:56:06'),
(1656, 'Interior design ', 1, 0, '2016-01-20 18:56:26'),
(1657, 'InterBase ', 1, 0, '2016-01-20 18:56:34'),
(1658, 'Interactive Voice Response ', 1, 0, '2016-01-20 18:56:44'),
(1659, 'Interaction design ', 1, 0, '2016-01-20 18:56:55'),
(1660, 'IntelliJ IDEA ', 1, 0, '2016-01-20 18:57:03'),
(1661, 'IntelliCred ', 1, 0, '2016-01-20 18:57:11'),
(1662, 'Intellectual Property Law ', 1, 0, '2016-01-20 18:57:21'),
(1663, 'Integrated Circuits ', 1, 0, '2016-01-20 18:57:31'),
(1664, 'Insurance Consulting ', 1, 0, '2016-01-20 18:57:40'),
(1665, 'Instrumentation ', 1, 0, '2016-01-20 18:58:04'),
(1666, 'Instructional design ', 1, 0, '2016-01-20 18:58:25'),
(1667, 'InstallShield ', 1, 0, '2016-01-20 18:58:35'),
(1668, 'Installer Development ', 1, 0, '2016-01-20 18:58:44'),
(1669, 'Instagram Marketing ', 1, 0, '2016-01-20 18:58:52'),
(1670, 'Instagram API ', 1, 0, '2016-01-20 18:59:03'),
(1671, 'Inno Setup ', 1, 0, '2016-01-20 18:59:12'),
(1672, 'Inkscape ', 1, 0, '2016-01-20 18:59:21'),
(1673, 'ingress filtering ', 1, 0, '2016-01-20 18:59:29'),
(1674, 'Ingress ', 1, 0, '2016-01-20 18:59:38'),
(1675, 'InfusionSoft Marketing ', 1, 0, '2016-01-20 18:59:50'),
(1676, 'Infusionsoft Development ', 1, 0, '2016-01-20 18:59:59'),
(1677, 'Infusionsoft Administration ', 1, 0, '2016-01-20 19:00:07'),
(1678, 'Infragistics ', 1, 0, '2016-01-20 19:00:18'),
(1679, 'Informix Programming ', 1, 0, '2016-01-20 19:00:27'),
(1680, 'Informix Administration ', 1, 0, '2016-01-20 19:00:45'),
(1681, 'informatique ', 1, 0, '2016-01-20 19:01:00'),
(1682, 'Information Security ', 1, 0, '2016-01-20 19:01:08'),
(1683, 'Information Management ', 1, 0, '2016-01-20 19:01:22'),
(1684, 'Information design ', 1, 0, '2016-01-20 19:01:31'),
(1685, 'Information Builders WebFOCUS ', 1, 0, '2016-01-20 19:02:31'),
(1686, 'Information Architecture ', 1, 0, '2016-01-20 19:02:40'),
(1687, 'Informatica ', 1, 0, '2016-01-20 19:02:53'),
(1688, 'Infographics ', 1, 0, '2016-01-20 19:03:01'),
(1689, 'Industrial Engineering ', 1, 0, '2016-01-20 19:03:21'),
(1690, 'Industrial design ', 1, 0, '2016-01-20 19:03:31'),
(1691, 'Indonesian ', 1, 0, '2016-01-20 19:03:52'),
(1692, 'Indexing ', 1, 0, '2016-01-20 19:04:01'),
(1693, 'Inbound marketing ', 1, 0, '2016-01-20 19:06:03'),
(1694, 'In-Game Advertising ', 1, 0, '2016-01-20 19:06:12'),
(1695, 'IMS ', 1, 0, '2016-01-20 19:06:21'),
(1696, 'Immigration Law ', 1, 0, '2016-01-20 19:06:30'),
(1697, 'Imaging ', 1, 0, '2016-01-20 19:06:42'),
(1698, 'Image Processing', 1, 0, '2016-01-20 19:06:58'),
(1699, 'Image Editing ', 1, 0, '2016-01-20 19:07:07'),
(1700, 'IMacros', 1, 0, '2016-01-20 19:07:30'),
(1701, 'Illustration', 1, 0, '2016-01-20 19:07:40'),
(1702, 'Internet Information Services (IIS) ', 1, 0, '2016-01-20 19:07:50'),
(1703, 'ifbyphone API Development ', 1, 0, '2016-01-20 19:11:57'),
(1704, 'ifbyphone Administration ', 1, 0, '2016-01-20 19:12:08'),
(1705, 'IDRISI ', 1, 0, '2016-01-20 19:12:16'),
(1706, 'IdeaBlade DevForce ', 1, 0, '2016-01-20 19:12:31'),
(1707, 'IContact ', 1, 0, '2016-01-20 19:12:39'),
(1708, 'Icon Design ', 1, 0, '2016-01-20 19:12:47'),
(1709, 'IClone ', 1, 0, '2016-01-20 19:12:55'),
(1710, 'Icefaces ', 1, 0, '2016-01-20 19:13:02'),
(1711, 'ICD Coding ', 1, 0, '2016-01-20 19:13:29'),
(1712, 'IBM z/VM Administration ', 1, 0, '2016-01-20 19:13:35'),
(1713, 'IBM System x ', 1, 0, '2016-01-20 19:14:57'),
(1714, 'IBM WebSphere ', 1, 0, '2016-01-20 19:15:55'),
(1715, 'IBM Watson ', 1, 0, '2016-01-20 20:12:17'),
(1716, 'IBM Tivoli Framework ', 1, 0, '2016-01-20 20:12:36'),
(1717, 'IBM System Storage ', 1, 0, '2016-01-20 20:13:46'),
(1718, 'IBM SPSS ', 1, 0, '2016-01-20 20:13:55'),
(1719, 'IBM SmartCloud ', 1, 0, '2016-01-20 20:14:02'),
(1720, 'IBM SameTime ', 1, 0, '2016-01-20 20:14:15'),
(1721, 'IBM System p ', 1, 0, '2016-01-20 20:15:20'),
(1722, 'IBM PowerPC Programming ', 1, 0, '2016-01-20 20:15:27'),
(1723, 'IBM Lotus Symphony ', 1, 0, '2016-01-20 20:15:34'),
(1724, 'IBM Lotus Notes Traveler ', 1, 0, '2016-01-20 20:15:41'),
(1725, 'IBM DB2 Programming ', 1, 0, '2016-01-20 20:15:48'),
(1726, 'IBM DB2 Administration ', 1, 0, '2016-01-20 20:15:55'),
(1727, 'IBATIS ', 1, 0, '2016-01-20 20:16:07'),
(1728, 'Hypnosis ', 1, 0, '2016-01-20 20:16:23'),
(1729, 'Hybris ', 1, 0, '2016-01-20 20:16:38'),
(1730, 'Hardware Prototyping ', 1, 0, '2016-01-20 20:16:47'),
(1731, 'HVAC System Design ', 1, 0, '2016-01-20 20:16:53'),
(1732, 'Hungarian ', 1, 0, '2016-01-20 20:17:04'),
(1733, 'Humor Writing ', 1, 0, '2016-01-20 20:17:12'),
(1734, 'Human Sciences ', 1, 0, '2016-01-20 20:17:19'),
(1735, 'Human Resource Management ', 1, 0, '2016-01-20 20:17:34'),
(1736, 'HubSpot ', 1, 0, '2016-01-20 20:17:47'),
(1737, 'HTML5 ', 1, 0, '2016-01-20 20:17:54'),
(1738, 'HTML ', 1, 0, '2016-01-20 20:18:03'),
(1739, 'HRM ', 1, 0, '2016-01-20 20:18:11'),
(1740, 'Human Resource Information Systems ', 1, 0, '2016-01-20 20:18:18'),
(1741, 'HR Benefits ', 1, 0, '2016-01-20 20:18:25'),
(1742, 'HP-UX Administration ', 1, 0, '2016-01-20 20:18:33'),
(1743, 'HP-UX ', 1, 0, '2016-01-20 20:18:47'),
(1744, 'HP Quality Center ', 1, 0, '2016-01-20 20:18:56'),
(1745, 'HP QuickTest Professional (HPQTP) ', 1, 0, '2016-01-20 20:19:06'),
(1746, 'HP Network Management Center (HPNMC) ', 1, 0, '2016-01-20 20:19:16'),
(1747, 'HP Cloud ', 1, 0, '2016-01-20 20:19:26'),
(1748, 'Houdini ', 1, 0, '2016-01-20 20:19:33'),
(1749, 'HotDog ', 1, 0, '2016-01-20 20:19:40'),
(1750, 'Hospitality ', 1, 0, '2016-01-20 20:19:46'),
(1751, 'HootSuite ', 1, 0, '2016-01-20 20:19:53'),
(1752, 'Home Design ', 1, 0, '2016-01-20 20:20:02'),
(1753, 'Home Automation ', 1, 0, '2016-01-20 20:20:16'),
(1754, 'History ', 1, 0, '2016-01-20 20:20:23'),
(1755, 'Hindi ', 1, 0, '2016-01-20 20:20:31'),
(1756, 'Highcharts ', 1, 0, '2016-01-20 20:20:38'),
(1757, 'Hibernate ', 1, 0, '2016-01-20 20:20:47'),
(1758, 'hi5 ', 1, 0, '2016-01-20 20:20:58'),
(1759, 'Heroku ', 1, 0, '2016-01-20 20:21:10'),
(1760, 'Helpdesk ', 1, 0, '2016-01-20 20:21:18'),
(1761, 'Hebrew ', 1, 0, '2016-01-20 20:21:26'),
(1762, 'Health Level 7 ', 1, 0, '2016-01-20 20:21:35'),
(1763, 'headus UVLayout ', 1, 0, '2016-01-20 20:21:48'),
(1764, 'HBase ', 1, 0, '2016-01-20 20:22:00'),
(1765, 'HaXe ', 1, 0, '2016-01-20 20:22:08'),
(1766, 'Haitian Creole ', 1, 0, '2016-01-20 20:22:19'),
(1767, 'Haskell ', 1, 0, '2016-01-20 20:22:27'),
(1768, 'Hardware Troubleshooting ', 1, 0, '2016-01-20 20:22:34'),
(1769, 'haproxy ', 1, 0, '2016-01-20 20:22:42'),
(1770, 'HAML ', 1, 0, '2016-01-20 20:22:49'),
(1771, 'Hadoop ', 1, 0, '2016-01-20 20:23:01'),
(1772, 'Fuzzing ', 1, 0, '2016-01-20 20:23:18'),
(1773, 'Fusebox ', 1, 0, '2016-01-20 20:23:26'),
(1774, 'Fundraising ', 1, 0, '2016-01-20 20:23:34'),
(1775, 'Functional testing ', 1, 0, '2016-01-20 20:23:41'),
(1776, 'Full-text Search Engines ', 1, 0, '2016-01-20 20:23:49'),
(1777, 'fuel cms ', 1, 0, '2016-01-20 20:23:56'),
(1778, 'FTP ', 1, 0, '2016-01-20 20:24:21'),
(1779, 'Microsoft FrontPage ', 1, 0, '2016-01-20 20:24:36'),
(1780, 'Frontend Development ', 1, 0, '2016-01-20 20:24:44'),
(1781, 'Friendster ', 1, 0, '2016-01-20 20:24:54'),
(1782, 'French ', 1, 0, '2016-01-20 20:25:02'),
(1783, 'Freeswitch ', 1, 0, '2016-01-20 20:25:10'),
(1784, 'FreePBX ', 1, 0, '2016-01-20 20:25:26'),
(1785, 'FreeMarker ', 1, 0, '2016-01-20 20:25:34'),
(1786, 'Freelance Marketing ', 1, 0, '2016-01-20 20:25:41'),
(1787, 'FreeBSD ', 1, 0, '2016-01-20 20:25:54'),
(1788, 'Fraud Mitigation ', 1, 0, '2016-01-20 20:26:01'),
(1789, 'Fraud Analysis ', 1, 0, '2016-01-20 20:26:09'),
(1790, 'Franchise Consulting ', 1, 0, '2016-01-20 20:26:17'),
(1791, 'Field-Programmable Gate Array (FPGA) ', 1, 0, '2016-01-20 20:26:29'),
(1792, 'FoxPro Programming ', 1, 0, '2016-01-20 20:26:36'),
(1793, 'FoxPro Administration ', 1, 0, '2016-01-20 20:26:46'),
(1794, 'FourSquare Development ', 1, 0, '2016-01-20 20:26:54'),
(1795, 'Forum Posting ', 1, 0, '2016-01-20 20:27:06'),
(1796, 'Forum Moderation ', 1, 0, '2016-01-20 20:27:15'),
(1797, 'Forum Development ', 1, 0, '2016-01-20 20:27:23'),
(1798, 'Fortran ', 1, 0, '2016-01-20 20:27:37'),
(1799, 'Format & Layout ', 1, 0, '2016-01-20 20:27:47'),
(1800, 'Form-Z ', 1, 0, '2016-01-20 20:28:01'),
(1801, 'Foreign Exchange Trading ', 1, 0, '2016-01-20 20:28:09'),
(1802, 'FontForge ', 1, 0, '2016-01-20 20:28:16'),
(1803, 'Font Development ', 1, 0, '2016-01-20 20:28:24'),
(1804, 'Flyer Design ', 1, 0, '2016-01-20 20:28:36'),
(1805, 'Flowcharts ', 1, 0, '2016-01-20 20:28:43'),
(1806, 'Flask ', 1, 0, '2016-01-20 20:28:51'),
(1807, 'Flash 3D ', 1, 0, '2016-01-20 20:29:00'),
(1808, 'FL Studio ', 1, 0, '2016-01-20 20:29:08'),
(1809, 'Five9 ', 1, 0, '2016-01-20 20:29:16'),
(1810, 'First aid ', 1, 0, '2016-01-20 20:29:24'),
(1811, 'Firewall ', 1, 0, '2016-01-20 20:29:32'),
(1812, 'Firefox Plugin Development ', 1, 0, '2016-01-20 20:29:43'),
(1813, 'Firebird ', 1, 0, '2016-01-20 20:29:50'),
(1814, 'Fire Protection Engineering ', 1, 0, '2016-01-20 20:29:56'),
(1815, 'Fire OS Development ', 1, 0, '2016-01-20 20:30:04'),
(1816, 'Finnish ', 1, 0, '2016-01-20 20:30:12'),
(1817, 'Finite Element Analysis ', 1, 0, '2016-01-20 20:30:19'),
(1818, 'Financial Writing ', 1, 0, '2016-01-20 20:30:28'),
(1819, 'Financial Reporting ', 1, 0, '2016-01-20 20:30:37'),
(1820, 'Financial Prospectus Writing ', 1, 0, '2016-01-20 20:30:46'),
(1821, 'Financial modeling ', 1, 0, '2016-01-20 20:31:00'),
(1822, 'Financial Management ', 1, 0, '2016-01-20 20:31:12'),
(1823, 'Financial Forecasting ', 1, 0, '2016-01-20 20:31:26'),
(1824, 'Financial analysis ', 1, 0, '2016-01-20 20:31:34'),
(1825, 'Financial Accounting ', 1, 0, '2016-01-20 20:31:43'),
(1826, 'Finale ', 1, 0, '2016-01-20 20:31:51'),
(1827, 'Final Draft ', 1, 0, '2016-01-20 20:32:05'),
(1828, 'Final Cut Pro X ', 1, 0, '2016-01-20 20:32:12'),
(1829, 'Final Cut Pro ', 1, 0, '2016-01-20 20:32:21'),
(1830, 'Film Production ', 1, 0, '2016-01-20 20:32:28'),
(1831, 'Film Dubbing ', 1, 0, '2016-01-20 20:32:35'),
(1832, 'Film Direction ', 1, 0, '2016-01-20 20:32:44'),
(1833, 'Film criticism ', 1, 0, '2016-01-20 20:32:52'),
(1834, 'Filipino ', 1, 0, '2016-01-20 20:33:02'),
(1835, 'Filing ', 1, 0, '2016-01-20 20:33:10'),
(1836, 'FileMaker ', 1, 0, '2016-01-20 20:33:17'),
(1837, 'Field-Map ', 1, 0, '2016-01-20 20:33:25'),
(1838, 'Fiction Writing ', 1, 0, '2016-01-20 20:33:32'),
(1839, 'Fiber Optics ', 1, 0, '2016-01-20 20:33:40'),
(1840, 'FFmpeg ', 1, 0, '2016-01-20 20:33:51'),
(1841, 'Fetchmail ', 1, 0, '2016-01-20 20:34:00'),
(1842, 'Fedora ', 1, 0, '2016-01-20 20:36:21'),
(1843, 'Federal Acquisition Regulations ', 1, 0, '2016-01-20 20:36:29'),
(1844, 'Feature Writing ', 1, 0, '2016-01-20 20:36:37'),
(1845, 'FBML ', 1, 0, '2016-01-20 20:36:46'),
(1846, 'Facebook Javascript (FBJS) ', 1, 0, '2016-01-20 20:37:02');
INSERT INTO `skills` (`id`, `name`, `active`, `delete_remove`, `date_added`) VALUES
(1847, 'Fax ', 1, 0, '2016-01-20 20:37:09'),
(1848, 'Fashion Modeling ', 1, 0, '2016-01-20 20:37:16'),
(1849, 'Fashion design ', 1, 0, '2016-01-20 20:37:24'),
(1850, 'Family Law ', 1, 0, '2016-01-20 20:37:31'),
(1851, 'Fact Checking ', 1, 0, '2016-01-20 20:37:42'),
(1852, 'Facelets ', 1, 0, '2016-01-20 20:37:50'),
(1853, 'Facebook Marketing ', 1, 0, '2016-01-20 20:37:57'),
(1854, 'facebook games development ', 1, 0, '2016-01-20 20:38:08'),
(1855, 'Facebook Development ', 1, 0, '2016-01-20 20:38:16'),
(1856, 'FAAC ', 1, 0, '2016-01-20 20:38:23'),
(1857, 'F# ', 1, 0, '2016-01-20 20:38:56'),
(1858, 'eZ Publish ', 1, 0, '2016-01-20 20:39:06'),
(1859, 'Eyeon Fusion ', 1, 0, '2016-01-20 20:55:16'),
(1860, 'Ext JS ', 1, 0, '2016-01-20 20:55:25'),
(1861, 'Expression Engine ', 1, 0, '2016-01-20 20:55:33'),
(1862, 'Express Scribe ', 1, 0, '2016-01-20 20:55:40'),
(1863, 'Exim ', 1, 0, '2016-01-20 20:55:48'),
(1864, 'Excel VBA ', 1, 0, '2016-01-20 20:55:55'),
(1865, 'ExactTarget ', 1, 0, '2016-01-20 20:56:02'),
(1866, 'evolus pencil ', 1, 0, '2016-01-20 20:56:10'),
(1867, 'EViews ', 1, 0, '2016-01-20 20:56:18'),
(1868, 'Event planning ', 1, 0, '2016-01-20 20:56:25'),
(1869, 'Event Management ', 1, 0, '2016-01-20 20:56:33'),
(1870, 'Eucalyptus Cloud ', 1, 0, '2016-01-20 20:56:43'),
(1871, 'Etsy Administration ', 1, 0, '2016-01-20 20:56:51'),
(1872, '\"Extract, Transform and Load (ETL)\" ', 1, 0, '2016-01-20 20:57:01'),
(1873, 'ETABS ', 1, 0, '2016-01-20 20:57:09'),
(1874, 'Essbase ', 1, 0, '2016-01-20 20:57:16'),
(1875, 'Essay Writing ', 1, 0, '2016-01-20 20:57:23'),
(1876, 'ESL Teaching ', 1, 0, '2016-01-20 20:57:36'),
(1877, 'Erwin ', 1, 0, '2016-01-20 20:57:43'),
(1878, 'Enterprise Resource Planning (ERP) ', 1, 0, '2016-01-20 20:57:52'),
(1879, 'Erotica Writing ', 1, 0, '2016-01-20 20:58:01'),
(1880, 'Erlang ', 1, 0, '2016-01-20 20:58:08'),
(1881, 'ERDAS IMAGINE ', 1, 0, '2016-01-20 20:59:57'),
(1882, 'Environmental science ', 1, 0, '2016-01-20 21:00:05'),
(1883, 'Environmental Law ', 1, 0, '2016-01-20 21:00:23'),
(1884, 'Entrepreneurship ', 1, 0, '2016-01-20 21:00:31'),
(1885, 'Entity Framework ', 1, 0, '2016-01-20 21:00:39'),
(1886, 'ADO.NET Entity Framework ', 1, 0, '2016-01-20 21:00:48'),
(1887, 'english tutoring ', 1, 0, '2016-01-20 21:01:01'),
(1888, 'English Spelling ', 1, 0, '2016-01-20 21:01:09'),
(1889, 'English Punctuation ', 1, 0, '2016-01-20 21:01:17'),
(1890, 'English Proofreading ', 1, 0, '2016-01-20 21:01:25'),
(1891, 'English Grammar ', 1, 0, '2016-01-20 21:01:34'),
(1892, 'English ', 1, 0, '2016-01-20 21:01:45'),
(1893, 'Engineering drawing ', 1, 0, '2016-01-20 21:01:53'),
(1894, 'Engineering Design ', 1, 0, '2016-01-20 21:02:00'),
(1895, 'Energy Engineering ', 1, 0, '2016-01-20 21:02:09'),
(1896, 'Employment Law ', 1, 0, '2016-01-20 21:02:20'),
(1897, 'EMC Symmetrix ', 1, 0, '2016-01-20 21:02:35'),
(1898, 'embroidery digitization ', 1, 0, '2016-01-20 21:02:51'),
(1899, 'Embroidery ', 1, 0, '2016-01-20 21:02:59'),
(1900, 'Ember.js ', 1, 0, '2016-01-20 21:03:11'),
(1901, 'Embedded Systems ', 1, 0, '2016-01-20 21:03:18'),
(1902, 'Embedded Linux ', 1, 0, '2016-01-20 21:03:30'),
(1903, 'Embedded C ', 1, 0, '2016-01-20 21:03:41'),
(1904, 'Email Technical Support ', 1, 0, '2016-01-20 21:03:49'),
(1905, 'Email Marketing ', 1, 0, '2016-01-20 21:03:57'),
(1906, 'Email Handling ', 1, 0, '2016-01-20 21:04:06'),
(1907, 'Email Etiquette ', 1, 0, '2016-01-20 21:04:15'),
(1908, 'Email Deliverability ', 1, 0, '2016-01-20 21:04:29'),
(1909, 'Eloqua ', 1, 0, '2016-01-20 21:04:37'),
(1910, 'Elliptic Curve Cryptography (ECC) ', 1, 0, '2016-01-20 21:04:48'),
(1911, 'Elgg ', 1, 0, '2016-01-20 21:04:56'),
(1912, 'Electronics ', 1, 0, '2016-01-20 21:05:04'),
(1913, 'Electronic Workbench ', 1, 0, '2016-01-20 21:05:12'),
(1914, 'Electronic funds transfer ', 1, 0, '2016-01-20 21:05:19'),
(1915, 'Electronic Design ', 1, 0, '2016-01-20 21:05:27'),
(1916, 'Electrical engineering ', 1, 0, '2016-01-20 21:05:35'),
(1917, 'Electrical Drawing ', 1, 0, '2016-01-20 21:05:44'),
(1918, 'Elastix ', 1, 0, '2016-01-20 21:05:52'),
(1919, 'Elasticsearch ', 1, 0, '2016-01-20 21:06:00'),
(1920, 'Elance ', 1, 0, '2016-01-20 21:06:19'),
(1921, 'Ektron ', 1, 0, '2016-01-20 21:06:29'),
(1922, 'Ekiga ', 1, 0, '2016-01-20 21:06:38'),
(1923, 'Enterprise JavaBeans (EJB) ', 1, 0, '2016-01-20 21:06:47'),
(1924, 'Edufire ', 1, 0, '2016-01-20 21:06:55'),
(1925, 'Education Technology ', 1, 0, '2016-01-20 21:07:04'),
(1926, 'Edius ', 1, 0, '2016-01-20 21:08:30'),
(1927, 'Editorial Writing ', 1, 0, '2016-01-20 21:08:43'),
(1928, 'Editing ', 1, 0, '2016-01-20 21:08:52'),
(1929, 'Electronic data interchange (EDI) ', 1, 0, '2016-01-20 21:09:04'),
(1930, 'EDGE ', 1, 0, '2016-01-20 21:09:14'),
(1931, 'Economics ', 1, 0, '2016-01-20 21:09:23'),
(1932, 'Economic Analysis ', 1, 0, '2016-01-20 21:09:33'),
(1933, 'Econometrics ', 1, 0, '2016-01-20 21:09:41'),
(1934, 'Ecommerce Platform Development ', 1, 0, '2016-01-20 21:09:49'),
(1935, 'ECMAScript ', 1, 0, '2016-01-20 21:09:58'),
(1936, 'Eclipse ', 1, 0, '2016-01-20 21:10:11'),
(1937, 'eBooks ', 1, 0, '2016-01-20 21:10:19'),
(1938, 'ebook Writing ', 1, 0, '2016-01-20 21:10:26'),
(1939, 'eBook Design ', 1, 0, '2016-01-20 21:10:34'),
(1940, 'eBay Web Services ', 1, 0, '2016-01-20 21:10:42'),
(1941, 'eBay Motors ', 1, 0, '2016-01-20 21:10:51'),
(1942, 'eBay Marketing ', 1, 0, '2016-01-20 21:10:59'),
(1943, 'eBay Listing/Writing ', 1, 0, '2016-01-20 21:11:07'),
(1944, 'eBay API ', 1, 0, '2016-01-20 21:11:17'),
(1945, 'Eagle ', 1, 0, '2016-01-20 21:11:28'),
(1946, 'E4X ', 1, 0, '2016-01-20 21:11:42'),
(1947, 'ePub ', 1, 0, '2016-01-20 21:11:52'),
(1948, 'eLearning ', 1, 0, '2016-01-20 21:12:02'),
(1949, 'EHealth ', 1, 0, '2016-01-20 21:12:11'),
(1950, 'Dwolla API ', 1, 0, '2016-01-20 21:12:25'),
(1951, 'DVD Studio Pro ', 1, 0, '2016-01-20 21:12:32'),
(1952, 'dvd mastering ', 1, 0, '2016-01-20 21:12:40'),
(1953, 'Dutch ', 1, 0, '2016-01-20 21:12:49'),
(1954, 'Dundas Chart Controls ', 1, 0, '2016-01-20 21:14:17'),
(1955, 'DTS ', 1, 0, '2016-01-20 21:14:25'),
(1956, 'DSL Troubleshooting ', 1, 0, '2016-01-20 21:14:32'),
(1957, 'Drupal ', 1, 0, '2016-01-20 21:14:41'),
(1958, 'Drums ', 1, 0, '2016-01-20 21:14:50'),
(1959, 'Dropbox API ', 1, 0, '2016-01-20 21:14:58'),
(1960, 'Drop Shipping ', 1, 0, '2016-01-20 21:15:11'),
(1961, 'Drones ', 1, 0, '2016-01-20 21:15:20'),
(1962, 'Driving ', 1, 0, '2016-01-20 21:15:29'),
(1963, 'Device Driver Development ', 1, 0, '2016-01-20 21:15:41'),
(1964, 'Drawing ', 1, 0, '2016-01-20 21:16:32'),
(1965, 'Drafting ', 1, 0, '2016-01-20 21:16:42'),
(1966, 'DotNetNuke ', 1, 0, '2016-01-20 21:16:53'),
(1967, 'DOS ', 1, 0, '2016-01-20 21:17:02'),
(1968, 'Domain Migration ', 1, 0, '2016-01-20 21:17:10'),
(1969, 'Dojo Toolkit ', 1, 0, '2016-01-20 21:17:18'),
(1970, 'Document review ', 1, 0, '2016-01-20 21:17:27'),
(1971, 'Document Object Model ', 1, 0, '2016-01-20 21:17:35'),
(1972, 'Document Conversion ', 1, 0, '2016-01-20 21:17:44'),
(1973, 'Document Control ', 1, 0, '2016-01-20 21:20:50'),
(1974, 'Doctrine ORM ', 1, 0, '2016-01-20 21:20:57'),
(1975, 'Docker ', 1, 0, '2016-01-20 21:21:11'),
(1976, 'DocBook ', 1, 0, '2016-01-20 21:21:22'),
(1977, 'DNSsec ', 1, 0, '2016-01-20 21:21:30'),
(1978, 'DNS ', 1, 0, '2016-01-20 21:21:39'),
(1979, 'dmaic ', 1, 0, '2016-01-20 21:21:46'),
(1980, 'Django ', 1, 0, '2016-01-20 21:21:54'),
(1981, 'DJing ', 1, 0, '2016-01-20 21:22:01'),
(1982, 'Distributed computing ', 1, 0, '2016-01-20 21:22:08'),
(1983, 'Distance Education ', 1, 0, '2016-01-20 21:22:18'),
(1984, 'Display Ads ', 1, 0, '2016-01-20 21:22:27'),
(1985, 'Disaster recovery ', 1, 0, '2016-01-20 21:22:35'),
(1986, 'DirectX ', 1, 0, '2016-01-20 21:22:47'),
(1987, 'DirectShow ', 1, 0, '2016-01-20 21:22:54'),
(1988, 'Directory Submission ', 1, 0, '2016-01-20 21:23:02'),
(1989, 'Direct marketing ', 1, 0, '2016-01-20 21:23:10'),
(1990, 'Dinamica Ego ', 1, 0, '2016-01-20 21:23:17'),
(1991, 'Dimdim Development ', 1, 0, '2016-01-20 21:23:25'),
(1992, 'Digital Signal Processing ', 1, 0, '2016-01-20 21:23:35'),
(1993, 'Digital Sculpting ', 1, 0, '2016-01-20 21:23:43'),
(1994, 'Digital scrapbooking ', 1, 0, '2016-01-20 21:23:52'),
(1995, 'Digital Photography ', 1, 0, '2016-01-20 21:24:00'),
(1996, 'Digital painting ', 1, 0, '2016-01-20 21:24:09'),
(1997, 'Digital Ocean ', 1, 0, '2016-01-20 21:24:19'),
(1998, 'Digital Mapping ', 1, 0, '2016-01-20 21:24:30'),
(1999, 'Digital Engineering ', 1, 0, '2016-01-20 21:24:42'),
(2000, 'Digital Electronics ', 1, 0, '2016-01-20 21:24:49'),
(2001, 'Digital Access Pass ', 1, 0, '2016-01-20 21:25:10'),
(2002, 'Diffbot ', 1, 0, '2016-01-20 21:25:19'),
(2003, 'Dietetics ', 1, 0, '2016-01-20 21:25:28'),
(2004, 'Dialux ', 1, 0, '2016-01-20 21:25:37'),
(2005, 'DHTML ', 1, 0, '2016-01-20 21:25:46'),
(2006, 'DHCP ', 1, 0, '2016-01-20 21:27:10'),
(2007, 'DevOps ', 1, 0, '2016-01-20 21:27:26'),
(2008, 'DevExpress ', 1, 0, '2016-01-20 21:27:40'),
(2009, 'DevExpress Reporting ', 1, 0, '2016-01-20 21:27:49'),
(2010, 'Desktop Support ', 1, 0, '2016-01-20 21:27:57'),
(2011, 'Desktop Publishing ', 1, 0, '2016-01-20 21:28:05'),
(2012, 'Desktop Applications ', 1, 0, '2016-01-20 21:28:13'),
(2013, 'Desk.com Development ', 1, 0, '2016-01-20 21:28:23'),
(2014, 'Desk.com Administration ', 1, 0, '2016-01-20 21:28:30'),
(2015, 'Derivatives ', 1, 0, '2016-01-20 21:28:38'),
(2016, 'Dental Technology ', 1, 0, '2016-01-20 21:28:46'),
(2017, 'Demandware ', 1, 0, '2016-01-20 21:28:53'),
(2018, 'Delphi ', 1, 0, '2016-01-20 21:29:01'),
(2019, 'DELFTship ', 1, 0, '2016-01-20 21:29:10'),
(2020, 'Deja Vu ', 1, 0, '2016-01-20 21:29:20'),
(2021, 'Defect Tracking ', 1, 0, '2016-01-20 21:29:28'),
(2022, 'Debian OS ', 1, 0, '2016-01-20 21:29:37'),
(2023, 'DCOM ', 1, 0, '2016-01-20 21:29:45'),
(2024, 'DBMS ', 1, 0, '2016-01-20 21:29:52'),
(2025, 'dBase Programming ', 1, 0, '2016-01-20 21:30:04'),
(2026, 'dBase Administration ', 1, 0, '2016-01-20 21:30:11'),
(2027, 'IBM InfoSphere DataStage ', 1, 0, '2016-01-20 21:30:19'),
(2028, 'DataLife Engine ', 1, 0, '2016-01-20 21:30:27'),
(2029, 'Database testing ', 1, 0, '2016-01-20 21:30:35'),
(2030, 'database programming ', 1, 0, '2016-01-20 21:30:43'),
(2031, 'Database Modeling ', 1, 0, '2016-01-20 21:30:50'),
(2032, 'database management ', 1, 0, '2016-01-20 21:31:00'),
(2033, 'Database design ', 1, 0, '2016-01-20 21:31:12'),
(2034, 'Database Cataloguing ', 1, 0, '2016-01-20 21:31:23'),
(2035, 'Database Caching ', 1, 0, '2016-01-20 21:31:33'),
(2036, 'Database Administration ', 1, 0, '2016-01-20 21:31:41'),
(2037, 'Data Warehousing ', 1, 0, '2016-01-20 21:32:02'),
(2038, 'Data Visualization ', 1, 0, '2016-01-20 21:32:10'),
(2039, 'Data Sufficiency ', 1, 0, '2016-01-20 21:32:19'),
(2040, 'Data Structures ', 1, 0, '2016-01-20 21:32:27'),
(2041, 'Data Sheet Writing ', 1, 0, '2016-01-20 21:32:35'),
(2042, 'Data scraping ', 1, 0, '2016-01-20 21:32:44'),
(2043, 'Data Science ', 1, 0, '2016-01-20 21:32:52'),
(2044, 'Data Recovery ', 1, 0, '2016-01-20 21:33:01'),
(2045, 'Data Protection ', 1, 0, '2016-01-20 21:33:12'),
(2046, 'Data Modeling ', 1, 0, '2016-01-20 21:33:21'),
(2047, 'Data mining ', 1, 0, '2016-01-20 21:33:29'),
(2048, 'Data Logistics ', 1, 0, '2016-01-20 21:33:37'),
(2049, 'Data Interpretation ', 1, 0, '2016-01-20 21:33:45'),
(2050, 'Data Ingestion ', 1, 0, '2016-01-20 21:33:58'),
(2051, 'Data Entry ', 1, 0, '2016-01-20 21:34:06'),
(2052, 'Data Engineering ', 1, 0, '2016-01-20 21:34:14'),
(2053, 'Data Encoding ', 1, 0, '2016-01-20 21:34:22'),
(2054, 'Data Cleansing ', 1, 0, '2016-01-20 21:34:30'),
(2055, 'Data Center Operations ', 1, 0, '2016-01-20 21:36:33'),
(2056, 'Data Backup ', 1, 0, '2016-01-20 21:36:42'),
(2057, 'Data Analytics ', 1, 0, '2016-01-20 21:36:51'),
(2058, 'DART ', 1, 0, '2016-01-20 21:36:59'),
(2059, 'Danish ', 1, 0, '2016-01-20 21:37:40'),
(2060, 'Dancing ', 1, 0, '2016-01-20 21:37:48'),
(2061, 'DaVinci Resolve ', 1, 0, '2016-01-20 21:37:55'),
(2062, 'd3.js ', 1, 0, '2016-01-20 21:38:04'),
(2063, 'D Programming Language ', 1, 0, '2016-01-20 21:38:16'),
(2064, 'Czech ', 1, 0, '2016-01-20 21:38:23'),
(2065, 'CVS ', 1, 0, '2016-01-20 21:38:31'),
(2066, 'Customer support ', 1, 0, '2016-01-20 21:38:39'),
(2067, 'Customer service ', 1, 0, '2016-01-20 21:38:47'),
(2068, 'Custom CMS ', 1, 0, '2016-01-20 21:38:55'),
(2069, 'Curriculum Development ', 1, 0, '2016-01-20 21:39:02'),
(2070, 'CURL ', 1, 0, '2016-01-20 21:39:10'),
(2071, 'CUDA ', 1, 0, '2016-01-20 21:39:19'),
(2072, 'Cucumber ', 1, 0, '2016-01-20 21:39:26'),
(2073, 'Cubecart ', 1, 0, '2016-01-20 21:39:37'),
(2074, 'CSU/DSU ', 1, 0, '2016-01-20 21:39:46'),
(2075, 'CSS3 ', 1, 0, '2016-01-20 21:39:53'),
(2076, 'CSS', 1, 0, '2016-01-20 21:40:02'),
(2077, 'CS-Cart ', 1, 0, '2016-01-20 21:40:23'),
(2078, 'SAP Crystal Reports ', 1, 0, '2016-01-20 21:41:09'),
(2079, 'Cryptography ', 1, 0, '2016-01-20 21:42:11'),
(2080, 'Crowdfunding ', 1, 0, '2016-01-20 21:43:34'),
(2081, 'Croatian ', 1, 0, '2016-01-20 21:43:42'),
(2082, 'CRM ', 1, 0, '2016-01-20 21:43:54'),
(2083, 'Criminal Law ', 1, 0, '2016-01-20 21:44:01'),
(2084, 'CRE Loaded ', 1, 0, '2016-01-20 21:44:09'),
(2085, 'Creative writing ', 1, 0, '2016-01-20 21:44:17'),
(2086, 'Creative & Talent ', 1, 0, '2016-01-20 21:44:28'),
(2087, 'Web Crawling ', 1, 0, '2016-01-20 21:44:36'),
(2088, 'CPU Design ', 1, 0, '2016-01-20 21:44:46'),
(2089, 'CppUnit ', 1, 0, '2016-01-20 21:44:55'),
(2090, 'CPanel ', 1, 0, '2016-01-20 21:45:02'),
(2091, 'Covers & Packaging ', 1, 0, '2016-01-20 21:45:10'),
(2092, 'Cover Letter Writing ', 1, 0, '2016-01-20 21:45:19'),
(2093, 'Cover Design ', 1, 0, '2016-01-20 21:45:30'),
(2094, 'Counseling Psychology ', 1, 0, '2016-01-20 21:45:37'),
(2095, 'CouchDB ', 1, 0, '2016-01-20 21:45:44'),
(2096, 'Cost accounting ', 1, 0, '2016-01-20 21:45:56'),
(2097, 'Cosmos OS ', 1, 0, '2016-01-20 21:46:03'),
(2098, 'COSMO-RS Chemical Engineering ', 1, 0, '2016-01-20 21:46:11'),
(2099, 'Corporate Taxes ', 1, 0, '2016-01-20 21:46:18'),
(2100, 'Corporate Strategy ', 1, 0, '2016-01-20 21:46:26'),
(2101, 'Corporate Law ', 1, 0, '2016-01-20 21:46:40'),
(2102, 'Corporate Finance ', 1, 0, '2016-01-20 21:46:47'),
(2103, 'Corporate Brand Identity ', 1, 0, '2016-01-20 21:46:55'),
(2104, 'Corona ', 1, 0, '2016-01-20 21:47:06'),
(2105, 'Corel Ventura ', 1, 0, '2016-01-20 21:47:16'),
(2106, 'Corel Painter ', 1, 0, '2016-01-20 21:47:27'),
(2107, 'Corel Paint Shop Pro ', 1, 0, '2016-01-20 21:47:35'),
(2108, 'CorelDRAW ', 1, 0, '2016-01-20 21:47:44'),
(2109, 'Core Java ', 1, 0, '2016-01-20 21:47:57'),
(2110, 'CORBA ', 1, 0, '2016-01-20 21:48:04'),
(2111, 'Copywriting ', 1, 0, '2016-01-20 21:48:13'),
(2112, 'Copyright ', 1, 0, '2016-01-20 21:48:20'),
(2113, 'Copy editing ', 1, 0, '2016-01-20 21:48:27'),
(2114, 'Cooking ', 1, 0, '2016-01-20 21:48:35'),
(2115, 'Conversion Rate Optimization ', 1, 0, '2016-01-20 21:49:42'),
(2116, 'Contract Manufacturing ', 1, 0, '2016-01-20 21:49:49'),
(2117, 'Contract Law ', 1, 0, '2016-01-20 21:49:57'),
(2118, 'Contract Drafting ', 1, 0, '2016-01-20 21:50:04'),
(2119, 'Continuous Integration ', 1, 0, '2016-01-20 21:50:11'),
(2120, 'Content Writing ', 1, 0, '2016-01-20 21:50:20'),
(2121, 'Content Moderation ', 1, 0, '2016-01-20 21:50:33'),
(2122, 'Content Management System ', 1, 0, '2016-01-20 21:50:42'),
(2123, 'Contao CMS ', 1, 0, '2016-01-20 21:50:54'),
(2124, 'Consumer Protection ', 1, 0, '2016-01-20 21:51:01'),
(2125, 'Construction Monitoring ', 1, 0, '2016-01-20 21:51:10'),
(2126, 'Construction ', 1, 0, '2016-01-20 21:51:20'),
(2127, 'Constant Contact ', 1, 0, '2016-01-20 21:51:28'),
(2128, 'Conflict Resolution ', 1, 0, '2016-01-20 21:51:36'),
(2129, 'Concrete5 CMS ', 1, 0, '2016-01-20 21:51:47'),
(2130, 'ConceptShare Development ', 1, 0, '2016-01-20 21:51:57'),
(2131, 'Concept Software InPage ', 1, 0, '2016-01-20 21:52:05'),
(2132, 'Concept Design ', 1, 0, '2016-01-20 21:52:14'),
(2133, 'Concept Artistry ', 1, 0, '2016-01-20 21:52:23'),
(2134, 'COMSOL Multiphysics ', 1, 0, '2016-01-20 21:52:30'),
(2135, 'comsat ', 1, 0, '2016-01-20 21:52:38'),
(2136, 'Computer vision ', 1, 0, '2016-01-20 21:52:46'),
(2137, 'Computer Skills ', 1, 0, '2016-01-20 21:52:55'),
(2138, 'Computer Repair ', 1, 0, '2016-01-20 21:53:02'),
(2139, 'Computer Networking ', 1, 0, '2016-01-20 21:53:10'),
(2140, 'Comptuer Maintenance ', 1, 0, '2016-01-20 21:54:11'),
(2141, 'Computer Hardware Installation ', 1, 0, '2016-01-20 21:54:18'),
(2142, 'Computer Hardware Design ', 1, 0, '2016-01-20 21:54:25'),
(2143, 'Computer Graphics ', 1, 0, '2016-01-20 21:54:34'),
(2144, 'Computer Engineering ', 1, 0, '2016-01-20 21:54:42'),
(2145, 'Computer Assembly ', 1, 0, '2016-01-20 21:54:51'),
(2146, 'Computer Aided Manufacturing (CAM) ', 1, 0, '2016-01-20 21:55:00'),
(2147, 'Computational Linguistics ', 1, 0, '2016-01-20 21:55:08'),
(2148, 'Computational Fluid Dynamics (CFD) ', 1, 0, '2016-01-20 21:55:20'),
(2149, 'Compositing ', 1, 0, '2016-01-20 21:55:27'),
(2150, 'Compliance ', 1, 0, '2016-01-20 21:55:36'),
(2151, 'Complaint Management ', 1, 0, '2016-01-20 21:55:43'),
(2152, 'Compiler ', 1, 0, '2016-01-20 21:55:51'),
(2153, 'Compensation ', 1, 0, '2016-01-20 21:56:05'),
(2154, 'Communications ', 1, 0, '2016-01-20 21:56:14'),
(2155, 'Common Language Runtime ', 1, 0, '2016-01-20 21:56:33'),
(2156, 'Commercials ', 1, 0, '2016-01-20 21:56:41'),
(2157, 'Commercial Lending ', 1, 0, '2016-01-20 21:56:56'),
(2158, 'Comic Writing ', 1, 0, '2016-01-20 21:57:06'),
(2159, 'Comic Art ', 1, 0, '2016-01-20 21:57:16'),
(2160, 'Comet ', 1, 0, '2016-01-20 21:57:26'),
(2161, 'Comedy Writing ', 1, 0, '2016-01-20 21:57:44'),
(2162, 'Component Object Model (Microsoft COM) ', 1, 0, '2016-01-20 21:58:01'),
(2163, 'Collection Agencies ', 1, 0, '2016-01-20 21:58:08'),
(2164, 'Collaborative filtering ', 1, 0, '2016-01-20 21:58:16'),
(2165, 'CollabNet TeamForge ', 1, 0, '2016-01-20 21:58:24'),
(2166, 'ColdFusion ', 1, 0, '2016-01-20 21:58:36'),
(2167, 'Cold calling ', 1, 0, '2016-01-20 21:58:44'),
(2168, 'Cognos ', 1, 0, '2016-01-20 21:58:51'),
(2169, 'CoffeeScript ', 1, 0, '2016-01-20 21:58:58'),
(2170, 'CodeWarrior ', 1, 0, '2016-01-20 21:59:05'),
(2171, 'CoDeSys ', 1, 0, '2016-01-20 21:59:13'),
(2172, 'CodeIgniter ', 1, 0, '2016-01-20 21:59:20'),
(2173, 'Code Refactoring ', 1, 0, '2016-01-20 21:59:32'),
(2174, 'Cocos2d ', 1, 0, '2016-01-20 21:59:41'),
(2175, 'Cocoa Touch ', 1, 0, '2016-01-20 21:59:49'),
(2176, 'Cocoa ', 1, 0, '2016-01-20 21:59:58'),
(2177, 'COBOL ', 1, 0, '2016-01-20 22:00:07'),
(2178, 'CNC Programming ', 1, 0, '2016-01-20 22:00:14'),
(2179, 'CMS Development ', 1, 0, '2016-01-20 22:00:22'),
(2180, 'Cluster Computing ', 1, 0, '2016-01-20 22:00:29'),
(2181, 'CloudForge ', 1, 0, '2016-01-20 22:00:37'),
(2182, 'Cloudera ', 1, 0, '2016-01-20 22:00:44'),
(2183, 'Cloud Security Framework ', 1, 0, '2016-01-20 22:00:52'),
(2184, 'Clojure ', 1, 0, '2016-01-20 22:00:59'),
(2185, 'Clipping Path ', 1, 0, '2016-01-20 22:01:06'),
(2186, 'Climate Sciences ', 1, 0, '2016-01-20 22:01:13'),
(2187, 'ClickBank', 1, 0, '2016-01-20 22:03:00'),
(2188, 'clerical skills ', 1, 0, '2016-01-20 22:03:13'),
(2189, 'ClearQuest ', 1, 0, '2016-01-20 22:03:21'),
(2190, 'Clear Books ', 1, 0, '2016-01-20 22:03:28'),
(2191, 'Clean Technology ', 1, 0, '2016-01-20 22:03:37'),
(2192, 'Classifieds Posting ', 1, 0, '2016-01-20 22:03:44'),
(2193, 'ClamAV ', 1, 0, '2016-01-20 22:03:51'),
(2194, 'Civil Law ', 1, 0, '2016-01-20 22:03:58'),
(2195, 'Civil Engineering ', 1, 0, '2016-01-20 22:04:06'),
(2196, 'CiviCRM ', 1, 0, '2016-01-20 22:04:14'),
(2197, 'Citrix XenServer ', 1, 0, '2016-01-20 22:04:21'),
(2198, 'Citrix NetScaler ', 1, 0, '2016-01-20 22:04:32'),
(2199, 'Cisco CallManager ', 1, 0, '2016-01-20 22:04:39'),
(2200, 'cisco routers ', 1, 0, '2016-01-20 22:06:03'),
(2201, 'Cisco PIX ', 1, 0, '2016-01-20 22:06:11'),
(2202, 'Cisco IOS ', 1, 0, '2016-01-20 22:06:18'),
(2203, 'Cisco Certified Network Associate (CCNA) ', 1, 0, '2016-01-20 22:06:25'),
(2204, 'Cisco Certified Internetwork Expert (CCIE) ', 1, 0, '2016-01-20 22:06:37'),
(2205, 'Cisco Certified Entry Networking Technician (CCENT) ', 1, 0, '2016-01-20 22:06:46'),
(2206, 'Cisco Certified Design Professional (CCDP) ', 1, 0, '2016-01-20 22:07:03'),
(2207, 'Cisco Certified Design Expert (CCDE) ', 1, 0, '2016-01-20 22:07:14'),
(2208, 'Cisco Certified Design Associate (CCDA) ', 1, 0, '2016-01-20 22:07:28'),
(2209, 'Cisco ASA ', 1, 0, '2016-01-20 22:07:39'),
(2210, 'Circuit Design ', 1, 0, '2016-01-20 22:07:46'),
(2211, 'Cinematography ', 1, 0, '2016-01-20 22:07:56'),
(2212, 'Customer Information Control System (CICS) ', 1, 0, '2016-01-20 22:08:04'),
(2213, 'Chrome OS ', 1, 0, '2016-01-20 22:08:11'),
(2214, 'Chrome Extension ', 1, 0, '2016-01-20 22:08:19'),
(2215, 'Chroma key ', 1, 0, '2016-01-20 22:08:26'),
(2216, 'Christian theology ', 1, 0, '2016-01-20 22:08:35'),
(2217, 'Chinese ', 1, 0, '2016-01-20 22:08:43'),
(2218, 'Childrens Writing ', 1, 0, '2016-01-20 22:09:42'),
(2219, 'Child Counseling ', 1, 0, '2016-01-20 22:10:02'),
(2220, 'Chicago Manual of Style ', 1, 0, '2016-01-20 22:10:09'),
(2221, 'Chemistry ', 1, 0, '2016-01-20 22:10:19'),
(2222, 'Chemical Engineering ', 1, 0, '2016-01-20 22:10:29'),
(2223, 'Check Point ', 1, 0, '2016-01-20 22:10:40'),
(2224, 'chat support ', 1, 0, '2016-01-20 22:10:50'),
(2225, 'Chart.js ', 1, 0, '2016-01-20 22:10:59'),
(2226, 'Character Design ', 1, 0, '2016-01-20 22:11:08'),
(2227, 'Chaos Group V-Ray ', 1, 0, '2016-01-20 22:11:15'),
(2228, 'Change Management ', 1, 0, '2016-01-20 22:11:23'),
(2229, 'CGI ', 1, 0, '2016-01-20 22:11:32'),
(2230, 'CG Artwork ', 1, 0, '2016-01-20 22:11:41'),
(2231, 'Certified Public Accountant (CPA) ', 1, 0, '2016-01-20 22:11:51'),
(2232, 'Certified Information Systems Security Professional (CISSP) ', 1, 0, '2016-01-20 22:11:59'),
(2233, 'Centreon ', 1, 0, '2016-01-20 22:12:07'),
(2234, 'Central Reservation Systems ', 1, 0, '2016-01-20 22:12:14'),
(2235, 'Central Desktop Development ', 1, 0, '2016-01-20 22:12:27'),
(2236, 'CentOS ', 1, 0, '2016-01-20 22:12:34'),
(2237, 'Violoncello ', 1, 0, '2016-01-20 22:12:42'),
(2238, 'Celemony Melodyne ', 1, 0, '2016-01-20 22:12:50'),
(2239, 'CDMA ', 1, 0, '2016-01-20 22:12:57'),
(2240, 'Cisco Certified Network Professional (CCNP) ', 1, 0, '2016-01-20 22:13:04'),
(2241, 'Cavium OCTEON Plus MIPS64 ', 1, 0, '2016-01-20 22:13:12'),
(2242, 'Cavium Octeon Fusion ', 1, 0, '2016-01-20 22:13:20'),
(2243, 'CATIA ', 1, 0, '2016-01-20 22:13:31'),
(2244, 'Catholic Theology ', 1, 0, '2016-01-20 22:13:52'),
(2245, 'Catch Phrases ', 1, 0, '2016-01-20 22:14:00'),
(2246, 'Catalan ', 1, 0, '2016-01-20 22:14:10'),
(2247, 'Apache Cassandra ', 1, 0, '2016-01-20 22:14:19'),
(2248, 'Caspio Programming ', 1, 0, '2016-01-20 22:14:32'),
(2249, 'Caspio Administration ', 1, 0, '2016-01-20 22:14:39'),
(2250, 'Cartooning ', 1, 0, '2016-01-20 22:14:47'),
(2251, 'Cartography & Maps ', 1, 0, '2016-01-20 22:14:54'),
(2252, 'Caricature Drawing ', 1, 0, '2016-01-20 22:15:01'),
(2253, 'Carbide.c++ ', 1, 0, '2016-01-20 22:15:09'),
(2254, 'Capture NX2 ', 1, 0, '2016-01-20 22:15:16'),
(2255, 'Capistrano ', 1, 0, '2016-01-20 22:15:23'),
(2256, 'Cantonese ', 1, 0, '2016-01-20 22:15:31'),
(2257, 'Camtasia ', 1, 0, '2016-01-20 22:15:38'),
(2258, 'Calligraphy ', 1, 0, '2016-01-20 22:15:45'),
(2259, 'Call Handling ', 1, 0, '2016-01-20 22:15:52'),
(2260, 'Call Center Management ', 1, 0, '2016-01-20 22:15:59'),
(2261, 'Calendar Management ', 1, 0, '2016-01-20 22:16:09'),
(2262, 'Calculus ', 1, 0, '2016-01-20 22:16:18'),
(2263, 'Cakewalk Sonar ', 1, 0, '2016-01-20 22:16:26'),
(2264, 'CakePHP ', 1, 0, '2016-01-20 22:16:34'),
(2265, 'Cairngorm ', 1, 0, '2016-01-20 22:16:43'),
(2266, 'Cadence Platform ', 1, 0, '2016-01-20 22:16:52'),
(2267, 'Computer-Aided Design ', 1, 0, '2016-01-20 22:17:00'),
(2268, 'Cache Management ', 1, 0, '2016-01-20 22:17:08'),
(2269, 'C Shell ', 1, 0, '2016-01-20 22:17:17'),
(2270, 'C++ ', 1, 0, '2016-01-20 22:17:26'),
(2271, 'C# ', 1, 0, '2016-01-20 22:17:35'),
(2272, 'C ', 1, 0, '2016-01-20 22:17:45'),
(2273, 'Business Writing ', 1, 0, '2016-01-21 05:27:12'),
(2274, 'Business valuation ', 1, 0, '2016-01-21 05:27:21'),
(2275, 'Business Scenario Development ', 1, 0, '2016-01-21 05:27:28'),
(2276, 'Business Proposal Writing ', 1, 0, '2016-01-21 05:27:35'),
(2277, 'Business Process Reengineering ', 1, 0, '2016-01-21 05:27:44'),
(2278, 'Business Process Modeling ', 1, 0, '2016-01-21 05:27:55'),
(2279, 'Business Planning ', 1, 0, '2016-01-21 05:28:04'),
(2280, 'Business Modeling ', 1, 0, '2016-01-21 05:28:12'),
(2281, 'Business Mathematics ', 1, 0, '2016-01-21 05:28:21'),
(2282, 'Business Management ', 1, 0, '2016-01-21 05:28:30'),
(2283, 'Business IT Alignment ', 1, 0, '2016-01-21 05:28:38'),
(2284, 'Business intelligence ', 1, 0, '2016-01-21 05:28:47'),
(2285, 'Business Development ', 1, 0, '2016-01-21 05:29:00'),
(2286, 'Business Continuity Planning ', 1, 0, '2016-01-21 05:29:09'),
(2287, 'Business Coaching ', 1, 0, '2016-01-21 05:29:19'),
(2288, 'Business Card Design ', 1, 0, '2016-01-21 05:29:28'),
(2289, 'Business Analysis ', 1, 0, '2016-01-21 05:29:36'),
(2290, 'Bulk Marketing ', 1, 0, '2016-01-21 05:29:45'),
(2291, 'Bulgarian ', 1, 0, '2016-01-21 05:29:57'),
(2292, 'Buildium ', 1, 0, '2016-01-21 05:30:07'),
(2293, 'Building Regulations ', 1, 0, '2016-01-21 05:30:18'),
(2294, 'Building Estimation ', 1, 0, '2016-01-21 05:30:27'),
(2295, 'Bugzilla ', 1, 0, '2016-01-21 05:30:35'),
(2296, 'Budgeting & Forecasting ', 1, 0, '2016-01-21 05:30:44'),
(2297, 'BuddyPress ', 1, 0, '2016-01-21 05:30:59'),
(2298, 'Brochure Design ', 1, 0, '2016-01-21 05:31:06'),
(2299, 'BroadVision QuickSilver ', 1, 0, '2016-01-21 05:31:14'),
(2300, 'BroadVision ClearVale ', 1, 0, '2016-01-21 05:31:23'),
(2301, 'Broadcast Engineering ', 1, 0, '2016-01-21 05:31:34'),
(2302, 'Broadcast Advertising ', 1, 0, '2016-01-21 05:32:23'),
(2303, 'BREW ', 1, 0, '2016-01-21 05:32:35'),
(2304, 'Brand Ambassador ', 1, 0, '2016-01-21 05:32:42'),
(2305, 'Brand Management ', 1, 0, '2016-01-21 05:32:51'),
(2306, 'Brand Licensing ', 1, 0, '2016-01-21 05:32:59'),
(2307, 'Brand Consulting ', 1, 0, '2016-01-21 05:33:06'),
(2308, 'BPO IT services ', 1, 0, '2016-01-21 05:33:13'),
(2309, 'BPO Call Center ', 1, 0, '2016-01-21 05:33:21'),
(2310, 'Business Process Execution Language (BPEL) ', 1, 0, '2016-01-21 05:33:30'),
(2311, 'BPCS ', 1, 0, '2016-01-21 05:33:49'),
(2312, 'Box2D ', 1, 0, '2016-01-21 05:33:57'),
(2313, 'Box.net Development ', 1, 0, '2016-01-21 05:34:05'),
(2314, 'Bosnian ', 1, 0, '2016-01-21 05:34:13'),
(2315, 'Borland SilkTest ', 1, 0, '2016-01-21 05:34:26'),
(2316, 'Borland C++ Builder ', 1, 0, '2016-01-21 05:34:34'),
(2317, 'Bootstrap ', 1, 0, '2016-01-21 05:34:42'),
(2318, 'Boost ', 1, 0, '2016-01-21 05:34:51'),
(2319, 'BoonEx Dolphin ', 1, 0, '2016-01-21 05:35:03'),
(2320, 'Bookkeeping ', 1, 0, '2016-01-21 05:35:11'),
(2321, 'Book Writing ', 1, 0, '2016-01-21 05:35:24'),
(2322, 'Book Cover Design ', 1, 0, '2016-01-21 05:35:37'),
(2323, 'BuildMyRank Writing ', 1, 0, '2016-01-21 05:35:47'),
(2324, 'Bluetooth ', 1, 0, '2016-01-21 05:36:00'),
(2325, 'blue.box ', 1, 0, '2016-01-21 05:36:08'),
(2326, 'Blog Writing ', 1, 0, '2016-01-21 05:36:17'),
(2327, 'Blog Development ', 1, 0, '2016-01-21 05:36:26'),
(2328, 'Blog Commenting ', 1, 0, '2016-01-21 05:36:35'),
(2329, 'Blitz BASIC ', 1, 0, '2016-01-21 05:36:44'),
(2330, 'Blender3D ', 1, 0, '2016-01-21 05:36:51'),
(2331, 'BlazeDS ', 1, 0, '2016-01-21 05:36:59'),
(2332, 'Blackboard ', 1, 0, '2016-01-21 05:37:08'),
(2333, 'BlackBerry JDE ', 1, 0, '2016-01-21 05:37:16'),
(2334, 'Blackberry app development ', 1, 0, '2016-01-21 05:37:24'),
(2335, 'Black Box Testing ', 1, 0, '2016-01-21 05:37:32'),
(2336, 'BizTalk Server ', 1, 0, '2016-01-21 05:37:45'),
(2337, 'BitRock Installbuilder ', 1, 0, '2016-01-21 05:37:54'),
(2338, 'Bitrix Intranet ', 1, 0, '2016-01-21 05:38:02'),
(2339, 'Bitrix ', 1, 0, '2016-01-21 05:38:11'),
(2340, 'Bitcoin ', 1, 0, '2016-01-21 05:38:20'),
(2341, 'BIRT ', 1, 0, '2016-01-21 05:38:30'),
(2342, 'Biotechnology ', 1, 0, '2016-01-21 05:38:39'),
(2343, 'Biostatistics ', 1, 0, '2016-01-21 05:38:47'),
(2344, 'Biology ', 1, 0, '2016-01-21 05:38:57'),
(2345, 'Biography Writing ', 1, 0, '2016-01-21 05:39:05'),
(2346, 'Bioinformatics ', 1, 0, '2016-01-21 05:39:13'),
(2347, 'Bing Ads ', 1, 0, '2016-01-21 05:39:40'),
(2348, 'BigCommerce ', 1, 0, '2016-01-21 05:39:48'),
(2349, 'Big Data ', 1, 0, '2016-01-21 05:39:55'),
(2350, 'Border Gateway Protocol ', 1, 0, '2016-01-21 05:40:02'),
(2351, 'BGL Simple Fund ', 1, 0, '2016-01-21 05:40:10'),
(2352, 'Betfair ', 1, 0, '2016-01-21 05:40:20'),
(2353, 'BeOS ', 1, 0, '2016-01-21 05:40:28'),
(2354, 'Bentley Microstation ', 1, 0, '2016-01-21 05:40:36'),
(2355, 'Bengali ', 1, 0, '2016-01-21 05:41:20'),
(2356, 'Benefits Law ', 1, 0, '2016-01-21 05:41:34'),
(2357, 'Belle Nuit Subtitler ', 1, 0, '2016-01-21 05:41:42'),
(2358, 'Behavioral Event Interviewing ', 1, 0, '2016-01-21 05:41:49'),
(2359, 'Behavior Driven Development (BDD) ', 1, 0, '2016-01-21 05:42:00'),
(2360, 'bbPress ', 1, 0, '2016-01-21 05:42:13'),
(2361, 'Bassoon ', 1, 0, '2016-01-21 05:42:21'),
(2362, 'Basque ', 1, 0, '2016-01-21 05:42:29'),
(2363, 'Basic ', 1, 0, '2016-01-21 05:42:39'),
(2364, 'Bash shell scripting ', 1, 0, '2016-01-21 05:42:49'),
(2365, 'Bash ', 1, 0, '2016-01-21 05:42:57'),
(2366, 'Basecamp ', 1, 0, '2016-01-21 05:43:07'),
(2367, 'Business Activity Monitoring ', 1, 0, '2016-01-21 05:43:15'),
(2368, 'Bartending ', 1, 0, '2016-01-21 05:43:29'),
(2369, 'Banner Ad Design ', 1, 0, '2016-01-21 05:43:33'),
(2370, 'Banner Ads ', 1, 0, '2016-01-21 05:43:52'),
(2371, 'Bankruptcy ', 1, 0, '2016-01-21 05:43:59'),
(2372, 'Bank Reconciliation ', 1, 0, '2016-01-21 05:44:06'),
(2373, 'Balsamiq ', 1, 0, '2016-01-21 05:44:15'),
(2374, 'Baking ', 1, 0, '2016-01-21 05:44:22'),
(2375, 'Bada ', 1, 0, '2016-01-21 05:44:33'),
(2376, 'Bacula ', 1, 0, '2016-01-21 05:44:42'),
(2377, 'Backbone.js ', 1, 0, '2016-01-21 05:44:51'),
(2378, 'B2B Marketing ', 1, 0, '2016-01-21 05:45:18'),
(2379, 'Axure RP ', 1, 0, '2016-01-21 06:09:49'),
(2380, 'Axiom Productivity Tools ', 1, 0, '2016-01-21 06:09:55'),
(2381, 'Axiom MicroStation Productivity Toolkit ', 1, 0, '2016-01-21 06:10:02'),
(2382, 'Axiis ', 1, 0, '2016-01-21 06:10:09'),
(2383, 'Axapta ', 1, 0, '2016-01-21 06:10:22'),
(2384, 'Abstract Window Toolkit (AWT) ', 1, 0, '2016-01-21 06:10:31'),
(2385, 'Awk ', 1, 0, '2016-01-21 06:10:39'),
(2386, 'aWeber ', 1, 0, '2016-01-21 06:10:50'),
(2387, 'Away3D ', 1, 0, '2016-01-21 06:10:57'),
(2388, 'Avid Pro Tools ', 1, 0, '2016-01-21 06:11:06'),
(2389, 'Avid ', 1, 0, '2016-01-21 06:11:14'),
(2390, 'Aviation ', 1, 0, '2016-01-21 06:11:22'),
(2391, 'AVEVA PDMS ', 1, 0, '2016-01-21 06:11:29'),
(2392, 'Avaya ', 1, 0, '2016-01-21 06:11:36'),
(2393, 'Avactis ', 1, 0, '2016-01-21 06:11:52'),
(2394, 'Automotive Engineering ', 1, 0, '2016-01-21 06:11:59'),
(2395, 'Automation ', 1, 0, '2016-01-21 06:12:07'),
(2396, 'Automated Testing ', 1, 0, '2016-01-21 06:12:18'),
(2397, 'Automated Call Distribution ', 1, 0, '2016-01-21 06:12:25'),
(2398, 'AutoLISP ', 1, 0, '2016-01-21 06:12:32'),
(2399, 'Autoit ', 1, 0, '2016-01-21 06:12:39'),
(2400, 'AutoHotKey ', 1, 0, '2016-01-21 06:12:46'),
(2401, 'Autodys AcceliCAD ', 1, 0, '2016-01-21 06:12:53'),
(2402, 'Autodesk Softimage ', 1, 0, '2016-01-21 06:13:05'),
(2403, 'Autodesk Sketchbook Pro ', 1, 0, '2016-01-21 06:13:12'),
(2404, 'Autodesk Revit ', 1, 0, '2016-01-21 06:13:21'),
(2405, 'Autodesk Navisworks ', 1, 0, '2016-01-21 06:13:29'),
(2406, 'Autodesk Mudbox ', 1, 0, '2016-01-21 06:13:36'),
(2407, 'Autodesk Maya ', 1, 0, '2016-01-21 06:13:47'),
(2408, 'Autodesk Inventor ', 1, 0, '2016-01-21 06:13:56'),
(2409, 'Autodesk Autocad Civil3D ', 1, 0, '2016-01-21 06:14:04'),
(2410, 'Autodesk 3D Studio Max ', 1, 0, '2016-01-21 06:14:13'),
(2411, 'Autodesk ', 1, 0, '2016-01-21 06:14:51'),
(2412, 'AutoCAD ', 1, 0, '2016-01-21 06:15:01'),
(2413, 'Authorize.Net Development ', 1, 0, '2016-01-21 06:15:12'),
(2414, 'Author-It ', 1, 0, '2016-01-21 06:15:21'),
(2415, 'Augmented Reality ', 1, 0, '2016-01-21 06:15:29'),
(2416, 'Autodesk Architecture ', 1, 0, '2016-01-21 06:15:37'),
(2417, 'Auditing ', 1, 0, '2016-01-21 06:15:46'),
(2418, 'Audio Restoration ', 1, 0, '2016-01-21 06:15:52'),
(2419, 'Audio Production ', 1, 0, '2016-01-21 06:16:00'),
(2420, 'Audio Postediting ', 1, 0, '2016-01-21 06:16:11'),
(2421, 'Audio Post Production ', 1, 0, '2016-01-21 06:16:18'),
(2422, 'Audio Mixing ', 1, 0, '2016-01-21 06:16:26'),
(2423, 'Audio Mastering ', 1, 0, '2016-01-21 06:16:33'),
(2424, 'Audio Engineering ', 1, 0, '2016-01-21 06:16:40'),
(2425, 'Audio Editing ', 1, 0, '2016-01-21 06:16:49'),
(2426, 'Audio Design ', 1, 0, '2016-01-21 06:17:00'),
(2427, 'Audacity ', 1, 0, '2016-01-21 06:17:07'),
(2428, 'Auctiva ', 1, 0, '2016-01-21 06:17:15'),
(2429, 'Atom ', 1, 0, '2016-01-21 06:17:23'),
(2430, 'Atmel AVR ', 1, 0, '2016-01-21 06:17:32'),
(2431, 'ATM Implementation ', 1, 0, '2016-01-21 06:17:39'),
(2432, 'Atlassian JIRA ', 1, 0, '2016-01-21 06:17:46'),
(2433, 'Atlassian GreenHopper ', 1, 0, '2016-01-21 06:18:05'),
(2434, 'Atlassian Confluence ', 1, 0, '2016-01-21 06:18:13'),
(2435, 'Atlas ', 1, 0, '2016-01-21 06:18:21'),
(2436, 'ATL ', 1, 0, '2016-01-21 06:18:34'),
(2437, 'Asynchronous I/O ', 1, 0, '2016-01-21 06:18:43'),
(2438, 'Astrophysics ', 1, 0, '2016-01-21 06:18:54'),
(2439, 'Astrology ', 1, 0, '2016-01-21 06:19:02'),
(2440, 'Asterisk ', 1, 0, '2016-01-21 06:19:10'),
(2441, 'Assembly Language ', 1, 0, '2016-01-21 06:19:19'),
(2442, 'Assembla ', 1, 0, '2016-01-21 06:19:27'),
(2443, 'Aspen HYSYS ', 1, 0, '2016-01-21 06:19:33'),
(2444, 'AspectJS ', 1, 0, '2016-01-21 06:19:41'),
(2445, 'AspDotNetStorefront ', 1, 0, '2016-01-21 06:19:49'),
(2446, 'ASP.NET MVC ', 1, 0, '2016-01-21 06:20:02'),
(2447, 'ASP.NET ', 1, 0, '2016-01-21 06:20:10'),
(2448, 'ASP ', 1, 0, '2016-01-21 06:20:19'),
(2449, 'ASIO ', 1, 0, '2016-01-21 06:20:27'),
(2450, 'IBM AS/400 Control Language ', 1, 0, '2016-01-21 06:22:50'),
(2451, 'Arts & Crafts ', 1, 0, '2016-01-21 06:23:00'),
(2452, 'ArtRage ', 1, 0, '2016-01-21 06:23:16'),
(2453, 'Artlantis Studio ', 1, 0, '2016-01-21 06:23:23'),
(2454, 'Artlantis Render ', 1, 0, '2016-01-21 06:23:31'),
(2455, 'Artisteer ', 1, 0, '2016-01-21 06:23:39'),
(2456, 'ArtiosCAD ', 1, 0, '2016-01-21 06:23:48'),
(2457, 'Artificial Neural Networks ', 1, 0, '2016-01-21 06:23:56'),
(2458, 'Artificial Intelligence ', 1, 0, '2016-01-21 06:24:08'),
(2459, 'Articulate Studio ', 1, 0, '2016-01-21 06:24:16'),
(2460, 'Articulate Storyline ', 1, 0, '2016-01-21 06:24:23'),
(2461, 'Articulate Presenter ', 1, 0, '2016-01-21 06:24:37'),
(2462, 'Articulate Engage ', 1, 0, '2016-01-21 06:24:44'),
(2463, 'Articulate ', 1, 0, '2016-01-21 06:24:52'),
(2464, 'Article Writing ', 1, 0, '2016-01-21 06:24:59'),
(2465, 'Article Submission ', 1, 0, '2016-01-21 06:25:07'),
(2466, 'Article Spinning ', 1, 0, '2016-01-21 06:25:15'),
(2467, 'Article Rewriting ', 1, 0, '2016-01-21 06:25:23'),
(2468, 'Article curation ', 1, 0, '2016-01-21 06:25:32'),
(2469, 'Art Direction ', 1, 0, '2016-01-21 06:25:39'),
(2470, 'Art curation ', 1, 0, '2016-01-21 06:25:50'),
(2471, 'ARM ', 1, 0, '2016-01-21 06:26:05'),
(2472, 'Arduino ', 1, 0, '2016-01-21 06:26:12'),
(2473, 'ARCserve ', 1, 0, '2016-01-21 06:26:20'),
(2474, 'ArcScene ', 1, 0, '2016-01-21 06:26:27'),
(2475, 'Architectural Rendering ', 1, 0, '2016-01-21 06:26:34'),
(2476, 'Architecture ', 1, 0, '2016-01-21 06:26:42'),
(2477, 'ArchiCAD ', 1, 0, '2016-01-21 06:26:49'),
(2478, 'ArcGIS ', 1, 0, '2016-01-21 06:26:56'),
(2479, 'Arbitration ', 1, 0, '2016-01-21 06:27:03'),
(2480, 'Arabic ', 1, 0, '2016-01-21 06:27:11'),
(2481, 'Appointment Setting ', 1, 0, '2016-01-21 06:27:19'),
(2482, 'Application Server ', 1, 0, '2016-01-21 06:27:28'),
(2483, 'Application Programming ', 1, 0, '2016-01-21 06:27:53'),
(2484, 'Application Lifecycle Management ', 1, 0, '2016-01-21 06:28:01'),
(2485, 'Applicant Tracking Systems ', 1, 0, '2016-01-21 06:28:13'),
(2486, 'AppleScript ', 1, 0, '2016-01-21 06:28:20'),
(2487, 'Apple Xcode ', 1, 0, '2016-01-21 06:28:28'),
(2488, 'Apple WebObjects ', 1, 0, '2016-01-21 06:28:36'),
(2489, 'Apple UIKit Framework ', 1, 0, '2016-01-21 06:28:44'),
(2490, 'Apple Motion ', 1, 0, '2016-01-21 06:28:52'),
(2491, 'Apple iWork ', 1, 0, '2016-01-21 06:28:59'),
(2492, 'Apple iWeb ', 1, 0, '2016-01-21 06:29:07'),
(2493, 'iOS Jailbreaking ', 1, 0, '2016-01-21 06:29:17'),
(2494, 'Apple iMovie ', 1, 0, '2016-01-21 06:29:24'),
(2495, 'Apple iBooks ', 1, 0, '2016-01-21 06:29:32'),
(2496, 'Appian BPM Suite ', 1, 0, '2016-01-21 06:29:44'),
(2497, 'Appian ', 1, 0, '2016-01-21 06:29:52'),
(2498, 'AppFuse ', 1, 0, '2016-01-21 06:30:00'),
(2499, 'Appcelerator Titanium ', 1, 0, '2016-01-21 06:30:06'),
(2500, 'App Usability Analysis ', 1, 0, '2016-01-21 06:30:14'),
(2501, 'App Store ', 1, 0, '2016-01-21 06:30:22'),
(2502, 'Apollo ', 1, 0, '2016-01-21 06:30:29'),
(2503, 'API Documentation ', 1, 0, '2016-01-21 06:30:36'),
(2504, 'API Development ', 1, 0, '2016-01-21 06:31:00'),
(2505, 'Apache Tomcat ', 1, 0, '2016-01-21 06:31:08'),
(2506, 'Apache Tiles ', 1, 0, '2016-01-21 06:31:16'),
(2507, 'Apache Thrift ', 1, 0, '2016-01-21 06:31:23'),
(2508, 'Apache Struts ', 1, 0, '2016-01-21 06:31:31'),
(2509, 'Apache Spark ', 1, 0, '2016-01-21 06:31:39'),
(2510, 'Apache Solr ', 1, 0, '2016-01-21 06:32:06'),
(2511, 'Apache Shirol ', 1, 0, '2016-01-21 06:32:15'),
(2512, 'Apache Jakarta POI ', 1, 0, '2016-01-21 06:32:24'),
(2513, 'Apache OFBiz ', 1, 0, '2016-01-21 06:32:32'),
(2514, 'Apache Nutch ', 1, 0, '2016-01-21 06:32:45'),
(2515, 'Apache Mahout ', 1, 0, '2016-01-21 06:33:04'),
(2516, 'Apache Kafka ', 1, 0, '2016-01-21 06:33:15'),
(2517, 'Apache Hive ', 1, 0, '2016-01-21 06:33:22'),
(2518, 'Apache Flume ', 1, 0, '2016-01-21 06:33:30'),
(2519, 'Apache CXF ', 1, 0, '2016-01-21 06:33:37'),
(2520, 'Apache Cordova ', 1, 0, '2016-01-21 06:33:50'),
(2521, 'Apache Cocoon ', 1, 0, '2016-01-21 06:33:58'),
(2522, 'Apache CloudStack ', 1, 0, '2016-01-21 06:34:05'),
(2523, 'Apache Click ', 1, 0, '2016-01-21 06:34:12'),
(2524, 'Apache Camel ', 1, 0, '2016-01-21 06:34:23'),
(2525, 'Apache Avro ', 1, 0, '2016-01-21 06:34:31'),
(2526, 'Apache Ant ', 1, 0, '2016-01-21 06:34:38'),
(2527, 'Apache administration ', 1, 0, '2016-01-21 06:34:45'),
(2528, 'AP Style Writing ', 1, 0, '2016-01-21 06:34:53'),
(2529, 'Antitrust ', 1, 0, '2016-01-21 06:35:00'),
(2530, 'Antispam and Antivirus ', 1, 0, '2016-01-21 06:35:08'),
(2531, 'Antenna Design ', 1, 0, '2016-01-21 06:35:15'),
(2532, 'ANSYS ', 1, 0, '2016-01-21 06:35:23'),
(2533, 'ANSI C ', 1, 0, '2016-01-21 06:35:35'),
(2534, 'Anime Studio ', 1, 0, '2016-01-21 06:35:42'),
(2535, 'Animation ', 1, 0, '2016-01-21 06:35:51'),
(2536, 'AngularJS ', 1, 0, '2016-01-21 06:35:59'),
(2537, 'Android SDK ', 1, 0, '2016-01-21 06:36:10'),
(2538, 'Android App Development ', 1, 0, '2016-01-21 06:36:18'),
(2539, 'Android ', 1, 0, '2016-01-21 06:36:27'),
(2540, 'Analytics ', 1, 0, '2016-01-21 06:37:04'),
(2541, 'Analog Electronics ', 1, 0, '2016-01-21 06:37:11'),
(2542, 'AMQP ', 1, 0, '2016-01-21 06:37:19'),
(2543, 'Amplifiers and Filters ', 1, 0, '2016-01-21 06:37:26'),
(2544, 'American Sign Language ', 1, 0, '2016-01-21 06:37:34'),
(2545, 'aMember ', 1, 0, '2016-01-21 06:37:47'),
(2546, 'Amazon Webstore ', 1, 0, '2016-01-21 06:37:55'),
(2547, 'Amazon Web Services ', 1, 0, '2016-01-21 06:38:03'),
(2548, 'Amazon S3 ', 1, 0, '2016-01-21 06:38:11'),
(2549, 'Amazon Relational Database Service ', 1, 0, '2016-01-21 06:38:19'),
(2550, 'Amazon MWS ', 1, 0, '2016-01-21 06:38:27'),
(2551, 'Mechanical Turk API ', 1, 0, '2016-01-21 06:38:35'),
(2552, 'Amazon EC2 ', 1, 0, '2016-01-21 06:38:42'),
(2553, 'Amazon Appstore ', 1, 0, '2016-01-21 06:38:49'),
(2554, 'Amanda Backup ', 1, 0, '2016-01-21 06:38:57'),
(2555, 'Amadeus ', 1, 0, '2016-01-21 06:39:04'),
(2556, 'Altium Designer ', 1, 0, '2016-01-21 06:39:12'),
(2557, 'Alternative Dispute Resolution ', 1, 0, '2016-01-21 06:39:19'),
(2558, 'Alternative3D ', 1, 0, '2016-01-21 06:39:30'),
(2559, 'Alpha ', 1, 0, '2016-01-21 06:39:38'),
(2560, 'Alibre Design ', 1, 0, '2016-01-21 06:39:47'),
(2561, 'Algorithms ', 1, 0, '2016-01-21 06:39:55'),
(2562, 'Algorithm Development ', 1, 0, '2016-01-21 06:40:12'),
(2563, 'Alfresco user ', 1, 0, '2016-01-21 06:40:19'),
(2564, 'Alfresco development ', 1, 0, '2016-01-21 06:40:28'),
(2565, 'Album Cover Design ', 1, 0, '2016-01-21 06:40:36'),
(2566, 'Albanian ', 1, 0, '2016-01-21 06:40:45'),
(2567, 'Akka ', 1, 0, '2016-01-21 06:40:57'),
(2568, 'AJAX ', 1, 0, '2016-01-21 06:41:09'),
(2569, 'AIX ', 1, 0, '2016-01-21 06:41:17'),
(2570, 'Amharic Language ', 1, 0, '2016-01-21 06:41:33'),
(2571, 'Agriculture ', 1, 0, '2016-01-21 06:41:41'),
(2572, 'Agile software developmennt ', 1, 0, '2016-01-21 06:41:48'),
(2573, 'Afrikaans ', 1, 0, '2016-01-21 06:41:58'),
(2574, 'Affiliate Marketing ', 1, 0, '2016-01-21 06:42:06'),
(2575, 'Advertising ', 1, 0, '2016-01-21 06:42:15'),
(2576, 'Advanced Business Application Programming (ABAP) ', 1, 0, '2016-01-21 06:42:29'),
(2577, 'ADVA ', 1, 0, '2016-01-21 06:42:38'),
(2578, 'Adobe Wallaby ', 1, 0, '2016-01-21 06:42:46'),
(2579, 'Adobe Soundbooth ', 1, 0, '2016-01-21 06:43:04'),
(2580, 'Adobe RoboHelp ', 1, 0, '2016-01-21 06:43:15'),
(2581, 'Adobe Premiere Pro ', 1, 0, '2016-01-21 06:43:24'),
(2582, 'Adobe Premiere Elements ', 1, 0, '2016-01-21 06:43:32'),
(2583, 'Adobe Premiere ', 1, 0, '2016-01-21 06:43:39'),
(2584, 'Adobe Photoshop Lightroom ', 1, 0, '2016-01-21 06:43:55'),
(2585, 'Adobe Photoshop ', 1, 0, '2016-01-21 06:44:03'),
(2586, 'Adobe PDF ', 1, 0, '2016-01-21 06:44:11'),
(2587, 'Adobe PageMaker ', 1, 0, '2016-01-21 06:44:18'),
(2588, 'Adobe Muse ', 1, 0, '2016-01-21 06:44:26'),
(2589, 'Adobe LiveCycle Designer ', 1, 0, '2016-01-21 06:44:33'),
(2590, 'Adobe Photoshop Lightroom ', 1, 0, '2016-01-21 06:44:43'),
(2591, 'Adobe Insight ', 1, 0, '2016-01-21 06:45:02'),
(2592, 'Adobe InDesign ', 1, 0, '2016-01-21 06:45:09'),
(2593, 'Adobe InCopy ', 1, 0, '2016-01-21 06:45:17'),
(2594, 'Adobe Imageready ', 1, 0, '2016-01-21 06:45:24'),
(2595, 'Adobe Illustrator ', 1, 0, '2016-01-21 06:45:37'),
(2596, 'AGAL ', 1, 0, '2016-01-21 06:45:45'),
(2597, 'Adobe GoLive ', 1, 0, '2016-01-21 06:45:52'),
(2598, 'Adobe FreeHand ', 1, 0, '2016-01-21 06:46:00'),
(2599, 'Adobe Framemaker ', 1, 0, '2016-01-21 06:46:07'),
(2600, 'Adobe Flex ', 1, 0, '2016-01-21 06:46:16'),
(2601, 'Adobe Flash ', 1, 0, '2016-01-21 06:46:26'),
(2602, 'Adobe Fireworks ', 1, 0, '2016-01-21 06:46:33'),
(2603, 'Adobe Encore ', 1, 0, '2016-01-21 06:46:40'),
(2604, 'Adobe eLearning Suite ', 1, 0, '2016-01-21 06:46:48'),
(2605, 'Adobe Dreamweaver ', 1, 0, '2016-01-21 06:46:59'),
(2606, 'Adobe Director ', 1, 0, '2016-01-21 06:47:07'),
(2607, 'Adobe Digital Marketing Suite ', 1, 0, '2016-01-21 06:47:18'),
(2608, 'Adobe Creative Suite ', 1, 0, '2016-01-21 06:47:27'),
(2609, 'Adobe Contribute ', 1, 0, '2016-01-21 06:47:37'),
(2610, 'Adobe Content Server ', 1, 0, '2016-01-21 06:47:44'),
(2611, 'Adobe Captivate ', 1, 0, '2016-01-21 06:47:51'),
(2612, 'Adobe Business Catalyst ', 1, 0, '2016-01-21 06:48:00'),
(2613, 'Adobe Audition ', 1, 0, '2016-01-21 06:48:13'),
(2614, 'Adobe Analytics ', 1, 0, '2016-01-21 06:48:20'),
(2615, 'Adobe AIR ', 1, 0, '2016-01-21 06:48:31'),
(2616, 'Adobe After Effects ', 1, 0, '2016-01-21 06:48:41'),
(2617, 'Adobe Acrobat ', 1, 0, '2016-01-21 06:48:48'),
(2618, 'ADO.NET ', 1, 0, '2016-01-21 06:48:56'),
(2619, 'ActiveX Data Objects (ADO) ', 1, 0, '2016-01-21 06:49:03'),
(2620, 'Administrative Support ', 1, 0, '2016-01-21 06:49:16'),
(2621, 'ADK ', 1, 0, '2016-01-21 06:49:24'),
(2622, 'Adaptive Algorithms ', 1, 0, '2016-01-21 06:49:31'),
(2623, 'Adaco ', 1, 0, '2016-01-21 06:49:38'),
(2624, 'Ada ', 1, 0, '2016-01-21 06:49:56'),
(2625, 'Ad Servers ', 1, 0, '2016-01-21 06:50:03'),
(2626, 'Ad Posting ', 1, 0, '2016-01-21 06:50:10'),
(2627, 'Ad Planning & Buying ', 1, 0, '2016-01-21 06:50:17'),
(2628, 'ActiveX ', 1, 0, '2016-01-21 06:50:25'),
(2629, 'ActiveCollab ', 1, 0, '2016-01-21 06:50:34'),
(2630, 'Active Listening ', 1, 0, '2016-01-21 06:50:41'),
(2631, 'Active Directory ', 1, 0, '2016-01-21 06:50:49'),
(2632, 'ActionScript 3 ', 1, 0, '2016-01-21 06:51:00'),
(2633, 'ActionScript ', 1, 0, '2016-01-21 06:51:11'),
(2634, 'Actian ', 1, 0, '2016-01-21 06:51:23'),
(2635, 'ACT! ', 1, 0, '2016-01-21 06:51:33'),
(2636, 'Acrylic Painting ', 1, 0, '2016-01-21 06:51:40'),
(2637, 'Acronis ', 1, 0, '2016-01-21 06:51:47'),
(2638, 'Acquisitions ', 1, 0, '2016-01-21 06:51:54'),
(2639, 'ACPI ', 1, 0, '2016-01-21 06:52:01'),
(2640, 'ACDSee ', 1, 0, '2016-01-21 06:52:08'),
(2641, 'Accounts Receivable Management ', 1, 0, '2016-01-21 06:52:15'),
(2642, 'Accounts Payable Management ', 1, 0, '2016-01-21 06:52:23'),
(2643, 'AccountMate ', 1, 0, '2016-01-21 06:52:31'),
(2644, 'Accounting ', 1, 0, '2016-01-21 06:52:42'),
(2645, 'Account Management ', 1, 0, '2016-01-21 06:52:49'),
(2646, 'Academic Writing ', 1, 0, '2016-01-21 06:52:59'),
(2647, 'Absynth ', 1, 0, '2016-01-21 06:53:06'),
(2648, 'Ableton Live ', 1, 0, '2016-01-21 06:53:14'),
(2649, 'AbleCommerce ', 1, 0, '2016-01-21 06:53:26'),
(2650, 'Abaqus ', 1, 0, '2016-01-21 06:53:33'),
(2651, 'A/B Testing ', 1, 0, '2016-01-21 06:53:41'),
(2652, 'Ab Initio ', 1, 0, '2016-01-21 06:53:47'),
(2653, 'A2Billing ', 1, 0, '2016-01-21 06:53:57'),
(2654, '3ds Max ', 1, 0, '2016-01-21 06:54:04'),
(2655, '3D Systems ', 1, 0, '2016-01-21 06:54:11'),
(2656, '3D Scanning ', 1, 0, '2016-01-21 06:54:23'),
(2657, '3D Rigging ', 1, 0, '2016-01-21 06:54:30'),
(2658, '3D Rendering ', 1, 0, '2016-01-21 06:54:38'),
(2659, '3D Printing ', 1, 0, '2016-01-21 06:54:48'),
(2660, '3D Modeling ', 1, 0, '2016-01-21 06:54:56'),
(2661, '3D Design ', 1, 0, '2016-01-21 06:55:03'),
(2662, '3D Animation ', 1, 0, '2016-01-21 06:55:10'),
(2663, '2D Design ', 1, 0, '2016-01-21 06:55:40'),
(2664, '2D Animation ', 1, 0, '2016-01-21 06:55:49'),
(2665, '1ShoppingCart ', 1, 0, '2016-01-21 06:55:57'),
(2666, '.NET Remoting ', 1, 0, '2016-01-21 06:56:05'),
(2667, '.NET Framework ', 1, 0, '2016-01-21 06:56:14'),
(2668, 'NET Compact Framework ', 1, 0, '2016-01-21 06:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

CREATE TABLE `star` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `jobid` varchar(300) NOT NULL,
  `name` varchar(300) NOT NULL,
  `milestoneid` varchar(300) NOT NULL,
  `freelancerid` varchar(300) NOT NULL,
  `description` mediumtext NOT NULL,
  `progress` varchar(50) NOT NULL,
  `start_date` varchar(300) NOT NULL,
  `end_date` varchar(300) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `ticket_id` varchar(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `archieved` tinyint(1) DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` int(11) NOT NULL,
  `icon` varchar(300) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext NOT NULL,
  `item_order` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `membershipid` int(11) DEFAULT NULL,
  `withdrawalid` int(11) DEFAULT '0',
  `freelancerid` int(11) DEFAULT NULL,
  `paymentid` int(11) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL,
  `hash` varchar(300) DEFAULT NULL,
  `payment` decimal(8,2) DEFAULT '0.00',
  `deposit` decimal(8,2) DEFAULT '0.00',
  `locked` decimal(8,2) DEFAULT '0.00',
  `pending` decimal(8,2) DEFAULT '0.00',
  `balance` decimal(8,2) DEFAULT '0.00',
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `transaction_type` tinyint(4) DEFAULT NULL,
  `paypal` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trash`
--

CREATE TABLE `trash` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `delete_remove` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_session`
--

INSERT INTO `users_session` (`user_id`, `hash`, `created_at`, `updated_at`) VALUES
(0, 'd124cf096b4f33a9cc645c1c56479ae628e17a8c8e294da14a4b9fa5313887e2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2147483647, 'ffd5eaf6d8f3cac7170331f789e481d4991e0933259aaab599d55cba30ef032d', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_req`
--

CREATE TABLE `withdrawal_req` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `withdraw_amount` decimal(8,2) NOT NULL,
  `withdraw_gateway` varchar(255) NOT NULL,
  `withdraw_email` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `archieved` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attempts`
--
ALTER TABLE `attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_admin`
--
ALTER TABLE `auth_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_users`
--
ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_sub`
--
ALTER TABLE `cat_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD UNIQUE KEY `setting` (`setting`);

--
-- Indexes for table `config_admin`
--
ALTER TABLE `config_admin`
  ADD UNIQUE KEY `setting` (`setting`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_job`
--
ALTER TABLE `deleted_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_fund`
--
ALTER TABLE `deposit_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestone`
--
ALTER TABLE `milestone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pageinfo`
--
ALTER TABLE `pageinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments_settings`
--
ALTER TABLE `payments_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_freelancer`
--
ALTER TABLE `pay_freelancer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proof_image`
--
ALTER TABLE `proof_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proof_submit`
--
ALTER TABLE `proof_submit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings_client`
--
ALTER TABLE `ratings_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ccode` (`code`) USING BTREE;

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trash`
--
ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_req`
--
ALTER TABLE `withdrawal_req`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attempts`
--
ALTER TABLE `attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_admin`
--
ALTER TABLE `auth_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_users`
--
ALTER TABLE `auth_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cat`
--
ALTER TABLE `cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cat_sub`
--
ALTER TABLE `cat_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `deleted_job`
--
ALTER TABLE `deleted_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_fund`
--
ALTER TABLE `deposit_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `milestone`
--
ALTER TABLE `milestone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pageinfo`
--
ALTER TABLE `pageinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments_settings`
--
ALTER TABLE `payments_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pay_freelancer`
--
ALTER TABLE `pay_freelancer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proof_image`
--
ALTER TABLE `proof_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proof_submit`
--
ALTER TABLE `proof_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings_client`
--
ALTER TABLE `ratings_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2669;

--
-- AUTO_INCREMENT for table `star`
--
ALTER TABLE `star`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trash`
--
ALTER TABLE `trash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_req`
--
ALTER TABLE `withdrawal_req`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
