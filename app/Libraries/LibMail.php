<?php
namespace Libs;

require VENDORPATH . 'phpmailer/phpmailer/PHPMailerAutoload.php';

class LibMail
{
    public $mail;
    public $mailerTA = null;
    function __construct($set=false)
    {
        $this->mail = new PHPMailer;
        if($set){
            $this->setSMTP();
        }
    }


    public function getSMTP()
    {
        $this->mail->isSMTP();                                      // Set mailer to use SMTP
        $this->mail->Host = 'host39.registrar-servers.com';  // Specify main and backup SMTP servers
        $this->mail->SMTPAuth = true;                               // Enable SMTP authentication
        $this->mail->Username = 'support@a3solution.com';                 // SMTP username
        $this->mail->Password = '@A3123654';                           // SMTP password
        $this->mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $this->mail->Port = 465;
    }

    /**
     * @param bool $config
       [ 'host','user','pass','encryption'[ssl/tls],'port' ]
     * $config = [
    'host' => 'host39.registrar-servers.com'
    ,'user' =>'support@a3solution.com'
    ,'pass' =>'@A3123654'
    ,'encryption' =>'ssl'
    ,'port' =>465
    ];
     */
    public function setSMTP($config=false)
    {
        if($config == false){
            $config = [
                'host' => 'host39.registrar-servers.com'
                ,'user' =>'support@a3solution.com'
                ,'pass' =>'@A3123654'
                ,'encryption' =>'ssl'
                ,'port' =>465
            ];
//            $config = [
//                'host' => 'host39.registrar-servers.com'
//                ,'user' =>'support@a3solution.com'
//                ,'pass' =>'@A3123654'
//                ,'encryption' =>'ssl'
//                ,'port' =>465
//            ];
        }
        $this->mail->isSMTP();                                      // Set mailer to use SMTP
        $this->mail->Host = $config['host'];  // Specify main and backup SMTP servers
        $this->mail->SMTPAuth = true;                               // Enable SMTP authentication
        $this->mail->Username = $config['user'];                 // SMTP username
        $this->mail->Password = $config['pass'];                           // SMTP password
        $this->mail->SMTPSecure = $config['encryption'];                            // Enable TLS encryption, `ssl` also accepted
        $this->mail->Port = $config['port'];
    }

    public function setMail($html=false)
    {
        $this->mail->setFrom('support@a3solution.com', 'A3Solution');
        $this->mail->addAddress('tameemdh@gmail.com', 'Dev Azraf');     // Add a recipient
        $this->mail->addAddress('tameemdh@yahoo.com');               // Name is optional
        $this->mail->addReplyTo('support@a3solution.com', 'Information');
        $this->mail->addCC('azraf.mkt@gmail.com');
        if($html){
            $this->mail->isHTML(true);
        }
    }
    public function poke()
    {
        $this->mail->Subject = 'Third GOOD is the subject';
        $this->mail->Body    = 'BODY is the HTML message body <b>in bold!</b>';
        $this->mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

        if(!$this->mail->send()) {
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $this->mail->ErrorInfo;
        } else {
            echo 'Message has been sent';
        }
    }
}
?>
