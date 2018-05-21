<?php

    function sendMail($email,$message,$subject,$title,$smail,$smailpass)
	{						
        require_once 'includes/vendor/autoload.php';
		
		$mail = new PHPMailer;
		
		//$mail->SMTPDebug = 3;                               // Enable verbose debug output
		
		$mail->isSMTP();                                      // Set mailer to use SMTP
		$mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
		$mail->SMTPAuth = true;                               // Enable SMTP authentication
		$mail->Username = $smail;                 // SMTP username
		$mail->Password = $smailpass;                           // SMTP password
		$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
		$mail->Port = 587;                                    // TCP port to connect to
		
		$mail->setFrom($smail, $title);
		$mail->addAddress($email);     // Add a recipient
		$mail->addReplyTo($smail, $title);
		$mail->addCC('cc@example.com');
		$mail->addBCC('bcc@example.com');
		
		$mail->isHTML(true);                                  // Set email format to HTML
		
		$mail->Subject = $subject;
		$mail->Body    = $message;
		$mail->AltBody = $message;
		$mail->Send();
	}	



?>