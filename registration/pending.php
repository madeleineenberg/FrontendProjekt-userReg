<?php

require_once '../second_header_extern.php';


?>

</header>
<main>

<?php

$email = $_GET['email'];
$token = $_GET['token'];
$link = "new_password.php?token=" . $token;


?>

<h1 class="page-title form-container__heading-text"> 
			Vi har skickat en länk till  <b><?php echo $email ?></b> för att hjälpa dig att återställa ditt lösenord. </h1>
	
	<p>Logga in på din e-post och klicka på <a href="<?php echo $link; ?>" class="pwd-link">länken</a> för att återställa ditt lösenord</p>

<?php require_once "../footer.php";?>