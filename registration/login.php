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

    $email = $_POST['email'];
    $password = $_POST['password'];

    if(empty($email)){
        $error[] = "Du måste fylla i en e-postadress";
    }
    if(empty($password)){
        $error[] = "Du måste fylla i ett lösenord";
    }

    if(count($error) === 0){
        $password = md5($password);

        $sql = "SELECT * FROM webshop_customers WHERE email='$email' AND password='$password'";
        $stmt = $db->prepare($sql);
        $stmt->execute();

        if ($stmt->rowCount() === 1){
            $_SESSION['email'] = $email;
            $_SESSION['success'] = "Du är inloggad";
            header("Location: user-page.php");
        
        }
        else{
            $error[] = "Kontrollera e-post eller lösenord";
        }
    }

     
  if (count($error) > 0) {

    foreach ($error as $e) {
      $errors .= "<div class='error'><p> $e </p></div><br />";
    }
  }else {
    $errors = "<div class='reg-suc'><p> Du är inloggad!</p></div>";
}
}

?>

<h1 class="page-title form-container__heading-text">Logga in!</h1>
<span>Har du inget konto? <a href="signup.php">Registrera dig här!</a></span>

      <?php echo $errors;
      
      ?>

<form name="login-form" action="#" method="POST" id="login-form" class="form-container">
      <!--Input-fält som användaren fyller i-->


      <div class="login_field-email form-container__box">
        <label for="email">E-post:</label><br>
        <input type="text" name="email" id="login-email"  class="form-container__box-input" placeholder="exempel@test.com" >
        <br>
        <span class="emailErrorText"></span>
      </div>

      <div class="login_field-pwd form-container__box">
      <label for="password">Lösenord:</label><br>
      <input type="password" name="password" id="login-pwd" placeholder="Ange lösenord" class="form-container__box-input"><br>
      <span class="passwordValidationText" id="pwd-msg"></span>
      </div>

      <div class="login_field-submit form-container__submit">
        <input type="submit" value="Logga in" class="form-container__submit-button" id="login_form-container__submit-button">

      </div>
      <div>
      <p><a href="enter-email.php">Glömt ditt lösenord?</a></p>
      </div>
    </form>

    <?php require_once "../footer.php";?>