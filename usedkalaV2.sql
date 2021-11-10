<!doctype html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="referrer" content="no-referrer">
  <meta name="robots" content="noindex,nofollow">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <style id="cfs-style">html{display: none;}</style>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
      <link rel="stylesheet" type="text/css" href="./themes/pmahomme/jquery/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="js/vendor/codemirror/lib/codemirror.css?v=5.1.1">
    <link rel="stylesheet" type="text/css" href="js/vendor/codemirror/addon/hint/show-hint.css?v=5.1.1">
    <link rel="stylesheet" type="text/css" href="js/vendor/codemirror/addon/lint/lint.css?v=5.1.1">
    <link rel="stylesheet" type="text/css" href="./themes/pmahomme/css/theme.css?v=5.1.1&nocache=3767010715ltr&server=1">
    <link rel="stylesheet" type="text/css" href="./themes/pmahomme/css/printview.css?v=5.1.1" media="print" id="printcss">
    <title>phpMyAdmin</title>
    <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery.min.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery-migrate.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/sprintf.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/ajax.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/keyhandler.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/bootstrap/bootstrap.bundle.min.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery-ui.min.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/js.cookie.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery.mousewheel.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery.validate.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery-ui-timepicker-addon.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery.ba-hashchange-2.0.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/jquery/jquery.debounce-1.0.6.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/menu_resizer.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/cross_framing_protection.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/rte.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/tracekit.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/error_report.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/messages.php?l=en&v=5.1.1&lang=en"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/config.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/doclinks.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/functions.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/navigation.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/indexes.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/common.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/page_settings.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/drag_drop_import.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/shortcuts_handler.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/codemirror/lib/codemirror.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/codemirror/mode/sql/sql.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/codemirror/addon/runmode/runmode.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/codemirror/addon/hint/show-hint.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/codemirror/addon/hint/sql-hint.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/vendor/codemirror/addon/lint/lint.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/codemirror/addon/lint/sql-lint.js?v=5.1.1"></script>
  <script data-cfasync="false" type="text/javascript" src="js/dist/console.js?v=5.1.1"></script>

<script data-cfasync="false" type="text/javascript">
// <![CDATA[
var firstDayOfCalendar = '0';
var themeImagePath = '.\/themes\/pmahomme\/img\/';
var mysqlDocTemplate = '.\/url.php\u003Furl\u003Dhttps\u00253A\u00252F\u00252Fdev.mysql.com\u00252Fdoc\u00252Frefman\u00252F5.7\u00252Fen\u00252F\u002525s.html';
var maxInputVars = 1000;

if ($.datepicker) {
  $.datepicker.regional[''].closeText = 'Done';
  $.datepicker.regional[''].prevText = 'Prev';
  $.datepicker.regional[''].nextText = 'Next';
  $.datepicker.regional[''].currentText = 'Today';
  $.datepicker.regional[''].monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  $.datepicker.regional[''].monthNamesShort = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  $.datepicker.regional[''].dayNames = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  $.datepicker.regional[''].dayNamesShort = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  $.datepicker.regional[''].dayNamesMin = [
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
  ];
  $.datepicker.regional[''].weekHeader = 'Wk';
  $.datepicker.regional[''].showMonthAfterYear = false;
  $.datepicker.regional[''].yearSuffix = '';
  $.extend($.datepicker._defaults, $.datepicker.regional['']);
}

if ($.timepicker) {
  $.timepicker.regional[''].timeText = 'Time';
  $.timepicker.regional[''].hourText = 'Hour';
  $.timepicker.regional[''].minuteText = 'Minute';
  $.timepicker.regional[''].secondText = 'Second';
  $.extend($.timepicker._defaults, $.timepicker.regional['']);
}

