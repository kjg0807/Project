const sn = document.querySelector("#searchNull");
const s = document.querySelector("#search");


sn.addEventListener("click", function(){
    let ss = s.value;
    console.log(ss);
    if(ss <= 0){
        alert("검색어를 입력해주세요");
        return;
    }
})
