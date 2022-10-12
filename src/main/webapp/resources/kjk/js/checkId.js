const but = document.getElementById("idchecked");
const userid = document.getElementById("id");
const DTOID = document.getElementById("DTOID");

var joinNum = sessionStorage.getItem("favoriteMovie");
console.log("joinNum: " + joinNum);
const idd = joinNum;
console.log("id: " + idd);
userid.value = idd;
let inputNum = userid.value;

userid.addEventListener("blur", function () {
});

but.addEventListener("click", function () {
    const num = userid.value;

    // var count = 0;
    // $.getJSON('/kjk/member/checkId', { inputNum: num }, function (data) {
    //     if (data.result == 'success') {
    //         if (data.inputNum == 'idDuplicated') {//id 중복시
    //             count = 0;
    //             $('#idChk').html("이미 등록된 아이디입니다.").css('color', 'red');
    //             $('#id').val('').focus();
    //         }
    //         else {
    //             count = 1;
    //             $('#idChk').html("사용 가능한 아이디입니다.").css('color', 'green');
    //         }
    //     }
    //     else {
    //         alert("오류 발생");
    //     };
    // });

    // //input 태그 key 연결
    // $('#frm').submit(function () {
    //     if (count == 0) {
    //         alert("아이디 중복 체크는 필수입니다.");
    //         if ($("#id").val() == '') {
    //             $("#id").focus();
    //             // return;
    //         }
    //         else {
    //             alert("중복 체크 완료");
    //         }
    //         return false;
    //     }
    //     else {
    //         alert("전송");
    //         // window.close();
    //     }
    // })

    // $.ajax({
    //     type: 'post', // 서버에 전송하는 http방식
    //     url: '/kjk/member/checkId', // 서버 요청 url
    //     headers: {
    //         'Content-Type': 'application/json'
    //     },
    //     dataType: 'json', //서버로 부터 응답받을 데이터의 형태 
    //     data: num, // 서버로 전송할 데이터 // 위에서 지정한 const id 
    //     success: function (result) { // 매개변수에 통신성공시 데이터가 저장된다.
    //         //서버와 통신성공시 실행할 내용 작성.
    //         console.log('통신 성공!' + result);
    //         if (result === 'available') {
    //             $('#id').css('background-color', 'aqua');
    //             $('#idChk').html('<b style="font-size: 14px; color: green">사용할 수 있는 아이디입니다.</b>');
    //             idcheck = true;
    //         } else {
    //             $('#id').css('background-color', 'red');
    //             $('#idChk').html('<b style="font-size: 14px; color: red">중복된 아이디입니다.</b>');
    //             idcheck = false;
    //         }
    //     },
    //     error: function (status, error) { //통신에 실패했을때
    //         console.log('통신실패');
    //         console.log(status, error);
    //     }
    // }); // end ajax(아이디 중복 확인)
    // window.close();
})