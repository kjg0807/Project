const shop = document.querySelector("#shopNum");
const menu = document.querySelector("#menuNum");
const md = document.querySelector("#deleteMenu");
const shopDelete = document.querySelector("#shopDelete");
const m = document.querySelector("#menuDelete");




const caNumBer = document.querySelector("#caNumBer");
const caNumBerChildren = caNumBer.children;
for(let i=0; i<caNumBerChildren.length; i++){
    caNumBerChildren[i].addEventListener("click", function(){
    })
}

const updateShop = document.getElementById("updateShop");
const modalOpenBtn = document.getElementById("modalOpenBtn");
const updateFrm = document.getElementById("updateFrm");
updateShop.addEventListener("click", function(){
        if(updateShop.getAttribute("data-writer") != updateShop.getAttribute("data-user")){
                alert("작성자만 수정할 수 있습니다");
                return;
        }
        modalOpenBtn.click();
})

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
