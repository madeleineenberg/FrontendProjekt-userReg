const pwd = document.getElementById("reg-pwd");
const pwdMsg = document.getElementById("pwd-msg");

pwd.addEventListener("input", CheckPasswordStrength);

function CheckPasswordStrength() {
  let password = pwd.value;

  if (password.length == 0) {
    pwdMsg.innerHTML =
      "Ett starkt lösenord bör innehålla minst 8 tecken, siffror, versaler och specialtecken";
    pwdMsg.style.fontSize = "10px";
    pwdMsg.style.color = "black";
    return;
  }

  let regex = new Array();
  regex.push("[A-Ö]");
  regex.push("[a-ö]");
  regex.push("[0-9]");
  regex.push("[$@$!%*#?&]");

  let valid = 0;

  for (let i = 0; i < regex.length; i++) {
    if (new RegExp(regex[i]).test(password)) {
      valid++;
    }
  }

  if (valid > 2 && password.length > 8) {
    valid++;
  }

  let color = "";
  let message = "";
  switch (valid) {
    case 0:
    case 1:
      message = "Svagt";
      color = "red";
      break;
    case 2:
      message = "Helt ok";
      color = "darkorange";
      break;
    case 3:
    case 4:
      message = "Starkt";
      color = "green";
      break;
    case 5:
      message = "Utmärkt lösenord!";
      color = "darkgreen";
      break;
  }
  pwdMsg.innerHTML = message;
  pwdMsg.style.color = color;
}
