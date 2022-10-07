const shop = document.querySelector("#shopNum");
const menu = document.querySelector("#menuNum");
const md = document.querySelector("#deleteMenu");
const sd = document.querySelector("#shopDelete");


const m = document.querySelector("#menuDelete");

sd.addEventListener("click", function(){
      alert("가게를 삭제합니다");
      
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

const menuAddNum = document.querySelector("#menuAddNum");
const menuAdd = document.querySelector("#menuAdd");
const realMenu = document.querySelector("#realMenu");


menuAdd.addEventListener("click", function(){
        if(realMenu.value.length > 0){
                alert("이미 대표메뉴가 등록되어있습니다!");
        }
})




menuAddNum.addEventListener("click", function(){
        alert("대표메뉴가 등록되었습니다!!");
           
        
})



