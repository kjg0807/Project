const userName = document.getElementById("userName"); // 입력 값
const user = document.getElementById("user"); // 저장되어 있는 값
const pwdd = document.getElementById("pwdd"); // 입력 값
const pass = document.getElementById("pass"); // 저장되어 있는 값

userNameCheck = true;
pwddCheck = true;

userName.addEventListener("blur", function () {
    let use = userName.value; // 입력 값
    let userText = user.value; // 저장된 값
    if (use != userText) {
        document.getElementById("nameText").style.display = 'block';
        userNameCheck = false;
    }
    else {
        document.getElementById("nameText").style.display = 'none';
        userNameCheck = true;
    }
})

pwdd.addEventListener("blur", function () {
    let pw = pwdd.value; // 입력 값
    let passs = pass.value; // 저장된 값
    if (pw != passs) {
        document.getElementById("pwdText").style.display = 'block';
        pwddCheck = false;
    }
    else {
        document.getElementById("pwdText").style.display = 'none';
        pwddCheck = true;
    }
})

const btn = document.getElementById("btn");
const frm = document.getElementById("frm");
btn.addEventListener("click", function () {
    if ((userName || pwdd) == "") {
        alert("빈칸이 존재합니다.");
    }
    if (userNameCheck == false) {
        alert("이름이 틀렸습니다.");
    }
    if (pwddCheck == false) {
        alert("비밀번호가 틀렸습니다.");
    }
    if ((userNameCheck && pwddCheck) == true) {
        frm.submit();
    }
    else{
        alert("조건이 틀렸습니다.(새로 고침 후 다시)");
    }
})