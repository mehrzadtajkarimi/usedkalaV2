<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/tether.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/hidemaxlistitem.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/hidemaxlistitem.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/scrollup.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/waypoints-sticky.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/pace.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/slick.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/scripts.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/plugins/WOW/dist/wow.min.js"></script>
<script src="<?= asset_url() ?>Backend/plugins/select2/select2.full.min.js"></script>
<script type="text/javascript" src="<?= asset_url() ?>Frontend/js/ukscripts2.js"></script>
<script>
<?php
if (isset($onLoadMsg))
	echo 'msgbox("'.$onLoadMsg.'");';
?>
$(document).ready(function() {
	new WOW().init();
});
</script>