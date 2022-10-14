let id = document.getElementById("id");

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
        idcheck = true;
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
        pwdcheck = true;
    }
}

// pwd를 입력하고 나왔을 때 첫번째 pwd와 값 비교 후 메세지 출력 : 같다, 다르다
const pwd2 = document.getElementById("pwd2");
// 입력하고 다른 곳 클릭하면 값 비교 후 출력
pwd2.addEventListener("blur", pwd22);
function pwd22() {
    let pw = pwd2.value;
    let p1 = pwd.value;
    console.log("pwd2: " + pw);
    if (p1 != pw) {
        document.getElementById("pwdText2").style.display = 'block';
        pwdcheck = false;
    }
    else {
        document.getElementById("pwdText2").style.display = 'none';
        pwdcheck = true;
    }
}

// 입력 후 최소 1글자 이상 name, email, phone
const name1 = document.getElementById("name");
let a = 1;
name1.addEventListener("blur", na);
function na() {
    // 이 범위 안에 형식을 전체에 적용하기
    let ne = name1.value;
    let una = document.getElementById("name");
    una.value = ne;
    console.log("name: " + una.value);
    //
    if (ne.length < a) {
        document.getElementById("nameText").style.display = 'block';
        namecheck = false;
    }
    else {
        document.getElementById("nameText").style.display = 'none';
        namecheck = true;
    }
    let mbId = $("#name").val();
    $.ajax({
        url: '/kjk/member/checkName',
        type: "post",
        data: { name: mbId },
        dataType: 'text',
        success: function (result) {
            if (result == 1) {
                $("#name_feedback").html("이미 사용중인 닉네임입니다.");
                $("#name_feedback").attr("color", "#dc3545");
                namecheck = false;
            }
            else {
                if(ne.length < a){
                    document.getElementById("nameText").style.display = 'block';
                    namecheck = false;
                    $("#name_feedback").html("");
                    return;
                }
                $("#name_feedback").html("사용할 수 있는 닉네임입니다.");
                $("#name_feedback").attr("color", "#2fb380");
                namecheck = true;
            }
        },
        error: function () {
            alert("서버 요청 실패");
        }
    })
}

var emin = document.getElementById("email2");
var emse = document.getElementById("emses");
let email = document.getElementById("emaill");
let sendEmail = document.getElementById("email");
let se = sendEmail.value;

email.value = se.substring(0, se.indexOf('@'));
console.log("@ front email: "+ email.value);
$("#emaill").val(email.value);

// emin.value = se.substring(se.indexOf('@'));
// console.log("@ back email: "+emin.value);
// $("#email2").val(emin.value);

email.addEventListener("blur", em);
function em() {
    let ne = email.value;
    if (ne.length < a) {
        document.getElementById("emailText").style.display = 'block';
        emailcheck = false;
    }
    else {
        document.getElementById("emailText").style.display = 'none';
        emailcheck = true;
    }
}


// @ 이후
emse.addEventListener("change", function () {
    // console.log("value: " + emse.options[emse.selectedIndex].value);
    let emvalue = emse.options[emse.selectedIndex].value;
    // console.log(emvalue);

    $("#email2").val(emvalue);
    // console.log("email all: " + email.value + emin.value);
    let emailValue = email.value + emin.value;
    let rs = emailValue.substring(0, emailValue.indexOf('@'));
    document.getElementById("email").innerHTML = rs;
    sendEmail.value = rs + emin.value;
    console.log("email: " + sendEmail.value);
});

const phone = document.getElementById("phone");

phone.addEventListener("blur", function(){
    let ne = phone.value; // 입력하지 않았을 때
    console.log("phone: " + ne);
    if (ne.length == 0) {
        document.getElementById("phoneText").style.display = 'block';
        phonecheck = false;
    }
    else {
        document.getElementById("phoneText").style.display = 'none';
        phonecheck = true;
    }
    // 전화번호 유효 검사
    let regExp = /^(010)-?[0-9]{3,4}-?[0-9]{4}$/;
    const phone_number = document.getElementById("phone");
    let phnum = phone_number.value;
    let rs = regExp.test(phnum);
    // console.log(rs);
    if (rs == false) {
        document.getElementById("phoneText1").style.display = 'block';
        phonecheck = false;
    }
    else {
        document.getElementById("phoneText1").style.display = 'none';
        phonecheck = true;
    }
});

