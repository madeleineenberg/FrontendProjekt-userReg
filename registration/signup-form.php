<?php
require_once '../second_header_extern.php';
//require_once 'signup.php';
//require_once '../config/db.php';
?>

</header>
<main>
<h1 class="page-title form-container__heading-text">Registrera dig!</h1>
<span>Har du redan ett konto? <a href="login.php">Logga in här!</a></span>

      <?php echo $errors;?>

<form name="reg-form" action="signup.php" method="POST" id="reg-form" class="form-container">
      <!--Input-fält som användaren fyller i-->
      <div class="reg_field-name form-container__box">
        <label for="name">För- och efternamn:</label><br>
        <input type="text" name="name" id="reg-name" class="form-container__box-input" >
        <br>
        <span class="nameValidationText"></span>
      </div>

      <div class="reg_field-email form-container__box">
        <label for="email">E-post:</label><br>
        <input type="text" name="email" id="reg-email"  class="form-container__box-input" placeholder="exempel@test.com" >
        <br>
        <span class="emailValidationText"></span>
      </div>

      <div class="reg_field-phone form-container__box">
        <label for="phone">Mobilnummer:</label><br>
        <input type="text" name="phone" id="reg-phone" class="form-container__box-input"  >
        <br>
        <span class="phoneValidationText"></span>
      </div>

      <div class="reg_field-street form-container__box">
        <label for="street">Gatuadress:</label><br>
        <input type="text" name="street" id="reg-street"  class="form-container__box-input" >
        <br>
        <span class="streetValidationText"></span>
      </div>

      <div class="reg_field-postalcode form-container__box">
        <label for="zip">Postnr:</label><br>
        <input type="text" name="zip" id="reg-zip" class="form-container__box-input" >
        <br>
        <span class="zipcodeValidationText"></span>
      </div>

      <div class="reg_field-city form-container__box">
        <label for="city">Ort:</label><br>
        <input type="text" name="city" id="reg-city" class="form-container__box-input" >
        <br>
        <span class="cityValidationText"></span>
      </div>

      <div class="reg_field-pwd form-container__box">
      <label for="password">Lösenord:</label><br>
      <input type="password" name="password" id="reg-pwd" placeholder="Ange lösenord" class="form-container__box-input"><br>
      <span class="passwordValidationText" id="pwd-msg"></span>
      </div>

      <div class="reg_field-pwd-repeat form-container__box">
      <label for="password-repeat">Lösenord:</label><br>
      <input type="password" name="password-repeat" id="reg-pwd-repeat" placeholder="Repetera lösenord"  class="form-container__box-input">
      <span class="passwordValidationTextRepeat"></span>
      </div>

      <div class="reg_field-submit form-container__submit">
        <input type="submit" value="Registrera" class="form-container__submit-button" id="reg_form-container__submit-button">

      </div>
    </form>

  </section>
</section>


<?php
require_once "../footer.php";
?>
