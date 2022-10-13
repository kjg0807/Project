// QnaList.js

const updateQna = document.getElementById("updateQna");
const modalOpenBtn = document.getElementById("modalOpenBtn");
updateQna.addEventListener("click", function(){
    if(updateQna.getAttribute("data-userID") != updateQna.getAttribute("data-user")){
            alert("작성자만 수정할 수 있습니다");
            return;
    }
    modalOpenBtn.click();
})