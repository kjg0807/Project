// id를 입력하고 나왔을 때 2글자 미만이면 메세지 출력 : id는 2글자 이상
const id = document.getElementById("id");

idcheck = true;
pwdcheck = true;
namecheck = true;
emailcheck = true;
phonecheck = true;

id.addEventListener("blur", id1);
function id1() {
    console.log(id.value);
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
        pwdcheck = false;
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

var emin = document.getElementById("email2");
var emse = document.getElementById("emse");

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
    // @ 이후
    emse.addEventListener("change", function () {
        // console.log("value: " + emse.options[emse.selectedIndex].value);
        let emvalue = emse.options[emse.selectedIndex].value;
        // console.log(emvalue);
        // console.log(emtext);
        // console.log("변경 테스트: " + emvalue);
        
        $("#email2").val(emvalue);
        console.log("email all: " + email.value + emin.value);
        if (emailcheck = true) {
            $("#email").val(email.value + emin.value);
            return;
        }
        if(emvalue.val != ''){
            emvalue.val = '';
        }
    });
}




phone.addEventListener("blur", ph);
function ph() {
    let ne = phone.value;
    // 입력하지 않았을 때
    if (ne.length == 0) {
        document.getElementById("phoneText").style.display = 'block';
        phonecheck = false;
    }
    else {
        document.getElementById("phoneText").style.display = 'none';
    }
    // 전화번호 유효 검사
    let regExp = /^(010)-?[0-9]{3,4}-?[0-9]{4}$/;
    const phone_number = document.getElementById("phone");
    phnum = phone_number.value;
    let rs = regExp.test(phnum);
    // console.log(rs);
    if (rs == false) {
        document.getElementById("phoneText1").style.display = 'block';
        phonecheck = false;
    }
    else {
        document.getElementById("phoneText1").style.display = 'none';
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
    // console.log(ne);
    // 아무것도 입력하지 않았을 때
    if (ne.length == 0) {
        document.getElementById("genderText").style.display = 'block';
        gendercheck = false;
    }
    else {
        document.getElementById("genderText").style.display = 'none';
    }
    // 숫자가 아닐 때
    if (isNaN(ne)) {
        document.getElementById("genderText3").style.display = 'block';
        gendercheck = false;
    }
    else {
        document.getElementById("genderText3").style.display = 'none';
    }
    // 남자 : 1 여자 : 2 가 아닐 때
    if (!ne == 1 && !ne == 2) {
        document.getElementById("genderText1").style.display = "block";
        gendercheck = false;
    }
    else {
        document.getElementById("genderText1").style.display = 'none';
    }
    // 2보다 큰 숫자 입력시 , 2자리이상 입력시
    if (ne > 2 || ne.length > 1) {
        document.getElementById("genderText2").style.display = 'block';
        gendercheck = false;
        if (isNaN(ne)) {
            document.getElementById("genderText2").style.display = 'none';
        }
    }
    else {
        document.getElementById("genderText2").style.display = 'none';
    }
});

// id, pwd, name, email, phone의 각 조건을 검사 후 조건이 맞을때만 회원가입 - button
const btn = document.getElementById("btn");
const frm = document.getElementById("frm");

btn.addEventListener("click", function () {
    console.log(idcheck && pwdcheck && namecheck && emailcheck && phonecheck && agecheck && brithcheck && gendercheck);
    if ((idcheck && pwdcheck && namecheck && emailcheck && phonecheck && agecheck && brithcheck && gendercheck) == true) {
        frm.submit();
    }
    else if (idcheck = false) {
        alert("아이디가 조건에 맞지 않습니다.");
    }
    else if (pwdcheck = false) {
        alert("비밀번호가 조건에 맞지 않습니다.");
    }
    else if (namecheck = false) {
        alert("이름이 조건에 맞지 않습니다.");
    }
    else if (emailcheck = false) {
        alert("이메일이 조건에 맞지 않습니다.");
    }
    else if (phonecheck = false) {
        alert("전화번호가 조건에 맞지 않습니다.");
    }
    else if (agecheck = false) {
        alert("나이가 조건에 맞지 않습니다.");
    }
    else if (birthcheck = false) {
        alert("생년월일이 조건에 맞지 않습니다.");
    }
    else if (gendercheck = false) {
        alert("성별이 조건에 맞지 않습니다.");
    }
    else {
        alert("어떤 조건이 틀림")
    }
    if ((id || pwd || name1 || email || phone || age || birth || gender) == "") {
        alert("빈칸이 존재합니다.");
    }
});
