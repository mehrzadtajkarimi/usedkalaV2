<?php

namespace App\Services\Auth;

use Ghasedak\GhasedakApi;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

class Notification
{

    function send_token_by_ghasedakSms($token, $phone)
    {
        try {
            $send_sms = new GhasedakApi($_ENV['GHASEDAK_TOKEN']);
            return $send_sms->SendSimple($phone, "کدتایید usedkala\n$token", "10008566");
        } catch (\Ghasedak\Exceptions\ApiException $e) {
            echo $e->errorMessage();
        } catch (\Ghasedak\Exceptions\HttpException $e) {
            echo $e->errorMessage();
        }
    }
    function send_token_by_email($token, $email)
    {
        $mail = new PHPMailer(true);
        try {
            $mail->SMTPDebug = SMTP::DEBUG_SERVER;
            $mail->isSMTP();
            $mail->Host       = "smtp.gmail.com";
            $mail->SMTPAuth   = true;
            $mail->Username   = $_ENV['MAIL_USER'];
            $mail->Password   = $_ENV['MAIL_PASS'];
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $mail->Port       = 465;
            $mail->CharSet = 'UTF-8';

            $mail->SetFrom($_ENV['MAIL_USER']);
            $mail->AddAddress($email);
            $mail->isHTML(true);

            $mail->Subject = "usedkala کد تایید";
            $mail->Body    = "<html><body>این کد تاییدیه ورود است! <br><font color='#CC0000'><h3>$token</h3></font> </body></html>";
            $mail->AltBody = 'برنامه شما از این ایمیل پشتیبانی نمی کند، برای مشاهده آن لطفا از برنامه دیگری استفاده نمائید';

            $mail->send();
            // $mail->smtpClose();
            return true;
        } catch (\Exception $e) {
            echo "خطا: ایمیل ارسال نشد " . $mail->ErrorInfo;
        }
    }
}
