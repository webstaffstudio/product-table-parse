<?php
define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');
define('WP_HOME', getenv('WP_HOME'));
define('WP_SITEURL', getenv('WP_SITEURL'));
define('FS_METHOD', 'direct');
define('AUTH_KEY',         '!3u)q7C*{S9U/iMT-X?-wR1H|1u )m RTcw7,284h{Wt4qrtp/1::eq#XVZ0x~7-');
define('SECURE_AUTH_KEY',  'HZBpra&vo6Y5~+b|e`Fp<>vQz5D3D|ab$,lM|Va15kP|Cpgd%IsP|`&I@yF/q$uD');
define('LOGGED_IN_KEY',    'V3Ez]<~j@Ymtd6}UXe0GG$7zcYvu#`9-yMLK9:LVj~_Y+hE9i])kep,**eaG=a{X');
define('NONCE_KEY',        '>?f><oF]VJ5odlA0WhFI(lR?]R 9+)6#[3hr:d$MH9[$.)tBK^ukHkGl)DMM[rM=');
define('AUTH_SALT',        '>X><]}x_dQJL9Ik9*/r=gE@WB_=/Fvo7iixpoUpY)twFJN2l&<t%no18p+alEm.<');
define('SECURE_AUTH_SALT', 'b;zmb2Oq_#5k2]nJJeT%lP<D}U_?5X8;e7mB*u9||_pu4Y8(.UD(w~KbIMt2@0B+');
define('LOGGED_IN_SALT',   '7j%lhxFdy&}`o9g*X~V**l*pw=nZMfGC!39B5ckG+~l,%)yLdQG.nIG%eVc Pp+E');
define('NONCE_SALT',       ':r3G<Fb6WyuWyw/Nj1$(,|; k]|t3N.S/W)TW:h?~}9:Eq+w--VCMW@KKT0}.(Xg');

define('WP_ALLOW_REPAIR', true);
$table_prefix  = 'zhrug_';
define('WP_DEBUG', true);
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
$_SERVER['HTTPS'] = 'on';
}
if ( !defined('ABSPATH') )
define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');