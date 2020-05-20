let nameErrText = document.querySelector(".nameErrorText");
let pwdErrText = document.querySelector(".passwordErrorTextRepeat");
let emailErrText = document.querySelector(".emailErrorText");
let phoneErrText = document.querySelector(".phoneErrorText");
let streetErrText = document.querySelector(".streetErrorText");
let zipErrText = document.querySelector(".zipErrorText");
let cityErrText = document.querySelector(".cityErrorText");

let pwd1 = document.getElementById("reg-pwd");
let pwd2 = document.getElementById("reg-pwd-repeat");

function validateMyForm(form) {
  let name = document.getElementById("reg-name").value;
  let email = document.getElementById("reg-email").value;
  let phone = document.getElementById("reg-phone").value;
  let street = document.getElementById("reg-street").value;
  let zip = document.getElementById("reg-zip").value;
  let city = document.getElementById("reg-city").value;

  if (name.length === 0 || name.length < 2 || name.length > 25) {
    nameErrText.innerHTML =
      "Obligatoriskt fält, namn måste innehålla minst 2 tecken, max 25 tecken";
    form.name.focus();
    return false;
  }
  if (new RegExp(/^([a-öA-Ö]+\s)*[a-zA-Ö]+$/).test(name) == false) {
    nameErrText.innerHTML =
      "Namnet får endast innehålla bokstäver och mellanslag";
    form.name.focus();
    return false;
  }

  if (email.length === 0 || email.length > 100) {
    emailErrText.innerHTML = "Obligatoriskt fält";
    form.email.focus();
    return false;
  }
  if (
    new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/).test(email) ==
    false
  ) {
    emailErrText.innerHTML = "Din Emailadress har fel format";
    form.email.focus();
    return false;
  }
  if (phone.length === 0 || phone.length > 11) {
    phoneErrText.innerHTML = "Obligatoriskt fält, max 11 siffror";
    form.phone.focus();
    return false;
  }
  if (new RegExp(/[^0-9\s-]/).test(phone)) {
    phoneErrText.innerHTML = "Bara siffror är tillåtna";
    form.phone.focus();
    return false;
  }
  if (street.length === 0 || street.length > 50) {
    streetErrText.innerHTML = "Obligatoriskt fält, max 50 tecken";
    form.street.focus();
    return false;
  }

  if (new RegExp(/[^a-öA-Ö\s0-9.,:]/).test(street)) {
    streetErrText.innerHTML = "Din adress innehåller förbjudna tecken ";
    form.street.focus();
    return false;
  }

  if (zip.length === 0 || zip.length > 6) {
    zipErrText.innerHTML = "Obligatoriskt fält, max 6 tecken";
    form.zip.focus();
    return false;
  }
  if (new RegExp(/[^0-9\s-]/).test(zip)) {
    zipErrText.innerHTML = "Bara siffror är tillåtna";
    form.zip.focus();
    return false;
  }
  if (city.length === 0 || city.length > 25) {
    cityErrText.innerHTML = "Obligatoriskt fält, max 25 tecken";
    form.city.focus();
    return false;
  }

  if (new RegExp(/[^a-öA-Ö\s.,:]/).test(city)) {
    cityErrText.innerHTML = "Fältet innehåller förbjudna tecken";
    form.city.focus();
    return false;
  }

  if (pwd1.value != pwd2.value) {
    pwdErrText.innerHTML = "Lösenorden måste matcha";
    form.passwordRepeat.focus();
    return false;
  }
}
