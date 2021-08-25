<?php
namespace App\Services\Auth;

use Ghasedak\GhasedakApi;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

class Notification
{

    function send_sms_by_ghasedak($token, $user)
    {
        try {
            $send_sms = new GhasedakApi($_ENV['GHASEDAK_TOKEN']);
            return $send_sms->SendSimple($user['phone'], "کدتایید usedkala\n$token", "10008566");
        } catch (\Ghasedak\Exceptions\ApiException $e) {
            echo $e->errorMessage();
        } catch (\Ghasedak\Exceptions\HttpException $e) {
            echo $e->errorMessage();
        }
    }
    function send_sms_by_email($token, $user, $param)
    {
        try {
        $mail = new PHPMailer(true);

        //Enable SMTP debugging.
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;
        //Set PHPMailer to use SMTP.
        $mail->isSMTP();
        //Set SMTP host name
        $mail->Host = "smtp.gmail.com";
        //Set this to true if SMTP host requires authentication to send email
        $mail->SMTPAuth = true;
        //Provide username and password
        $mail->Username = $_ENV['MAIL_USER'];
        $mail->Password = $_ENV['MAIL_PASS'];
        //If SMTP requires TLS encryption then set it
        $mail->SMTPSecure = "tls";
        //Set TCP port to connect to
        $mail->Port = 587;

        $mail->AddAddress($param['email'], $user['first_name']);
        $mail->SetFrom($_ENV['MAIL_USER']);

        $mail->isHTML(true);

        $mail->Subject = "usedkala کد تاییدیه ورود";
        $mail->MsgHTML("<html><body>این کد تاییدیه ورود است! <br><font color='#CC0000'><h3>$token</h3></font> </body></html>");
        $mail->AltBody = 'برنامه شما از این ایمیل پشتیبانی نمی کند، برای مشاهده آن لطفا از برنامه دیگری استفاده نمائید';


            $mail->send();
            echo "ایمیل شما با موفقیت ارسال شد";
        } catch (\Exception $e) {
            echo "خطا: ایمیل ارسال نشد " . $mail->ErrorInfo;
        }
    }
}
