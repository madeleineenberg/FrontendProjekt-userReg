
<?php

require_once '../second_header_extern.php';
require_once '../config/db.php';

?>

</header>
<main>

<?php
session_start();
$errors = "";
$error = array();
$email = $password = "";


if ($_SERVER['REQUEST_METHOD'] === 'POST'){

   
    $email = htmlspecialchars($_POST['email']);
    
    $query = "SELECT email FROM webshop_customers WHERE email='$email'";
    $statement = $db->prepare($query);
    $statement->execute();

    if(empty($email)){
        $error[] = "Du måste fylla i en e-postadress";
    }else if($statement->rowCount() <= 0){
        $error[] = "Användaren finns inte!";
    }
    
    $token = bin2hex(random_bytes(50));

    if(count($error) === 0){
        

        $sql = "INSERT INTO webshop_password_reset (email, token) VALUES ('$email', '$token')";
        $stmt = $db->prepare($sql);
        $stmt->execute();

    $to = $email;
    $subject = "Återställ Lösenord";
    $msg = "Klicka på denna <a href=\"new_password.php?token=" . $token . "\">länk</a> för att återställa ditt lösenord ";
    $msg = wordwrap($msg,70);
    $headers = "From: info@spelshoppen.se";
    mail($to, $subject, $msg, $headers);
    header('location: pending.php?email=' . $email . '&token=' . $token );
        
    }

     
  if (count($error) > 0) {

    foreach ($error as $e) {
      $errors .= "<div class='error'><p> $e </p></div><br />";
    }
  }else {
    $errors = "<div class='reg-suc'><p> Länken är skickad!</p></div>";
}
}

?>



<h1 class="page-title form-container__heading-text">Fyll i din e-post: </h1>


      <?php echo $errors;
      
      ?>

<form name="enter-email-form" action="#" method="POST" id="enter-email-form" class="form-container">
      <!--Input-fält som användaren fyller i-->


      <div class="enter_field-email form-container__box">
        <label for="email">E-post:</label><br>
        <input type="text" name="email" id="enter-email"  class="form-container__box-input" placeholder="exempel@test.com" >
        <br>
        <span class="emailErrorText"></span>
      </div>

      <div class="enter_field-submit form-container__submit">
        <input type="submit" value="Skicka" class="form-container__submit-button" id="enter_form-container__submit-button">

      </div>

    </form>

    <?php require_once "../footer.php";?>





