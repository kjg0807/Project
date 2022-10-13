const dtoID = document.getElementById("dtoID");
const revID = document.getElementById("revID");
const reviewButton = document.getElementById("reviewButton");

console.log(dtoID.value);
console.log(revID.value);

reviewButton.addEventListener("click", function () {
    // console.log("버튼 클릭");
    if (dtoID.value == revID.value) {
        document.getElementById("myReview").style.display = 'block';
    } else {
        document.getElementById("myReview").style.display = 'none';
        alert("작성한 리뷰가 없습니다.");
    }
});

// function buttonClick() {
// }
