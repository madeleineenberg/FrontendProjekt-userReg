
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
$password = $repeat_password = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    $password = htmlspecialchars($_POST['password']);
    $repeat_password = htmlspecialchars($_POST['passwordRepeat']);

    $token = $_GET['token'];

    if(empty($password) || empty($repeat_password)){
        $error[] = "Du måste ange ett lösenord i båda fälten";
    }

    if (count($error) == 0){
        $sql = "SELECT email FROM webshop_password_reset WHERE token='$token' LIMIT 1";
        $stmt = $db->prepare($sql);
        $stmt->execute();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $email = $row['email'];

            if($email){
                $password = md5($password);
                $query = "UPDATE webshop_customers SET password='$password' WHERE email='$email'";
                $statement = $db->prepare($query);
                $statement->execute();
                header("Location: login.php");

            }
        }

        
    }

         
  if (count($error) > 0) {

    foreach ($error as $e) {
      $errors .= "<div class='error'><p> $e </p></div><br />";
    }
  }else {
    $errors = "<div class='reg-suc'><p> Ett nytt lösenord är skapat!</p></div>";
}
}

?>

<h1 class="page-title form-container__heading-text">Skapa ett nytt lösenord:</h1>
<?php echo $errors;?>


<form name="new-pwd-form" action="#" method="POST" id="new-pwd-form" class="form-container" >

<div class="reg_field-pwd form-container__box">
      <label for="password">Nytt Lösenord:</label><br>
      <input type="password" name="password" id="reg-pwd" placeholder="Ange lösenord" class="form-container__box-input"><br>
      <span class="passwordValidationText" id="pwd-msg"></span>
      </div>

      <div class="reg_field-pwd-repeat form-container__box">
      <label for="password-repeat">Repetera Lösenord:</label><br>
      <input type="password" name="passwordRepeat" id="reg-pwd-repeat" placeholder="Repetera lösenord"  class="form-container__box-input"><br>
      <span class="passwordErrorTextRepeat"></span>
      </div>

      <div class="reg_field-submit form-container__submit">
        <input type="submit" value="Registrera" class="form-container__submit-button" id="reg_form-container__submit-button">

      </div>
    </form>

    <?php require_once "../footer.php";?>