function extendingValidatorMessages () {
  $.extend($.validator.messages, {
    required: 'This\u0020field\u0020is\u0020required',
    remote: 'Please\u0020fix\u0020this\u0020field',
    email: 'Please\u0020enter\u0020a\u0020valid\u0020email\u0020address',
    url: 'Please\u0020enter\u0020a\u0020valid\u0020URL',
    date: 'Please\u0020enter\u0020a\u0020valid\u0020date',
    dateISO: 'Please\u0020enter\u0020a\u0020valid\u0020date\u0020\u0028\u0020ISO\u0020\u0029',
    number: 'Please\u0020enter\u0020a\u0020valid\u0020number',
    creditcard: 'Please\u0020enter\u0020a\u0020valid\u0020credit\u0020card\u0020number',
    digits: 'Please\u0020enter\u0020only\u0020digits',
    equalTo: 'Please\u0020enter\u0020the\u0020same\u0020value\u0020again',
    maxlength: $.validator.format('Please\u0020enter\u0020no\u0020more\u0020than\u0020\u007B0\u007D\u0020characters'),
    minlength: $.validator.format('Please\u0020enter\u0020at\u0020least\u0020\u007B0\u007D\u0020characters'),
    rangelength: $.validator.format('Please\u0020enter\u0020a\u0020value\u0020between\u0020\u007B0\u007D\u0020and\u0020\u007B1\u007D\u0020characters\u0020long'),
    range: $.validator.format('Please\u0020enter\u0020a\u0020value\u0020between\u0020\u007B0\u007D\u0020and\u0020\u007B1\u007D'),
    max: $.validator.format('Please\u0020enter\u0020a\u0020value\u0020less\u0020than\u0020or\u0020equal\u0020to\u0020\u007B0\u007D'),
    min: $.validator.format('Please\u0020enter\u0020a\u0020value\u0020greater\u0020than\u0020or\u0020equal\u0020to\u0020\u007B0\u007D'),
    validationFunctionForDateTime: $.validator.format('Please\u0020enter\u0020a\u0020valid\u0020date\u0020or\u0020time'),
    validationFunctionForHex: $.validator.format('Please\u0020enter\u0020a\u0020valid\u0020HEX\u0020input'),
    validationFunctionForMd5: $.validator.format('This\u0020column\u0020can\u0020not\u0020contain\u0020a\u002032\u0020chars\u0020value'),
    validationFunctionForAesDesEncrypt: $.validator.format('These\u0020functions\u0020are\u0020meant\u0020to\u0020return\u0020a\u0020binary\u0020result\u003B\u0020to\u0020avoid\u0020inconsistent\u0020results\u0020you\u0020should\u0020store\u0020it\u0020in\u0020a\u0020BINARY,\u0020VARBINARY,\u0020or\u0020BLOB\u0020column.')
  });
}

CommonParams.setAll({common_query:"lang=en",opendb_url:"index.php?route=/database/structure&lang=en",lang:"en",server:"1",table:"",db:"",token:"2f64564049253068392f3b5f5a3d2841",text_dir:"ltr",show_databases_navigation_as_tree:true,pma_text_default_tab:"Browse",pma_text_left_default_tab:"Structure",pma_text_left_default_tab2:false,LimitChars:"50",pftext:"",confirm:true,LoginCookieValidity:"1440",session_gc_maxlifetime:"1440",logged_in:false,is_https:false,rootPath:"/",arg_separator:"&",PMA_VERSION:"5.1.1",auth_type:"cookie",user:"root"});
ConsoleEnterExecutes=false

AJAX.scriptHandler
  .add('vendor/jquery/jquery.min.js', 0)
  .add('vendor/jquery/jquery-migrate.js', 0)
  .add('vendor/sprintf.js', 1)
  .add('ajax.js', 0)
  .add('keyhandler.js', 1)
  .add('vendor/bootstrap/bootstrap.bundle.min.js', 1)
  .add('vendor/jquery/jquery-ui.min.js', 0)
  .add('vendor/js.cookie.js', 1)
  .add('vendor/jquery/jquery.mousewheel.js', 0)
  .add('vendor/jquery/jquery.validate.js', 0)
  .add('vendor/jquery/jquery-ui-timepicker-addon.js', 0)
  .add('vendor/jquery/jquery.ba-hashchange-2.0.js', 0)
  .add('vendor/jquery/jquery.debounce-1.0.6.js', 0)
  .add('menu_resizer.js', 1)
  .add('cross_framing_protection.js', 0)
  .add('rte.js', 1)
  .add('vendor/tracekit.js', 1)
  .add('error_report.js', 1)
  .add('messages.php', 0)
  .add('config.js', 1)
  .add('doclinks.js', 1)
  .add('functions.js', 1)
  .add('navigation.js', 1)
  .add('indexes.js', 1)
  .add('common.js', 1)
  .add('page_settings.js', 1)
  .add('drag_drop_import.js', 1)
  .add('shortcuts_handler.js', 1)
  .add('vendor/codemirror/lib/codemirror.js', 0)
  .add('vendor/codemirror/mode/sql/sql.js', 0)
  .add('vendor/codemirror/addon/runmode/runmode.js', 0)
  .add('vendor/codemirror/addon/hint/show-hint.js', 0)
  .add('vendor/codemirror/addon/hint/sql-hint.js', 0)
  .add('vendor/codemirror/addon/lint/lint.js', 0)
  .add('codemirror/addon/lint/sql-lint.js', 0)
  .add('console.js', 1)
