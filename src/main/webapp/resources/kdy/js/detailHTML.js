const shop = document.querySelector("#shopNum");
const menu = document.querySelector("#menuNum");
const md = document.querySelector("#deleteMenu");
const sd = document.querySelector("#shopDelete");

const btn = document.querySelector("#num");

btn.addEventListener("click", function(){
console.log(shop.vlaue);
console.log(menu.vlaue);
});


const m = document.querySelector("#menuDelete");

sd.addEventListener("click", function(){
        md.click();
})

const caNumBer = document.querySelector("#caNumBer");
const caNumBerChildren = caNumBer.children;
for(let i=0; i<caNumBerChildren.length; i++){
    caNumBerChildren[i].addEventListener("click", function(){
    })
}

m.addEventListener("click", function(){
        alert("대표메뉴 한가지를 삭제합니다");
        md.click();
})
