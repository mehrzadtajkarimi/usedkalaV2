<?php ini_set('display_errors', '0'); ?>
	<title><?= $headSeoTitle ?? 'فروشگاه اینترنتی یوزدکالا'?></title>
	<meta name="description" content="<?= strip_tags($headSeoDescription) ?? ''?>">
	<meta name="robots" content="<?= $headSeoRobots==""?"index, folow":$headSeoRobots ?>"/>
	<link rel="canonical" href="<?= $headSeoCanonical==""?"https://".$_SERVER['HTTP_HOST'].rawurldecode($_SERVER['REQUEST_URI']):$headSeoCanonical ?>"/>
<?php ini_set('display_errors', '1'); ?>

	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">

	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/bootstrap.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/font-awesome.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/bootstrap-grid.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/bootstrap-reboot.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/font-techmarket.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/slick.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/techmarket-font-awesome.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/slick-style.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/animate.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/style.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/style_uk.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/colors/flat-green.css" media="all" />
	<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,900" rel="stylesheet">
	<link rel="shortcut icon" href="<?= asset_url() ?>Frontend/images/ukfav-icon.png">
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/css/my.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Backend/plugins/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<?= asset_url() ?>Frontend/plugins/select2-bootstrap4.min.css">
	<link rel="stylesheet" href="<?= asset_url() ?>Backend/plugins/datepicker/persian-datepicker.min.css">

	<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/jquery.min.js"></script>
	<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/ukscripts.js"></script>
