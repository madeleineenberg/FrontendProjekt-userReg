let nameErrText = document.querySelector(".nameErrorText");
let pwdErrText = document.querySelector(".passwordErrorTextRepeat");
let emailErrText = document.querySelector(".emailErrorText");

let pwd1 = document.getElementById("reg-pwd");
let pwd2 = document.getElementById("reg-pwd-repeat");

function validateMyForm(form) {
  let name = document.getElementById("reg-name").value;
  let email = document.getElementById("reg-email").value;

  if (name.length === 0 || name.length < 2 || name.length > 25) {
    nameErrText.innerHTML =
      "Obligatoriskt fält, namn måste innehålla minst 2 tecken och högst 25 tecken";
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

  if (pwd1.value != pwd2.value) {
    pwdErrText.innerHTML = "Lösenorden måste matcha";
    form.passwordRepeat.focus();
    return false;
  }
}
