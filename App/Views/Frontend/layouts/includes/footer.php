<div class="col-full">
  <div class="before-footer-wrap">
    <div class="col-full">
      <div class="footer-newsletter">
        <div class="media">
          <i class="footer-newsletter-icon tm tm-newsletter"></i>
          <div class="media-body" style="direction: rtl;">
            <div class="clearfix">
              <div class="newsletter-header">
                <h5 class="newsletter-title">عضویت در خبرنامه</h5>
                <span class="newsletter-marketing-text">باعضویت در خبرنامه ما از آخرین اخبار
                  <strong> دنیای فناوری</strong>
                  مطلع شوید
                </span>
              </div>
              <!-- .newsletter-header -->
              <div class="newsletter-body">
                <form class="newsletter-form">
                  <input type="text" placeholder="رایانامه خود را وارد کنید" style="font-family: 'IRANSans';">
                  <button class="button" type="button" style="font-family: 'IRANSans';">عضویت</button>
                </form>
              </div>
              <!-- .newsletter body -->
            </div>
            <!-- .clearfix -->
          </div>
          <!-- .media-body -->
        </div>
        <!-- .media -->
      </div>
      <!-- .footer-newsletter -->
      <div class="footer-social-icons">
        <ul class="social-icons nav">
          <li class="nav-item">
            <a class="sm-icon-label-link nav-link" href="#">
              <i class="fa fa-facebook"></i> Facebook</a>
          </li>
          <li class="nav-item">
            <a class="sm-icon-label-link nav-link" href="#">
              <i class="fa fa-twitter"></i> Twitter</a>
          </li>
          <li class="nav-item">
            <a class="sm-icon-label-link nav-link" href="#">
              <i class="fa fa-google-plus"></i> Google+</a>
          </li>
          <li class="nav-item">
            <a class="sm-icon-label-link nav-link" href="#">
              <i class="fa fa-vimeo-square"></i> Vimeo</a>
          </li>
          <li class="nav-item">
            <a class="sm-icon-label-link nav-link" href="#">
              <i class="fa fa-rss"></i> RSS</a>
          </li>
        </ul>
      </div>
      <!-- .footer-social-icons -->
    </div>
    <!-- .col-full -->
  </div>
  <!-- .before-footer-wrap -->
  <div class="footer-widgets-block">
    <div class="row">
      <div class="footer-contact">
        <div class="footer-logo">
          <a href="home-v1.html" class="custom-logo-link" rel="home">
            <img src="<?= asset_url() ?>Frontend/images/uklogo.png" alt="یوزدکالا">
          </a>
        </div>
        <!-- .footer-logo -->
        <div class="contact-payment-wrap">
          <div class="footer-contact-info">
            <div class="media">
              <span class="media-right icon media-middle">
                <i class="tm tm-call-us-footer"></i>
              </span>
              <div class="media-body" style="direction: rtl;">
                <span class="call-us-title">شماره تماس</span>
                <a href="tel:+982188343580"><span class="call-us-text" dir="ltr">021-88343580</span></a>
                <address class="footer-contact-address">تهران، خیابان قائم مقام فراهانی، میدان شعاع، پلاک یک، واحد دو</address>
                <!-- <a href="#" class="footer-address-map-link">
                                                <i class="tm tm-map-marker"></i>Find us on map</a> -->
              </div>
              <!-- .media-body -->
            </div>
            <!-- .media -->
          </div>
          <!-- .footer-contact-info -->
          <div class="footer-payment-info">
            <div class="media">
              <!-- <span class="media-right icon media-middle">
                                            <i class="tm tm-safe-payments"></i>
                                        </span> -->
              <div class="media-body" style="direction: rtl;">
                <!-- <h5 class="footer-payment-info-title">پرداخت ایمن و مطمئن</h5>
                                            <div class="footer-payment-icons">
                                                <ul class="list-payment-icons nav">
                                                    <li class="nav-item">
                                                        <img class="payment-icon-image"
                                                            src="<?= asset_url() ?>Frontend/images/credit-cards/1.png"
                                                            alt="mastercard" />
                                                    </li>
                                                </ul>
                                            </div> -->
                <!-- .footer-payment-icons -->
                <!-- <div class="footer-secure-by-info">
                                                <h6 class="footer-secured-by-title">Secured by:</h6>
                                                <ul class="footer-secured-by-icons">
                                                    <li class="nav-item">
                                                        <img class="secure-icons-image"
                                                            src="<?= asset_url() ?>Frontend/images/secured-by/norton.svg" alt="norton" />
                                                    </li>
                                                    <li class="nav-item">
                                                        <img class="secure-icons-image"
                                                            src="<?= asset_url() ?>Frontend/images/secured-by/mcafee.svg" alt="mcafee" />
                                                    </li>
                                                </ul>
                                            </div> -->
                <!-- .footer-secure-by-info -->
              </div>
              <!-- .media-body -->
            </div>
            <!-- .media -->
          </div>
          <!-- .footer-payment-info -->
        </div>
        <!-- .contact-payment-wrap -->
      </div>
      <!-- .footer-contact -->
      <div class="footer-widgets">
        <div class="columns">
          <aside class="widget clearfix">
            <div class="body">
              <h4 class="widget-title">دسته بندی محصولات</h4>
              <div class="menu-footer-menu-1-container">
                <ul id="menu-footer-menu-1" class="menu">
					<?php
					foreach ($categoryLevelOne as $valueLevelOne)
					{
						if ($valueLevelOne['status'] == 1 &&  $valueLevelOne['type'] == 0)
						{
					?>
                  <li class="menu-item">
                    <a href="<?= base_url() ?>category/<?= $valueLevelOne['slug'] ?>"><?= $valueLevelOne['name'] ?></a>
                  </li>
					<?php
						}
					}
					?>
                </ul>
              </div>
              <!-- .menu-footer-menu-1-container -->
            </div>
            <!-- .body -->
          </aside>
          <!-- .widget -->
        </div>
        <!-- .columns -->
		<?php
		if (isset($sale_products) && count($sale_products)>0)
		{
		?>
        <div class="columns">
          <aside class="widget clearfix">
            <div class="body">
              <h4 class="widget-title">پرفروش ترین محصولات</h4>
              <div class="menu-footer-menu-2-container">
                <ul id="menu-footer-menu-2" class="menu">
					<?php
					$counter=0;
					foreach ($sale_products as $productRow)
					{
						$counter++;
					?>
                  <li class="menu-item">
                    <a href="<?= base_url() ?>product/<?= $productRow['product_id'] ?>/<?= $productRow['slug'] ?>"><?= $productRow['title'] ?></a>
                  </li>
					<?php
						if ($counter==6) break;
					}
					?>
                </ul>
              </div>
              <!-- .menu-footer-menu-2-container -->
            </div>
            <!-- .body -->
          </aside>
          <!-- .widget -->
        </div>
		<?php
		}
		?>
        <!-- .columns -->
        <div class="columns">
          <aside class="widget clearfix">
            <div class="body">
              <h4 class="widget-title">بخش مشتریان</h4>
              <div class="menu-footer-menu-3-container">
                <ul id="menu-footer-menu-3" class="menu">
                  <li class="menu-item">
                    <a href="<?= base_url() ?>profile">حساب کاربری</a>
                  </li>
                  <li class="menu-item">
                    <a href="<?= base_url() ?>profile">پیگیری ارسال</a>
                  </li>
                  <li class="menu-item">
                    <a href="<?= base_url() ?>profile">خریدها</a>
                  </li>
                  <li class="menu-item">
                    <a href="<?= base_url() ?>wishlist">علاقه مندی ها</a>
                  </li>
                </ul>
              </div>
              <!-- .menu-footer-menu-3-container -->
            </div>
            <!-- .body -->
          </aside>
          <!-- .widget -->
        </div>
        <!-- .columns -->
      </div>
      <!-- .footer-widgets -->
    </div>
    <!-- .row -->
  </div>
  <!-- .footer-widgets-block -->
  <div class="site-info">
    <div class="col-full">
      <div class="copyright">تمامی حقوق برای یوزدکالا محفوظ میباشد.</div>
      <!-- .copyright -->
      <!-- .credit -->
    </div>
    <!-- .col-full -->
  </div>
  <!-- .site-info -->
</div>

<div id="msgbox" style="position: fixed; height: 100%; width: 100%; top:0; left:0; display: none; z-index: 1000">
	<div style="position: absolute; width: 100%; height: 100%; left:0; top:0; background-color: black; opacity: 0.6" onclick="$('#msgbox').hide();"></div>
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%); width: 300px; background-color: white; border: 1px gray solid; border-radius: 10px; padding: 10px; box-sizing: border-box;">
		<table style="height: 120px; width: 100%; margin: 0;" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" style="background-color: #F5F5F5; padding: 5px;">
				<p style="direction: rtl; font-family: IRANSans; font-size: 12px; text-align: right; color: black" id="msgboxnote"></p>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td valign="bottom" style="padding: 0; vertical-align: bottom">
					<p dir="ltr" align="left" style="text-align: left; font-family: IRANSans; font-size: 12px;" id="msgboxtick"><a style="color: black" onkeyup="if (event.keyCode == 27) $('#msgbox').hide();" id="msgboxbutton" href="javascript:void(0);" onclick="$('#msgbox').hide();">بستن</a></p>
				</td>
			</tr>
		</table>
	</div>
</div>