;
$(function() {
        AJAX.fireOnload('vendor/sprintf.js');
        AJAX.fireOnload('keyhandler.js');
      AJAX.fireOnload('vendor/bootstrap/bootstrap.bundle.min.js');
        AJAX.fireOnload('vendor/js.cookie.js');
                AJAX.fireOnload('menu_resizer.js');
        AJAX.fireOnload('rte.js');
      AJAX.fireOnload('vendor/tracekit.js');
      AJAX.fireOnload('error_report.js');
        AJAX.fireOnload('config.js');
      AJAX.fireOnload('doclinks.js');
      AJAX.fireOnload('functions.js');
      AJAX.fireOnload('navigation.js');
      AJAX.fireOnload('indexes.js');
      AJAX.fireOnload('common.js');
      AJAX.fireOnload('page_settings.js');
      AJAX.fireOnload('drag_drop_import.js');
      AJAX.fireOnload('shortcuts_handler.js');
                    AJAX.fireOnload('console.js');
  });
// ]]>
</script>

  <noscript><style>html{display:block}</style></noscript>
</head>
<body id=loginform>
  
  
  

  
  
  
  

  <div id="page_content">
    

    
<div class="container">
<div class="row">
<div class="col-12">
<a href="./url.php?url=https%3A%2F%2Fwww.phpmyadmin.net%2F" target="_blank" rel="noopener noreferrer" class="logo">
<img src="./themes/pmahomme/img/logo_right.png" id="imLogo" name="imLogo" alt="phpMyAdmin" border="0">
</a>
<h1>Welcome to <bdo dir="ltr" lang="en">phpMyAdmin</bdo></h1>

<noscript>
<div class="alert alert-danger" role="alert">
  <img src="themes/dot.gif" title="" alt="" class="icon ic_s_error"> Javascript must be enabled past this point!
</div>

</noscript>

<div class="hide" id="js-https-mismatch">
<div class="alert alert-danger" role="alert">
  <img src="themes/dot.gif" title="" alt="" class="icon ic_s_error"> There is a mismatch between HTTPS indicated on the server and client. This can lead to a non working phpMyAdmin or a security risk. Please fix your server configuration to indicate HTTPS properly.
</div>

