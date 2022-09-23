const jb = document.querySelector("#joinbtn");
//---- 파티가입 모달버튼 -----
// pj.addEventListener("click",function(){
    
// })
age();

function age(){
    console.log("테스트")
    const ja = document.querySelector("#joinAge")
    for(let i=0; i<101; i++){
        console.log("테스트2")
        ja.innerHTML("<option value="+i+">"+i+"번</option>");   
    }
}
