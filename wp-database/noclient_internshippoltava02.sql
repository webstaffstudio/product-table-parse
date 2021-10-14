CREATE TABLE IF NOT EXISTS `zhrug_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `zhrug_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



INSERT INTO `zhrug_comments` (`comment_ID`,`comment_post_ID`,`comment_author`,`comment_author_email`,`comment_author_url`,`comment_author_IP`,`comment_date`,`comment_date_gmt`,`comment_content`,`comment_karma`,`comment_approved`,`comment_agent`,`comment_type`,`comment_parent`,`user_id`) VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','comment',0,0);



INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (1,'siteurl','http://no-client-internship-poltava-02.local','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (2,'home','http://no-client-internship-poltava-02.local','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (3,'blogname','internship-poltava-02','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (4,'blogdescription','Just another WordPress site','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (5,'users_can_register','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (6,'admin_email','developer@wp-dev.space','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (7,'start_of_week','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (8,'use_balanceTags','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (9,'use_smilies','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (10,'require_name_email','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (11,'comments_notify','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (13,'rss_use_excerpt','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (17,'mailserver_port','110','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (18,'default_category','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (19,'default_comment_status','open','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (20,'default_ping_status','open','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (21,'default_pingback_flag','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (22,'posts_per_page','10','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (23,'date_format','F j, Y','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (24,'time_format','g:i a','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (25,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (26,'comment_moderation','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (27,'moderation_notify','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (28,'permalink_structure','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (29,'rewrite_rules','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (30,'hack_file','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (32,'moderation_keys','','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (33,'active_plugins','a:0:{}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (34,'category_base','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (36,'comment_max_links','2','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (37,'gmt_offset','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (38,'default_email_category','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (39,'recently_edited','','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (40,'template','internship-poltava-02','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (41,'stylesheet','internship-poltava-02','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (42,'comment_registration','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (43,'html_type','text/html','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (44,'use_trackback','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (45,'default_role','subscriber','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (46,'db_version','48748','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (47,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (48,'upload_path','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (49,'blog_public','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (50,'default_link_category','2','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (51,'show_on_front','posts','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (52,'tag_base','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (53,'show_avatars','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (54,'avatar_rating','G','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (55,'upload_url_path','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (56,'thumbnail_size_w','150','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (57,'thumbnail_size_h','150','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (58,'thumbnail_crop','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (59,'medium_size_w','300','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (60,'medium_size_h','300','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (61,'avatar_default','mystery','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (62,'large_size_w','1024','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (63,'large_size_h','1024','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (64,'image_default_link_type','none','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (65,'image_default_size','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (66,'image_default_align','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (67,'close_comments_for_old_posts','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (68,'close_comments_days_old','14','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (69,'thread_comments','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (70,'thread_comments_depth','5','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (71,'page_comments','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (72,'comments_per_page','50','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (73,'default_comments_page','newest','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (74,'comment_order','asc','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (75,'sticky_posts','a:0:{}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (76,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (77,'widget_text','a:0:{}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (78,'widget_rss','a:0:{}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (79,'uninstall_plugins','a:0:{}','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (80,'timezone_string','','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (81,'page_for_posts','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (82,'page_on_front','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (83,'default_post_format','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (84,'link_manager_enabled','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (85,'finished_splitting_shared_terms','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (86,'site_icon','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (87,'medium_large_size_w','768','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (88,'medium_large_size_h','0','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (89,'wp_page_for_privacy_policy','3','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (90,'show_comments_cookies_opt_in','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (91,'admin_email_lifespan','1618305756','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (92,'disallowed_keys','','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (93,'comment_previously_approved','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (94,'auto_plugin_theme_update_emails','a:0:{}','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (95,'initial_db_version','48748','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (96,'zhrug_user_roles','a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:10:\"maintainer\";a:2:{s:4:\"name\";s:10:\"Maintainer\";s:12:\"capabilities\";a:39:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:9:\"customize\";b:1;s:18:\"edit_theme_options\";b:1;s:14:\"manage_options\";b:1;s:10:\"list_users\";b:1;s:20:\"wpseo_manage_options\";b:1;}}}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (97,'fresh_site','1','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (98,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (99,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (100,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (101,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (102,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (103,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (104,'cron','a:3:{i:1602753757;a:5:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1602840157;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (105,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (106,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (107,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (108,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (109,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (110,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (111,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (112,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (113,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (114,'_transient_doing_cron','1602753757.4275219440460205078125','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (115,'_site_transient_timeout_theme_roots','1602755578','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (116,'_site_transient_theme_roots','a:2:{s:21:\"internship-poltava-02\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (118,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1602753772;s:15:\"version_checked\";s:5:\"5.5.1\";s:12:\"translations\";a:0:{}}','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (120,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1602753774;s:7:\"checked\";a:2:{s:16:\"beetroot-starter\";s:5:\"2.0.0\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}','no');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (125,'theme_mods_twentytwenty','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1602753778;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (126,'current_theme','Internship_poltava_02','yes');
INSERT INTO `zhrug_options` (`option_id`,`option_name`,`option_value`,`autoload`) VALUES (127,'theme_switched','twentytwenty','yes');

INSERT INTO `zhrug_postmeta` (`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES (1,2,'_wp_page_template','default');
INSERT INTO `zhrug_postmeta` (`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES (2,3,'_wp_page_template','default');

INSERT INTO `zhrug_posts` (`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES (1,1,'2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','',0,'/?p=1',0,'post','',1);
INSERT INTO `zhrug_posts` (`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES (2,1,'2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','',0,'/?page_id=2',0,'page','',0);
INSERT INTO `zhrug_posts` (`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES (3,1,'2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: .</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2020-10-15 09:22:37.000','2020-10-15 09:22:37.000','',0,'/?page_id=3',0,'page','',0);

INSERT INTO `zhrug_term_relationships` (`object_id`,`term_taxonomy_id`,`term_order`) VALUES (1,1,0);

INSERT INTO `zhrug_term_taxonomy` (`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES (1,1,'category','',0,1);



INSERT INTO `zhrug_terms` (`term_id`,`name`,`slug`,`term_group`) VALUES (1,'Uncategorized','uncategorized',0);

INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (1,1,'nickname','developer_internship-poltava-02');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (2,1,'first_name','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (3,1,'last_name','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (4,1,'description','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (5,1,'rich_editing','true');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (6,1,'syntax_highlighting','true');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (7,1,'comment_shortcuts','false');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (8,1,'admin_color','fresh');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (9,1,'use_ssl','0');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (10,1,'show_admin_bar_front','true');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (11,1,'locale','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (12,1,'zhrug_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (13,1,'zhrug_user_level','10');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (14,1,'dismissed_wp_pointers','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (15,1,'show_welcome_panel','1');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (16,2,'nickname','client');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (17,2,'first_name','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (18,2,'last_name','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (19,2,'description','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (20,2,'rich_editing','true');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (21,2,'syntax_highlighting','true');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (22,2,'comment_shortcuts','false');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (23,2,'admin_color','fresh');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (24,2,'use_ssl','0');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (25,2,'show_admin_bar_front','true');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (26,2,'locale','');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (27,2,'zhrug_capabilities','a:1:{s:10:\"maintainer\";b:1;}');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (28,2,'zhrug_user_level','7');
INSERT INTO `zhrug_usermeta` (`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES (29,2,'dismissed_wp_pointers','');

INSERT INTO `zhrug_users` (`ID`,`user_login`,`user_pass`,`user_nicename`,`user_email`,`user_url`,`user_registered`,`user_activation_key`,`user_status`,`display_name`) VALUES (1,'developer_internship-poltava-02','$P$B5la0Ye9b0DiUeAYU7mySP1DeCuZzo1','developer_internship-poltava-02','developer@wp-dev.space','','2020-10-15 09:22:37.000','',0,'developer_internship-poltava-02');
INSERT INTO `zhrug_users` (`ID`,`user_login`,`user_pass`,`user_nicename`,`user_email`,`user_url`,`user_registered`,`user_activation_key`,`user_status`,`display_name`) VALUES (2,'client','$P$Bo62ww7zH4yzAQcP.1CU9wS0Xh7Bmc/','client','client@wp-dev.space','','2020-10-15 09:22:56.000','',0,'client');