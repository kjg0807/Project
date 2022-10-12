// id를 입력하고 나왔을 때 2글자 미만이면 메세지 출력 : id는 2글자 이상
const id = document.getElementById("id");

idcheck = true;
pwdcheck = true;
namecheck = true;
emailcheck = true;
phonecheck = true;

id.addEventListener("blur", function () {
    console.log("id: " + id.value);
    let d = id.value;
    if (d.length < 2) {
        document.getElementById("idText").style.display = 'block';
        idcheck = false;
    }
    else {
        document.getElementById("idText").style.display = 'none';
        var favoritemovie = d;
        sessionStorage.setItem("favoriteMovie", favoritemovie);
        // window.open("/kjk/member/checkId", "_blank", "width=600,height=600");
        idcheck = true;
    }
    //아이디 중복 확인
    let mbId = $("#id").val();
    $.ajax({
        url: '/kjk/member/checkId',
        type: "post",
        data: { id: mbId },
        dataType: 'json',
        success: function (result) {
            if (result == 1) {
                $("#id_feedback").html("이미 사용중인 아이디입니다.");
                $("#id_feedback").attr("color", "#dc3545");
                idcheck = false;
            }
            else {
                $("#id_feedback").html("사용할 수 있는 아이디입니다.");
                $("#id_feedback").attr("color", "#2fb380");
                idcheck = true;
            }
        },
        error: function () {
            alert("서버 요청 실패");
        }
    })
});

// const idchecked = document.getElementById("idchecked");
// idchecked.addEventListener("click", function () {
//     //ID중복 확인 통신을 위해 입력값을 가져오기
//     const id = $("#id").val();

//     //ajax 호출.
//     //클라이언트에서 서버와 비동기 통신을 진행하는 ajax함수.
//     $.ajax({
//         type: 'post', // 서버에 전송하는 http방식
//         url: '/kjk/member/join', // 서버 요청 url
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         dataType: 'text', //서버로 부터 응답받을 데이터의 형태 
//         data: id, // 서버로 전송할 데이터 // 위에서 지정한 const id 
//         success: function (result) { // 매개변수에 통신성공시 데이터가 저장된다.
//             //서버와 통신성공시 실행할 내용 작성.
//             console.log('통신 성공!' + result);
//             if (result === 'available') {
//                 $('#id').css('background-color', 'aqua');
//                 $('#idChk').html('<b style="font-size: 14px; color: green">[아이디 사용이 가능하다.]</b>');
//                 idcheck = true;
//             } else {
//                 $('#id').css('background-color', 'red');
//                 $('#idChk').html('<b style="font-size: 14px; color: red">[아이디 중복!.]</b>');
//                 idcheck = false;
//             }
//         },
//         error: function (status, error) { //통신에 실패했을때
//             console.log('통신실패');
//             console.log(status, error);
//         }
//     }); // end ajax(아이디 중복 확인)
// })

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
    let ne = name1.value;
    if (ne.length < a) {
        document.getElementById("nameText").style.display = 'block';
        namecheck = false;
    }
    else {
        document.getElementById("nameText").style.display = 'none';
        namecheck = true;
    }
}

var emin = document.getElementById("email2");
var emse = document.getElementById("emse");
let email = document.getElementById("emaill");
let sendEmail = document.getElementById("email");
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
    // console.log(emtext);
    // console.log("변경 테스트: " + emvalue);
    $("#email2").val(emvalue);
    console.log("email all: " + email.value + emin.value);
    let emailValue = email.value + emin.value;
    let rs = emailValue.substring(0, emailValue.indexOf('@'));
    document.getElementById("email").innerHTML = rs;
    sendEmail.value = rs + emin.value;
});

const phone = document.getElementById("phone");

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
        phonecheck = true;
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
        phonecheck = true;
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
    // console.log(ne);
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
const btn = document.getElementById("btn1");
const frm = document.getElementById("frm");

btn.addEventListener("click", function () {
    console.log(idcheck && pwdcheck && namecheck && emailcheck && phonecheck && agecheck && brithcheck && gendercheck);
    if (id.value == pwd.value) {
        alert("아이디와 비밀번호가 동일합니다.");
        return;
    }
    if (id.value.length == 0) {
        alert("아이디가 빈칸입니다.");
        return;
    }
    else if (pwd.value.length == 0) {
        alert("비밀번호가 빈칸입니다.");
        return;
    }
    else if (name1.value.length == 0) {
        alert("닉네임이 빈칸입니다.");
        return;
    }
    else if (sendEmail.value.length == 0) {
        alert("이메일이 빈칸입니다.");
        return;
    }
    else if (phone.value.length == 0) {
        alert("전화번호가 빈칸입니다.");
        return;
    }
    else if (age.value.length == 0) {
        alert("나이가 빈칸입니다.");
        return;
    }
    else if (birth.value.length == 0) {
        alert("생년월일이 빈칸입니다.");
        return;
    }
    else if (gender.value.length == 0) {
        alert("성별이 빈칸입니다.");
        return;
    }
    if ((idcheck && pwdcheck && namecheck && emailcheck && phonecheck && agecheck && brithcheck && gendercheck) == true) {
        frm.submit();
        alert("회원가입에 성공했습니다.");
    }
    else if (idcheck == false) {
        alert("아이디가 조건에 맞지 않습니다.");
        return;
    }
    else if (pwdcheck == false) {
        alert("비밀번호가 조건에 맞지 않습니다.");
        return;
    }
    else if (namecheck == false) {
        alert("닉네임이 조건에 맞지 않습니다.");
        return;
    }
    else if (emailcheck == false) {
        alert("이메일이 조건에 맞지 않습니다.");
        return;
    }
    else if (phonecheck == false) {
        alert("전화번호가 조건에 맞지 않습니다.");
        return;
    }
    else if (agecheck == false) {
        alert("나이가 조건에 맞지 않습니다.");
        return;
    }
    else if (birthcheck == false) {
        alert("생년월일이 조건에 맞지 않습니다.");
        return;
    }
    else if (gendercheck == false) {
        alert("성별이 조건에 맞지 않습니다.");
        return;
    }
    else {
        alert("회원가입에 실패했습니다. 다시 시도해주세요");
        return;
    }
});
