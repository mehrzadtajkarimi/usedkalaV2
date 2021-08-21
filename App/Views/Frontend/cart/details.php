<div class="content-area" id="primary">
    <main class="site-main" id="main">
        <div class="type-page hentry">
            <div class="entry-content">
                <div class="woocommerce">
                    <div class="woocommerce-info">مشتری قدیمی هستید؟ <a data-toggle="collapse" href="#login-form" aria-expanded="false" aria-controls="login-form" class="showlogin">برای ورود اینجا را کلیک کنید</a>
                    </div>
                    <div class="collapse" id="login-form">
                        <form method="post" class="woocomerce-form woocommerce-form-login login">
                            <p class="before-login-text">
                                اگر قبلا از فروشگاه ما خرید کرده اید، لطفا مشخصات ورود خود را در
                                فیلد های زیر وارد کنید.
                            </p>
                            <p>اگر مشتری جدید هستید، لطفاً به بخش صورتحساب و حمل و نقل بروید.</p>
                            <p class="form-row form-row-first">
                                <label for="username">نام کاربری یا رایانامه
                                    <span class="required">*</span>
                                </label>
                                <input type="text" id="username" name="username" class="input-text">
                            </p>
                            <p class="form-row form-row-last">
                                <label for="password">گذرواژه
                                    <span class="required">*</span>
                                </label>
                                <input type="password" id="password" name="password" class="input-text">
                            </p>
                            <div class="clear"></div>
                            <p class="form-row">
                                <input type="submit" value="ورود" name="login" class="button">
                                <label class="woocommerce-form__label woocommerce-form__label-for-checkbox inline">
                                    <input type="checkbox" value="forever" id="rememberme" name="rememberme" class="woocommerce-form__input woocommerce-form__input-checkbox">
                                    <span>مرا به خاطر بسپار</span>
                                </label>
                            </p>
                            <p class="lost_password">
                                <a href="#" class=" text-danger">گذرواژه خود را فراموش کرده اید؟</a>
                            </p>
                            <div class="clear"></div>
                        </form>
                    </div>
                    <!-- .collapse -->
                    <div class="woocommerce-info">کد تخفیف دارید؟ <a data-toggle="collapse" href="#checkoutCouponForm" aria-expanded="false" aria-controls="checkoutCouponForm" class="showlogin">اینجا را کلیک
                            کنید</a>
                    </div>
                    <div class="collapse" id="checkoutCouponForm">
                        <form method="post" class="checkout_coupon">
                            <p class="form-row form-row-first">
                                <input type="text" value="" id="coupon_code" placeholder="کد تخفیف" class="input-text" name="coupon_code">
                            </p>
                            <p class="form-row form-row-last">
                                <input type="submit" value="افزودن کد تخفیف" name="apply_coupon" class="button">
                            </p>
                            <div class="clear"></div>
                        </form>
                    </div>
                    <!-- .collapse -->
                    <form action="#" class="checkout woocommerce-checkout" method="post" name="checkout">
                        <div id="customer_details" class="col2-set">
                            <div class="col-1">
                                <div class="woocommerce-billing-fields">
                                    <h3>جزئیات صورتحساب</h3>
                                    <div class="woocommerce-billing-fields__field-wrapper-outer">
                                        <div class="woocommerce-billing-fields__field-wrapper">
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required woocommerce-invalid woocommerce-invalid-required-field">
                                                <label class="" for="billing_first_name">نام
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
                                            </p>
                                            <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                                                <label class="" for="billing_last_name">نام خانوادگی
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_last_name" name="billing_last_name" class="input-text ">
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_company_field" class="form-row form-row-wide">
                                                <label class="" for="billing_company">نام
                                                    شرکت</label>
                                                <input type="text" value="" placeholder="" id="billing_company" name="billing_company" class="input-text ">
                                            </p>
                                            <p id="billing_country_field" class="form-row form-row-wide validate-required validate-email">
                                                <label class="" for="billing_country">استان
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select autocomplete="country" class="country_to_state country_select select2-hidden-accessible" id="billing_country" name="billing_country" tabindex="-1" aria-hidden="true">
                                                    <option value="0">لطفا استان را انتخاب نمایید
                                                    </option>
                                                    <option value="1">تهران</option>
                                                    <option value="2">گیلان</option>
                                                    <option value="3">آذربایجان شرقی</option>
                                                    <option value="4">خوزستان</option>
                                                    <option value="5">فارس</option>
                                                    <option value="6">اصفهان</option>
                                                    <option value="7">خراسان رضوی</option>
                                                    <option value="8">قزوین</option>
                                                    <option value="9">سمنان</option>
                                                    <option value="10">قم</option>
                                                    <option value="11">مرکزی</option>
                                                    <option value="12">زنجان</option>
                                                    <option value="13">مازندران</option>
                                                    <option value="14">گلستان</option>
                                                    <option value="15">اردبیل</option>
                                                    <option value="16">آذربایجان غربی</option>
                                                    <option value="17">همدان</option>
                                                    <option value="18">کردستان</option>
                                                    <option value="19">کرمانشاه</option>
                                                    <option value="20">لرستان</option>
                                                    <option value="21">بوشهر</option>
                                                    <option value="22">کرمان</option>
                                                    <option value="23">هرمزگان</option>
                                                    <option value="24">چهارمحال و بختیاری</option>
                                                    <option value="25">یزد</option>
                                                    <option value="26">سیستان و بلوچستان</option>
                                                    <option value="27">ایلام</option>
                                                    <option value="28">کهگلویه و بویراحمد</option>
                                                    <option value="29">خراسان شمالی</option>
                                                    <option value="30">خراسان جنوبی</option>
                                                    <option value="31">البرز</option>
                                                </select>
                                            </p>
                                            <p id="billing_state_field" class="form-row form-row-wide validate-required validate-email">
                                                <label class="" for="billing_state">شهر / روستا
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select data-placeholder="" autocomplete="address-level1" class="state_select select2-hidden-accessible" id="billing_state" name="billing_state" tabindex="-1" aria-hidden="true">
                                                    <option value="">شهر / روستا خود را انتخاب کنید</option>
                                                    <option value="AP">Andhra Pradesh</option>
                                                    <option value="AR">Arunachal Pradesh</option>
                                                    <option value="AS">Assam</option>
                                                    <option value="BR">Bihar</option>
                                                    <option value="CT">Chhattisgarh</option>
                                                    <option value="GA">Goa</option>
                                                    <option value="GJ">Gujarat</option>
                                                    <option value="HR">Haryana</option>
                                                    <option value="HP">Himachal Pradesh</option>
                                                    <option value="JK">Jammu and Kashmir</option>
                                                    <option value="JH">Jharkhand</option>
                                                    <option value="KA">Karnataka</option>
                                                    <option value="KL">Kerala</option>
                                                    <option value="MP">Madhya Pradesh</option>
                                                    <option value="MH">Maharashtra</option>
                                                    <option value="MN">Manipur</option>
                                                    <option value="ML">Meghalaya</option>
                                                    <option value="MZ">Mizoram</option>
                                                    <option value="NL">Nagaland</option>
                                                    <option value="OR">Orissa</option>
                                                    <option value="PB">Punjab</option>
                                                    <option value="RJ">Rajasthan</option>
                                                    <option value="SK">Sikkim</option>
                                                    <option value="TN">Tamil Nadu</option>
                                                    <option value="TS">Telangana</option>
                                                    <option value="TR">Tripura</option>
                                                    <option value="UK">Uttarakhand</option>
                                                    <option value="UP">Uttar Pradesh</option>
                                                    <option value="WB">West Bengal</option>
                                                    <option value="AN">Andaman and Nicobar Islands
                                                    </option>
                                                    <option value="CH">Chandigarh</option>
                                                    <option value="DN">Dadra and Nagar Haveli
                                                    </option>
                                                    <option value="DD">Daman and Diu</option>
                                                    <option value="DL">Delhi</option>
                                                    <option value="LD">Lakshadeep</option>
                                                    <option value="PY">Pondicherry (Puducherry)
                                                    </option>
                                                </select>
                                            </p>
                                            <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_city">شهر / روستا
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_city" name="billing_city" class="input-text ">
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">نشانی پستی
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <textarea id="billing_address_1" name="billing_address_1" class="input-text "></textarea>
                                            </p>
                                            <p id="billing_postcode_field" class="form-row form-row-wide address-field validate-postcode validate-required" data-o_class="form-row form-row form-row-last address-field validate-required validate-postcode">
                                                <label class="" for="billing_postcode">کد پستی
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_postcode" name="billing_postcode" class="input-text ">
                                            </p>
                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">تلفن
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="tel" value="" placeholder="" id="billing_phone" name="billing_phone" class="input-text ">
                                            </p>
                                            <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                <label class="" for="billing_email">رایانامه
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="email" value="" placeholder="" id="billing_email" name="billing_email" class="input-text ">
                                            </p>
                                        </div>
                                    </div>
                                    <!-- .woocommerce-billing-fields__field-wrapper-outer -->
                                </div>
                                <!-- .woocommerce-billing-fields -->
                                <div class="woocommerce-account-fields">
                                    <p class="form-row form-row-wide woocommerce-validated">
                                        <label class="collapsed woocommerce-form__label woocommerce-form__label-for-checkbox checkbox" data-toggle="collapse" data-target="#createLogin" aria-controls="createLogin">
                                            <input type="checkbox" value="1" name="createaccount" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox">
                                            <span>حساب کاربری ایجاد می کنید؟</span>
                                        </label>
                                    </p>
                                    <div class="create-account collapse" id="createLogin">
                                        <p data-priority="" id="account_password_field" class="form-row validate-required woocommerce-invalid woocommerce-invalid-required-field">
                                            <label class="" for="account_password">گذرواژه حساب کاربری جدید
                                                <abbr title="required" class="required">*</abbr>
                                            </label>
                                            <input type="password" value="" placeholder="گذرواژه" id="account_password" name="account_password" class="input-text ">
                                        </p>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <!-- .woocommerce-account-fields -->
                            </div>
                            <!-- .col-1 -->
                            <div class="col-2">
                                <div class="woocommerce-shipping-fields">
                                    <h3 id="ship-to-different-address">
                                        <label class="collapsed woocommerce-form__label woocommerce-form__label-for-checkbox checkbox" data-toggle="collapse" data-target="#shipping-address" aria-controls="shipping-address">
                                            <input id="ship-to-different-address-checkbox" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox" type="checkbox" value="1" name="ship_to_different_address">
                                            <span>میخواهید به آدرس دیگری ارسال کنید؟</span>
                                        </label>
                                    </h3>
                                    <div class="shipping_address collapse" id="shipping-address">
                                        <div class="woocommerce-shipping-fields__field-wrapper">
                                            <p id="shipping_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="shipping_first_name">نام
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" autofocus="autofocus" autocomplete="given-name" value="" placeholder="" id="shipping_first_name" name="shipping_first_name" class="input-text ">
                                            </p>
                                            <p id="shipping_last_name_field" class="form-row form-row-last validate-required">
                                                <label class="" for="shipping_last_name">نام خانوادگی
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" autocomplete="family-name" value="" placeholder="" id="shipping_last_name" name="shipping_last_name" class="input-text ">
                                            </p>
                                            <p id="shipping_company_field" class="form-row form-row-wide">
                                                <label class="" for="shipping_company">نام شرکت</label>
                                                <input type="text" autocomplete="organization" value="" placeholder="" id="shipping_company" name="shipping_company" class="input-text ">
                                            </p>
                                            <p id="shipping_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="shipping_country">استان
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select autocomplete="country" class="country_to_state country_select select2-hidden-accessible" id="shipping_country" name="shipping_country" tabindex="-1" aria-hidden="true">
                                                    <option value="0">لطفا استان خود را انتخاب نمایید
                                                    </option>
                                                    <option value="1">تهران</option>
                                                    <option value="2">گیلان</option>
                                                    <option value="3">آذربایجان شرقی</option>
                                                    <option value="4">خوزستان</option>
                                                    <option value="5">فارس</option>
                                                    <option value="6">اصفهان</option>
                                                    <option value="7">خراسان رضوی</option>
                                                    <option value="8">قزوین</option>
                                                    <option value="9">سمنان</option>
                                                    <option value="10">قم</option>
                                                    <option value="11">مرکزی</option>
                                                    <option value="12">زنجان</option>
                                                    <option value="13">مازندران</option>
                                                    <option value="14">گلستان</option>
                                                    <option value="15">اردبیل</option>
                                                    <option value="16">آذربایجان غربی</option>
                                                    <option value="17">همدان</option>
                                                    <option value="18">کردستان</option>
                                                    <option value="19">کرمانشاه</option>
                                                    <option value="20">لرستان</option>
                                                    <option value="21">بوشهر</option>
                                                    <option value="22">کرمان</option>
                                                    <option value="23">هرمزگان</option>
                                                    <option value="24">چهارمحال و بختیاری</option>
                                                    <option value="25">یزد</option>
                                                    <option value="26">سیستان و بلوچستان</option>
                                                    <option value="27">ایلام</option>
                                                    <option value="28">کهگلویه و بویراحمد</option>
                                                    <option value="29">خراسان شمالی</option>
                                                    <option value="30">خراسان جنوبی</option>
                                                    <option value="31">البرز</option>
                                                </select>
                                            </p>
                                            <p id="shipping_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="shipping_address_1">نشانی پستی
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <textarea id="shipping_address_1" name="shipping_address_1" class="input-text "></textarea>
                                            </p>
                                            <p id="shipping_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="shipping_city">شهر
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" autocomplete="address-level2" value="" placeholder="" id="shipping_city" name="shipping_city" class="input-text ">
                                            </p>
                                            <p id="shipping_state_field" class="form-row form-row-wide address-field validate-state woocommerce-invalid woocommerce-invalid-required-field validate-required" data-o_class="form-row form-row-wide address-field validate-required validate-state woocommerce-invalid woocommerce-invalid-required-field">
                                                <label class="" for="shipping_state">شهر
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select data-placeholder="" autocomplete="address-level1" class="state_select select2-hidden-accessible" id="shipping_state" name="shipping_state" tabindex="-1" aria-hidden="true">
                                                    <option value="">Select an option…</option>
                                                    <option value="AP">Andhra Pradesh</option>
                                                    <option value="AR">Arunachal Pradesh</option>
                                                    <option value="AS">Assam</option>
                                                    <option value="BR">Bihar</option>
                                                    <option value="CT">Chhattisgarh</option>
                                                    <option value="GA">Goa</option>
                                                    <option value="GJ">Gujarat</option>
                                                    <option value="HR">Haryana</option>
                                                    <option value="HP">Himachal Pradesh</option>
                                                    <option value="JK">Jammu and Kashmir</option>
                                                    <option value="JH">Jharkhand</option>
                                                    <option value="KA">Karnataka</option>
                                                    <option value="KL">Kerala</option>
                                                    <option value="MP">Madhya Pradesh</option>
                                                    <option value="MH">Maharashtra</option>
                                                    <option value="MN">Manipur</option>
                                                    <option value="ML">Meghalaya</option>
                                                    <option value="MZ">Mizoram</option>
                                                    <option value="NL">Nagaland</option>
                                                    <option value="OR">Orissa</option>
                                                    <option value="PB">Punjab</option>
                                                    <option value="RJ">Rajasthan</option>
                                                    <option value="SK">Sikkim</option>
                                                    <option value="TN">Tamil Nadu</option>
                                                    <option value="TS">Telangana</option>
                                                    <option value="TR">Tripura</option>
                                                    <option value="UK">Uttarakhand</option>
                                                    <option value="UP">Uttar Pradesh</option>
                                                    <option value="WB">West Bengal</option>
                                                    <option value="AN">Andaman and Nicobar Islands
                                                    </option>
                                                    <option value="CH">Chandigarh</option>
                                                    <option value="DN">Dadra and Nagar Haveli
                                                    </option>
                                                    <option value="DD">Daman and Diu</option>
                                                    <option value="DL">Delhi</option>
                                                    <option value="LD">Lakshadeep</option>
                                                    <option value="PY">Pondicherry (Puducherry)
                                                    </option>
                                                </select>
                                            </p>
                                            <p data-priority="90" id="shipping_postcode_field" class="form-row form-row-wide address-field validate-postcode validate-required" data-o_class="form-row form-row-wide address-field validate-required validate-postcode">
                                                <label class="" for="shipping_postcode">کد پستی
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" autocomplete="postal-code" value="" placeholder="" id="shipping_postcode" name="shipping_postcode" class="input-text ">
                                            </p>
                                        </div>
                                        <!-- .woocommerce-shipping-fields__field-wrapper -->
                                    </div>
                                    <!-- .shipping_address -->
                                </div>
                                <!-- .woocommerce-shipping-fields -->
                                <div class="woocommerce-additional-fields">
                                    <div class="woocommerce-additional-fields__field-wrapper">
                                        <p id="order_comments_field" class="form-row notes">
                                            <label class="" for="order_comments">نکات سفارش</label>
                                            <textarea placeholder="نکاتی در مورد سفارش خود بنویسید" id="order_comments" class="input-text " name="order_comments"></textarea>
                                        </p>
                                    </div>
                                    <!-- .woocommerce-additional-fields__field-wrapper-->
                                </div>
                                <!-- .woocommerce-additional-fields -->
                            </div>
                            <!-- .col-2 -->
                        </div>
                        <!-- .col2-set -->
                        <h3 id="order_review_heading">سفارش شما</h3>
                        <div class="woocommerce-checkout-review-order" id="order_review">
                            <div class="order-review-wrapper">
                                <h3 class="order_review_heading">سفارش شما</h3>
                                <table class="shop_table woocommerce-checkout-review-order-table">
                                    <thead>
                                        <tr>
                                            <th class="product-name">محصول</th>
                                            <th class="product-total">قیمت</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                <strong class="product-quantity">1 ×</strong> 55"
                                                KU6470 6 Series UHD Crystal Colour HDR Smart
                                                TV&nbsp;
                                            </td>
                                            <td class="product-total">
                                                <span class="woocommerce-Price-amount amount"> 1000000 ریال</span>
                                            </td>
                                        </tr>
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                <strong class="product-quantity">1 ×</strong> 4K
                                                Action Cam GPS&nbsp;
                                            </td>
                                            <td class="product-total">
                                                <span class="woocommerce-Price-amount amount"> 1000000 ریال</span>
                                            </td>
                                        </tr>
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                <strong class="product-quantity">1 ×</strong>
                                                Bluetooth on-ear PureBass Headphones&nbsp;
                                            </td>
                                            <td class="product-total">
                                                <span class="woocommerce-Price-amount amount"> 1000000 ریال</span>
                                            </td>
                                        </tr>
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                <strong class="product-quantity">1 ×</strong> Band
                                                Fitbit Flex&nbsp;
                                            </td>
                                            <td class="product-total">
                                                <span class="woocommerce-Price-amount amount"> 1000000 ریال</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr class="cart-subtotal">
                                            <th>مجموع</th>
                                            <td>
                                                <span class="woocommerce-Price-amount amount">
                                                    <span class="woocommerce-Price-amount amount"> 4000000 ریال</span>
                                            </td>
                                        </tr>
                                        <tr class="order-total">
                                            <th>قیمت کل</th>
                                            <td>
                                                <strong>
                                                    <span class="woocommerce-Price-amount amount"> 1000000 ریال</span>
                                                </strong>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <!-- /.woocommerce-checkout-review-order-table -->
                                <div class="woocommerce-checkout-payment" id="payment">
                                    <ul class="wc_payment_methods payment_methods methods">
                                        <li class="wc_payment_method payment_method_bacs">
                                            <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs">
                                            <label for="payment_method_bacs">پرداخت کارت به کارت</label>
                                        </li>
                                        <li class="wc_payment_method payment_method_cheque">
                                            <input type="radio" data-order_button_text="" value="cheque" name="payment_method" class="input-radio" id="payment_method_cheque">
                                            <label for="payment_method_cheque">پرداخت به شماره حساب
                                            </label>
                                        </li>
                                        <li class="wc_payment_method payment_method_cod">
                                            <input type="radio" data-order_button_text="" value="cod" name="payment_method" class="input-radio" id="payment_method_cod">
                                            <label for="payment_method_cod">پرداخت در محل
                                            </label>
                                        </li>
                                    </ul>
                                    <div class="form-row place-order">
                                        <p class="form-row terms wc-terms-and-conditions woocommerce-validated">
                                            <label class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
                                                <input type="checkbox" id="terms" name="terms" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox">
                                                <span> من <a class="woocommerce-terms-and-conditions-link" href="terms-and-conditions.html">قوانین و مقررات</a> را مطالعه نموده ام و با آن موافقم</span>
                                                <span class="required">*</span>
                                            </label>
                                            <input type="hidden" value="1" name="terms-field">
                                        </p>
                                        <a href="order-received.html" class="button wc-forward text-center">ثبت سفارش</a>
                                    </div>
                                </div>
                                <!-- /.woocommerce-checkout-payment -->
                            </div>
                            <!-- /.order-review-wrapper -->
                        </div>
                        <!-- .woocommerce-checkout-review-order -->
                    </form>
                    <!-- .woocommerce-checkout -->
                </div>
                <!-- .woocommerce -->
            </div>
            <!-- .entry-content -->
        </div>
        <!-- #post-## -->
    </main>
    <!-- #main -->
</div>