<?php
/**
 * Register navigation menus
 *
 * @link https://codex.wordpress.org/Function_Reference/register_nav_menus
 * @package Internship_poltava_02
 */

add_action( 'after_setup_theme', 'register_theme_menus' );

/**
 * register_theme_menus
 *
 * @return void
 */
function register_theme_menus() {
	register_nav_menus(
		array(
			'primary'     => __( 'Primary Menu', 'wp_dev' ),
			'footer_menu' => __( 'Footer Menu', 'wp_dev' ),
		)
	);
}
