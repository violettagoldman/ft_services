<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'G`w^9c0#R_Q(?Uv*0okRd|JhwWZKN0=rDmF/gI/BX*BD!8uM1V^gdwAY`k+jykU@' );
define( 'SECURE_AUTH_KEY',  '@7I0KV{c?3s]x},d4>8Hf+ZdNwFunFZ>I6*Dk}B|Q`HBf Y;nbv{@)*LOe`-kpin' );
define( 'LOGGED_IN_KEY',    '`vJ9.z4YqEqtY(%R+A>9Noo@A^h#K!Ow0lDr~NNWm{U3,[Y@7$mVd]FmvvueeXKd' );
define( 'NONCE_KEY',        '+K3s05kyk!dG`yzx&:Oh)%#+|uzcR$9P!;0PYo.`Sc/0+{tSN%rZ~_5OrqB?Nos)' );
define( 'AUTH_SALT',        '<<MmYK:S=W}c1)!YW7Mj(o^>$*Z78Kkuv%ch>KY]Rtx1GY[;r{26)jHH sgvp[H>' );
define( 'SECURE_AUTH_SALT', 'bDt&u]3f0}1`%^:UA$r$IC.6AJl]Xs&Ic2tO Go9LgtXqa=7qSI8(;.qD3E,+Pn2' );
define( 'LOGGED_IN_SALT',   'l_MSJby=5e3nw8T1iWNca&Y U692uNUz-7j~m8#i1:e;&c~fM[uqe|NM;0W16R5W' );
define( 'NONCE_SALT',       'fZc|Y#DJ+bE2JyAw>7MI!Q2^]oMmNczIyCJ*Y}CS&^3%E<-lVd#jbF`P<CY9tzzR' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
