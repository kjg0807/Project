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

const all = document.querySelectorAll(".cs");

for(let i = 0; i < all.length; i++){
    all[i].addEventListener("click", function(){
        console.log("all click")
        
    })
}

/*const categoryN = document.querySelector("#categoryName");
const cakor = document.querySelector(".categorykor")
// categorykor.addEventListener("click", function(event){
//     event.target
//     let ca = event.target.get
// })

cakor.addEventListener("click", function(event){
    event.target
    let ca = event.target.value;
    console.log(ca);
})*/

const tttt = document.querySelector("#tttt");
const ttttChildren = tttt.children;

for(let i = 0; i < ttttChildren.length; i++){
    ttttChildren[i].addEventListener("click", function(){
        console.log(ttttChildren[i].getAttribute("data-category"));
        location.href="../shop/listHTML?categoryName=" + ttttChildren[i].getAttribute("data-category");
    });
}


