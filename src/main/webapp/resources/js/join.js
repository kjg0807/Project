// id를 입력하고 나왔을 때 2글자 미만이면 메세지 출력 : id는 2글자 이상
const id = document.getElementById("id");

idcheck = true;
pwdcheck = true;
namecheck = true;
emailcheck = true;
phonecheck = true;

id.addEventListener("blur", id1);
function id1() {
    let d = id.value;
    if (d.length < 2) {
        document.getElementById("idText").style.display = 'block';
        idcheck = false;
    }
    else {
        document.getElementById("idText").style.display = 'none';
    }
}

// pwd를 입력할 때마다 (1글자씩) 메세지를 출력 : pwd - 최소 6글자 이상
const pwd = document.getElementById("pwd");

pwd.addEventListener("blur", pwd11);
function pwd11() {
    let p = pwd.value;
    if (p.length < 6) {
        document.getElementById("pwdText").style.display = 'block';
    }
    else {
        document.getElementById("pwdText").style.display = 'none';
    }
}

// pwd를 입력하고 나왔을 때 첫번째 pwd와 값 비교 후 메세지 출력 : 같다, 다르다
const pwd2 = document.getElementById("pwd2");
// 입력하고 다른 곳 클릭하면 값 비교 후 출력
pwd2.addEventListener("blur", pwd22);
function pwd22() {
    let pw = pwd2.value;
    let p1 = pwd.value;
    if (p1 != pw) {
        document.getElementById("pwdText2").style.display = 'block';
        pwdcheck = false;
    }
    else {
        document.getElementById("pwdText2").style.display = 'none';
    }
}

// 입력 후 최소 1글자 이상 name, email, phone
const name1 = document.getElementById("name");
const email = document.getElementById("email");
const phone = document.getElementById("phone");
let a = 1;
name1.addEventListener("blur", na);
function na() {
    let ne = name1.value;
    if (ne.length < a) {
        document.getElementById("nameText").style.display = 'block';
        namecheck = false;
    }
    else {
        document.getElementById("nameText").style.display = 'none';
    }
}
email.addEventListener("blur", em);
function em() {
    let ne = email.value;
    if (ne.length < a) {
        document.getElementById("emailText").style.display = 'block';
        emailcheck = false;
    }
    else {
        document.getElementById("emailText").style.display = 'none';
    }
}
phone.addEventListener("blur", ph);
function ph() {
    let ne = phone.value;
    if (ne.length < a) {
        document.getElementById("phoneText").style.display = 'block';
        phonecheck = false;
    }
    else {
        document.getElementById("phoneText").style.display = 'none';
    }
}

// age, birth, gender
agecheck = true;
brithcheck = true;
gendercheck = true;
const age = document.getElementById("age");
age.addEventListener("blur", function () {
    let ne = age.value;
    if (ne.length < a) { // 입력하지 않았을 때
        document.getElementById("ageText").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText").style.display = 'none';
    }
    if (ne < 0) { // 0보다 작을 때
        document.getElementById("ageText1").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText1").style.display = 'none';
    }
    if (isNaN(ne)) { // 숫자가 아닐 때
        document.getElementById("ageText2").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText2").style.display = 'none';
    }
    if (ne.length > 2) { // 3자리 이상일때
        document.getElementById("ageText3").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText3").style.display = 'none';
    }
});

const birth = document.getElementById("birth");
birth.addEventListener("blur", function () {
    let ne = birth.value;
    // 형식에 맞게 입력 - 990807
    if (ne.length < 6) { // 입력한 길이가 6보다 작을 때
        document.getElementById("birthText").style.display = 'block';
        birthcheck = false;
    }
    else {
        document.getElementById("birthText").style.display = 'none';
    }
    if (ne.length > 6) { // 입력한 길이가 6보다 클 때
        document.getElementById("birthText1").style.display = 'block';
        birthcheck = false;
    }
    else {
        document.getElementById("birthText1").style.display = 'none';
    }

    console.log(isNaN(ne));
    console.log(!isNaN(ne));
    if (isNaN(ne)) { // 숫자가 아닐 때 - 문자열이면 true
        document.getElementById("birthText2").style.display = 'block';
        birthcheck = false;
    }
    else {
        document.getElementById("birthText2").style.display = 'none';
    }
});

const gender = document.getElementById("gender");
gender.addEventListener("blur", function () {
    let ne = gender.value;
    if (ne.length < a) {
        document.getElementById("genderText").style.display = 'block';
    }
    else {
        document.getElementById("genderText").style.display = 'none';
    }
    
    // 1자리만 입력가능
    if (ne > 1) {
        document.getElementById("genderText1").style.display = "block";
    }
    else {
        document.getElementById("genderText1").style.display = 'none';
    }
    // 남자 : 1 여자 : 2
    if (!ne == 1) {
        document.getElementById("genderText2").style.display = "block";
    }
    else if (!ne == 2) {
        document.getElementById("genderText2").style.display = "block";
    }
    else {
        document.getElementById("genderText2").style.display = 'none';
    }
});

// id, pwd, name, email, phone의 각 조건을 검사 후 조건이 맞을때만 회원가입 - button
const btn = document.getElementById("btn");
const frm = document.getElementById("frm");

btn.addEventListener("click", function () {
    console.log(idcheck && pwdcheck && namecheck && emailcheck && phonecheck);
    if ((idcheck && pwdcheck && namecheck && emailcheck && phonecheck) == true) {
        frm.submit();
    }
    else {
        alert("조건을 충족하지 못하였습니다.");
    }
});