</div>





  <div class='hide js-show'>
        <form method="get" action="index.php?route=/&lang=en" class="disableAjax">
    <input type="hidden" name="db" value=""><input type="hidden" name="table" value=""><input type="hidden" name="lang" value="en"><input type="hidden" name="token" value="2f64564049253068392f3b5f5a3d2841">

            <fieldset>
            <legend class="col-form-label" lang="en" dir="ltr">Language</legend>
    
    <select name="lang" class="autosubmit" lang="en" dir="ltr" id="sel-lang">

                    <option value="sq">
        Shqip - Albanian
        </option>
                    <option value="ar">
        &#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577; - Arabic
        </option>
                    <option value="hy">
        Հայերէն - Armenian
        </option>
                    <option value="az">
        Az&#601;rbaycanca - Azerbaijani
        </option>
                    <option value="bn">
        বাংলা - Bangla
        </option>
                    <option value="be">
        &#1041;&#1077;&#1083;&#1072;&#1088;&#1091;&#1089;&#1082;&#1072;&#1103; - Belarusian
        </option>
                    <option value="bg">
        &#1041;&#1098;&#1083;&#1075;&#1072;&#1088;&#1089;&#1082;&#1080; - Bulgarian
        </option>
                    <option value="ca">
        Catal&agrave; - Catalan
        </option>
                    <option value="zh_cn">
        &#20013;&#25991; - Chinese simplified
        </option>
                    <option value="zh_tw">
        &#20013;&#25991; - Chinese traditional
        </option>
                    <option value="cs">
        Čeština - Czech
        </option>
                    <option value="da">
        Dansk - Danish
        </option>
                    <option value="nl">
        Nederlands - Dutch
        </option>
                    <option value="en"                selected="selected">
        English
        </option>
                    <option value="en_gb">
        English (United Kingdom)
        </option>
                    <option value="et">
        Eesti - Estonian
        </option>
                    <option value="fi">
        Suomi - Finnish
        </option>
                    <option value="fr">
        Fran&ccedil;ais - French
        </option>
                    <option value="gl">
        Galego - Galician
        </option>
                    <option value="de">
        Deutsch - German
        </option>
                    <option value="el">
        &Epsilon;&lambda;&lambda;&eta;&nu;&iota;&kappa;&#940; - Greek
        </option>
                    <option value="he">
        &#1506;&#1489;&#1512;&#1497;&#1514; - Hebrew
        </option>
                    <option value="hu">
        Magyar - Hungarian
        </option>
                    <option value="id">
        Bahasa Indonesia - Indonesian
        </option>
                    <option value="ia">
        Interlingua
        </option>
                    <option value="it">
        Italiano - Italian
        </option>
                    <option value="ja">
        &#26085;&#26412;&#35486; - Japanese
        </option>
                    <option value="kk">
        Қазақ - Kazakh
        </option>
                    <option value="ko">
        &#54620;&#44397;&#50612; - Korean
        </option>
                    <option value="nb">
        Norsk - Norwegian
        </option>
                    <option value="pl">
        Polski - Polish
        </option>
                    <option value="pt">
        Portugu&ecirc;s - Portuguese
        </option>
                    <option value="pt_br">
        Portugu&ecirc;s (Brasil) - Portuguese (Brazil)
        </option>
                    <option value="ro">
        Rom&acirc;n&#259; - Romanian
        </option>
                    <option value="ru">
        &#1056;&#1091;&#1089;&#1089;&#1082;&#1080;&#1081; - Russian
        </option>
                    <option value="sr@latin">
        Srpski - Serbian (latin)
        </option>
                    <option value="si">
        &#3523;&#3538;&#3458;&#3524;&#3517; - Sinhala
        </option>
                    <option value="sk">
        Sloven&#269;ina - Slovak
        </option>
                    <option value="sl">
        Sloven&scaron;&#269;ina - Slovenian
        </option>
                    <option value="es">
        Espa&ntilde;ol - Spanish
        </option>
                    <option value="sv">
        Svenska - Swedish
        </option>
                    <option value="tr">
        T&uuml;rk&ccedil;e - Turkish
        </option>
                    <option value="uk">
        &#1059;&#1082;&#1088;&#1072;&#1111;&#1085;&#1089;&#1100;&#1082;&#1072; - Ukrainian
        </option>
                    <option value="vi">
        Tiếng Việt - Vietnamese
        </option>
    
    </select>

            </fieldset>
    
    </form>

  </div>

<form method="post" id="login_form" action="index.php?route=/" name="login_form" class="disableAjax hide login js-show form-horizontal" autocomplete="off">
  <fieldset>
    <legend class="col-form-label">
      <input type="hidden" name="set_session" value="p8sg0fjjj7skc8r4sf3c3o1gv7">
            Log in      <a href="./doc/html/index.html" target="documentation"><img src="themes/dot.gif" title="Documentation" alt="Documentation" class="icon ic_b_help"></a>
    </legend>

    
    <div class="item form-row">
      <label for="input_username" class="col-4 d-flex align-items-center">
        Username:      </label>
      <div class="col-8">
        <input type="text" name="pma_username" id="input_username" value="" size="24" class="textfield" autocomplete="username">
      </div>
    </div>

    <div class="item form-row">
      <label for="input_password" class="col-4 d-flex align-items-center">
        Password:      </label>
      <div class="col-8">
        <input type="password" name="pma_password" id="input_password" value="" size="24" class="textfield" autocomplete="current-password">
      </div>
    </div>

          <input type="hidden" name="server" value="1">
      </fieldset>

  <fieldset class="tblFooters">
          <input class="btn btn-primary" value="Go" type="submit" id="input_go">
            <input type="hidden" name="route" value="/export"><input type="hidden" name="lang" value="en"><input type="hidden" name="token" value="2f64564049253068392f3b5f5a3d2841">
  </fieldset>
</form>


</div>



  </div>
  </body>
</html>
