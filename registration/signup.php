<?php
require_once '../config/db.php';

$errors = "";
$error = array();
$name = $email = $phone = $street = $zip = $city = $password = "";

//Lyssnar efter POST-request
if ($_SERVER['REQUEST_METHOD'] === 'POST') :

  //Kontrollerar för varje fält om det är ifyllt eller tomt

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
  }
  if(isset($_POST['password'] )) {
    if($_POST['password'] != $_POST['password-repeat']) {
      $error[] = "Dina lösenord matchar inte varandra";
      echo "Dina lösenord matchar inte varandra";
    }
    $password = $_POST['password'];
  } 




  //Om det inte finns några felmeddelanden
  if (count($error) == 0) {

    //Skicka beställning till databasen
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

  //Om det finns några fel
  if (count($error) > 0) {

    foreach ($error as $e) {
      $errors .= "<div class='error'><p> $e </p></div><br />";
    }
  }


  header('Location:signup-form.php');

endif;

function test_input($data)
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}


