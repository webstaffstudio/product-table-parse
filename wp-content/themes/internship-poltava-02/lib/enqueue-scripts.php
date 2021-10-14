<?php
/**
 * Enqueue all styles and scripts.
 *
 * Learn more about enqueue_script: {@link https://codex.wordpress.org/Function_Reference/wp_enqueue_script}
 * Learn more about enqueue_style: {@link https://codex.wordpress.org/Function_Reference/wp_enqueue_style}
 *
 * @package Internship_poltava_02
 */

if (!function_exists('internship_poltava_02_scripts')) :
	/**
	 * internship_poltava_02_scripts
	 *
	 * @return void
	 */
	function internship_poltava_02_scripts()
	{
		// Enqueue the main Stylesheet.
		wp_enqueue_style('main-stylesheet', asset_path('styles/main.css'), false, '1.0.0', 'all');


		// Enqueue the main JS file.
		wp_enqueue_script('main-javascript', asset_path('scripts/main.js'), ['jquery'], '1.0.0', true);
		wp_enqueue_script('upload-table-js', get_stylesheet_directory_uri().'/send-order-module.js', ['jquery'], '1.0.0', true);

		// Throw variables from back to front end.
		$uploadVars = array(
			'home' => get_home_url(),
			'isHome' => is_front_page(),
			'ajaxUrl' => site_url() . '/wp-admin/admin-ajax.php'
		);
		wp_localize_script('upload-table-js', 'moduleVars', $uploadVars);

		$theme_vars = array(
			'home' => get_home_url(),
			'isHome' => is_front_page(),
		);
		wp_localize_script('main-javascript', 'themeVars', $theme_vars);


		// Comments reply script
		if (is_singular() && comments_open()) :
			wp_enqueue_script('comment-reply');
		endif;
	}

	add_action('wp_enqueue_scripts', 'internship_poltava_02_scripts');
	add_action('admin_enqueue_scripts', 'include_sheet_module');

	function include_sheet_module()
	{
		// Deregister the jquery version bundled with WordPress.
		wp_deregister_script('jquery');

		// CDN hosted jQuery placed in the header, as some plugins require that jQuery is loaded in the header.
		wp_enqueue_script('jquery', 'https://code.jquery.com/jquery-2.2.4.min.js', [], '2.2.4', false);

		if (!did_action('wp_enqueue_media')) {
			wp_enqueue_media();
		}
		// Throw variables from back to front end.
		$adminVars = array(
			'home' => get_home_url(),
			'ajaxUrl' => site_url() . '/wp-admin/admin-ajax.php',
		);
		wp_enqueue_script('upload-module', get_stylesheet_directory_uri() . '/sheet-module.js', array('jquery'));
		wp_localize_script('upload-module', 'adminVars', $adminVars);
	}
endif;
