// QnaList.js

const updateQna = document.getElementById("updateQna");
const modalOpenBtn = document.getElementById("modalOpenBtn");
updateQna.addEventListener("click", function(){
    if(updateQna.getAttribute("data-userID") != updateQna.getAttribute("data-user")){
        console.log(updateQna.value);
        console.log(data-userID.value);
            alert("작성자만 수정할 수 있습니다");
            return;
    }
    modalOpenBtn.click();
})

const deleteQna = document.getElementById("deleteQna");
const modalOpenBtn1 = document.getElementById("modalOpenBtn1");
deleteQna.addEventListener("click", function(){
    if(deleteQna.getAttribute("data-userID") != deleteQna.getAttribute("data-user")){
            alert("작성자만 삭제할 수 있습니다");
            return;
    }
    modalOpenBtn1.click();
})
