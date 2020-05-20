<?php

require_once '../second_header_extern.php';
require_once '../config/db.php';

?>

</header>
<main>
<?php



$errors = "";
$error = array();
$name = $email = $phone = $street = $zip = $city = $password = "";


if ($_SERVER['REQUEST_METHOD'] === 'POST') :

 

  if (empty($_POST['name'])) {
    $error[] =  "Du måste ange namn";
  } else if (isset($_POST['name'])) {
    $name = $_POST['name'];

  }

  if (empty($_POST['email'])) {
    $error[] =  "Du måste ange namn";
  } else if (isset($_POST['email'])) {
    $email = $_POST['email'];
  }

$user_check =  "SELECT * FROM webshop_customers WHERE  email='$email' LIMIT 1";
$statment = $db->prepare($user_check);
$statment->execute();
if ($statment->rowCount() > 0) {
  $error[] = "Användaren finns redan, testa en annan mailadress eller logga in";
} else {
  $email = $_POST['email'];
}


  if (empty($_POST['phone'])) {
    $error[] =  "Du måste ange telefonnummer";
  } else if (isset($_POST['phone'])) {
    $phone = $_POST['phone'];
  }

  if (empty($_POST['street'])) {
    $error[] =  "Du måste ange gatuadress";
  } else if (isset($_POST['street'])) {
    $street = $_POST['street'];
  }

  if (empty($_POST['zip'])) {
    $error[] =  "Du måste ange gatuadress";
  } else if (isset($_POST['zip'])) {
    $zip = str_replace(' ', '', $_POST['zip']);
  }

  if (empty($_POST['city'])) {
    $error[] =  "Du måste ange gatuadress";
  } else if (isset($_POST['city'])) {
    $city = $_POST['city'];
  }
  if (empty($_POST['password'])) {
    $error[] =  "Du måste ange ett lösenord";
  }else if (isset($_POST['password'])){
    $password = md5($_POST['password']);
  }

  
  if (count($error) == 0) {


    $sql = "INSERT INTO webshop_customers (name, email, phone, street, zip, city, password )
            VALUES (:name, :email, :phone, :street, :zip, :city, :password)";

    $stmt = $db->prepare($sql);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':street', $street);
    $stmt->bindParam(':zip', $zip);
    $stmt->bindParam(':city', $city);
    $stmt->bindParam(':password', $password);

    $stmt->execute();
  }

 
  if (count($error) > 0) {

    foreach ($error as $e) {
      $errors .= "<div class='error'><p> $e </p></div><br />";
    }
  }else {
    $errors = "<div class='reg-suc'><p> Du är registrerad!</p></div>";
}





endif;


require_once "signup-form.php";
require_once "../footer.php";


?>