// age, birth, gender
agecheck = true;
birthcheck = true;
gendercheck = true;
const age = document.getElementById("age");
age.addEventListener("blur", function () {
    let ne = age.value;
    console.log("age: " + ne);
    if (ne.length < a) { // 입력하지 않았을 때
        document.getElementById("ageText").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText").style.display = 'none';
        agecheck = true;
    }
    if (ne < 0) { // 0보다 작을 때
        document.getElementById("ageText1").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText1").style.display = 'none';
        agecheck = true;
    }
    if (isNaN(ne)) { // 숫자가 아닐 때
        document.getElementById("ageText2").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText2").style.display = 'none';
        agecheck = true;
    }
    if (ne.length > 2) { // 3자리 이상일때
        document.getElementById("ageText3").style.display = 'block';
        agecheck = false;
    }
    else {
        document.getElementById("ageText3").style.display = 'none';
        agecheck = true;
    }
});

const birth = document.getElementById("birth");
birth.addEventListener("blur", function () {
    let ne = birth.value;
    console.log("birth: " + ne);
    // 형식에 맞게 입력 - 990807
    if (ne.length < 6) { // 입력한 길이가 6보다 작을 때
        document.getElementById("birthText").style.display = 'block';
        birthcheck = false;
    }
    else {
        document.getElementById("birthText").style.display = 'none';
        birthcheck = true;
    }
    if (ne.length > 6) { // 입력한 길이가 6보다 클 때
        document.getElementById("birthText1").style.display = 'block';
        birthcheck = false;
    }
    else {
        document.getElementById("birthText1").style.display = 'none';
        birthcheck = true;
    }
    if (isNaN(ne)) { // 숫자가 아닐 때 - 문자열이면 true
        document.getElementById("birthText2").style.display = 'block';
        birthcheck = false;
    }
    else {
        document.getElementById("birthText2").style.display = 'none';
        birthcheck = true;
    }
});

const gender = document.getElementById("gender");
gender.addEventListener("blur", function () {
    let ne = gender.value;
    console.log("gender: " + ne);
    // 아무것도 입력하지 않았을 때
    if (ne.length == 0) {
        document.getElementById("genderText").style.display = 'block';
        gendercheck = false;
    }
    else {
        document.getElementById("genderText").style.display = 'none';
        gendercheck = true;
    }
    // 숫자가 아닐 때
    if (isNaN(ne)) {
        document.getElementById("genderText3").style.display = 'block';
        gendercheck = false;
    }
    else {
        document.getElementById("genderText3").style.display = 'none';
        gendercheck = true;
    }
    // 남자 : 1 여자 : 2 가 아닐 때
    if (!ne == 1 && !ne == 2) {
        document.getElementById("genderText1").style.display = "block";
        gendercheck = false;
    }
    else {
        document.getElementById("genderText1").style.display = 'none';
        gendercheck = true;
    }
    // 2보다 큰 숫자 입력시 , 2자리이상 입력시
    if (ne > 2 || ne.length > 1) {
        document.getElementById("genderText2").style.display = 'block';
        gendercheck = false;
        if (isNaN(ne)) {
            document.getElementById("genderText2").style.display = 'none';
            gendercheck = true;
        }
    }
    else {
        document.getElementById("genderText2").style.display = 'none';
        gendercheck = true;
    }
});

// id, pwd, name, email, phone의 각 조건을 검사 후 조건이 맞을때만 회원가입 - button
const btn = document.getElementById("btn");
const frm = document.getElementById("frm");

btn.addEventListener("click", function () {
    let ebm = idcheck && pwdcheck && namecheck && emailcheck && phonecheck && agecheck && birthcheck && gendercheck;
    console.log(ebm == 1);
    if ((idcheck && pwdcheck && namecheck && emailcheck && phonecheck && agecheck && birthcheck && gendercheck) == true) {
        frm.submit();
        alert("바뀌지 않으면 새로고침하세요.");
    }
    else if(namecheck == false){
        alert("동일한 이름이 존재합니다.");
        return;
    }
    else{
        alert("수정에 실패했습니다. 다시 시도해주세요");
        return;
    }
    if ((id || pwd || name1 || email || phone || age || birth || gender) == "") {
        alert("빈칸이 존재합니다.");
    }
});
