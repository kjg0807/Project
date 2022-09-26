//ReviewsComment.js
const btn = document.querySelector("#btn");
const contents = document.querySelector("#contents");
const writer = document.querySelector("#writer");
const reviewsCommentList = document.querySelector("#reviewsCommentList");
const plus = document.querySelector("#plus");

//page번호를 담는 변수
let page = 1;
//reviewNum 을 담는 변수
const reviewNum = btn.getAttribute("data-reviewNum");
getReviewsCommentList(page,reviewNum);

btn.addEventListener("click", function(){

    let wv = writer.value;
    let cv = contents.value;

    // --ajax--
    

    //1. XMLHTTPREQUEST 생성

    const xhttp = new XMLHttpRequest();

    //2. 메서드 , URL준비
    //요청으 보낼 주소 작성
    xhttp.open("POST", "./reviewsCommentList");

    //3. enctype
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //4. 요청발생

    xhttp.send("reviewNum="+reviewNum+"&writer="+wv+"&contents="+cv);

    //5. 응답처리

    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status == 200){
            let result = xhttp.responseText.trim();

            //응답은 responseText에 담긴다

            console.log(result);
            result = JSON.parse(result);
            if(result.result == 1){
                alert("성공적인 답글 달기~!");

                for(let i=0; i<reviewsCommentList.children.length;){
                    reviewsCommentList.children[0].remove();
                }

                page = 1;

                getReviewsCommentList(page, reviewNum);

            }else{
                alert("답글 달기 실패~!!");
            }
        }
    }
});

function getReviewsCommentList(p, rn){

    //1. XMLHTTPRequest 생성

    const xhttp = new XMLHttpRequest();

    //2. Method, URL
    xhttp.open("POST", "./reviewsCommentList?page=" + p + "&reviewNum=" + rn)

    //3. 요청 발생
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //4. 응답처리
    xhttp.addEventListener("readystatechange", function(){
        console.log(xhttp.responseText);

        //1. jsp에 사용한 결과물
        // reviewsCommentList.innerHTML=xhttp.responseText;

        //2. JSON 결과물
        let result = JSON.parse(xhttp.responseText.trim());

        let pager = result.pager;   //reviewsCommentPager
        let ar = result.list;       //댓글리스트(배열)
        let tb = document.createElement("tbody");

        for(let i=0;i<ar.length;i++){

            let tr = document.createElement("tr");                   //<tr></tr>
            let td = document.createElement("td");                   //<td></td>
            let tdText = document.createTextNode(ar[i].writer);      //<td>ar[i].writer</td>        
            td.appendChild(tdText);
            tr.appendChild(td);

            td = document.createElement("td");
            tdText = document.createElement(ar[i].contents);
            td.appendChild(tdText);
            tr.appendChild(td);

            td = document.createElement("td");
            tdText = document.createElement(ar[i].regDate);
            td.appendChild(tdText);
            tr.appendChild(td);


            td = document.createElement("td");
            tdText = document.createElement("수정");
            tdAttr = document.createAttribute("class");
            tdAttr.value = "update";
            td.setAttributeNode(tdAttr);
            tdAttr = document.createAttribute("data-comment-num");
            tdAttr.value = ar[i].num;
            td.setAttributeNode(tdAttr);
            td.appendChild(tdText);
            tr.appendChild(td);

            td = document.createElement("td");
            tdText = document.createElement("삭제")
            tdAttr = document.createAttribute("class");
            tdAttr.value = "delete";
            td.setAttributeNode(tdAttr);
            tdAttr = document.createAttribute("data-comment-num");
            tdAttr.value = ar[i].num;
            td.setAttributeNode(tdText)
            td.appendChild(tdText)
            tr.appendChild(td);

            tb.append(tr);

            if(page >= pager.totalPage){
                plus.classList.add("disabled");
            }else {
                plus.classList.remove("disabled");
            }

            reviewsCommentList.append(tb);


        }

    });
}



//--------------더보기--------------
plus.addEventListener("click", function(){
    page++;
    const reviewNum = btn.getAttribute("data-reviewNum");
    console.log("page : " , page);
    console.log("reviewNum : " , reviewNum);

    getReviewsCommentList(page,reviewNum);
});

reviewsCommentList.addEventListener("click", function(event){

    //--------------------------update----------------------

    if(event.target.className == "update"){
        let check = window.confirm("수정할래??")
        
        let writer = event.target.previousSibling.previousSibling.previousSibling.innerHTML;
        let contents = event.target.previousSibling.previousSibling.innerHTML;
        let num = event.target.getAttribute("data-comment-num");
        console.log("contents : ", contents);
        document.querySelector("#updateWriter").value = writer;
        document.querySelector("#updateConetents").value = contents;
        document.querySelector("#num").value = num;

        document.getElementById("up").click();          //수정 영역을 클릭하면 강제로 클릭이벤트 발생
    }


    //---------------------------delete------------------------
    if(event.target.className == "delete"){
        let check = window.confirm("삭제할래??");

        if(check){
            let num = event.target.getAttribute("data-comment-num");
            console.log("num : " ,num);


            //1.XMLHTTPResquest
            const xhttp = new XMLHttpRequest();

            //2. 요청정보 (URL, Method)
            xhttp.open("POST", "./reviewsCommentDelete")

            //3. POST이기 떄문에 Header정보를 넣어줘야함
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            //4. 요청 (파라미터와 함께)
            xhttp.send("num=" + num); 
            
            xhttp.onreadystatechange = function(){
                if(xhttp.readyState == 4 && xhttp.status == 200){
                    let result = xhttp.responseText.trim();
                    console.log(result);

                    if(result == 1){
                        alert("삭제 완료!");
                        page = 1;                   //삭제 후 1페이지로 이동
                        for(let i=0; i<reviewsCommentList.children.length;){
                            reviewsCommentList.children[0].remove();
                        }

                        getReviewsCommentList(page, reviewNum);
                    }else{
                        alert("삭제 실패 ㅜ");
                    }
                }
            }
        }
    }
});




//-----------------------Modal Update button Click----------------------------
const update = document.querySelector("#update");
update.addEventListener("click", function(){
    //modal에서 num, contents

    let num = document.getElementById("num").value;
    let contents = document.querySelector("#updateContents").value;

    //------------AJAX-------------

    //1.XHTTPRequest 생성
    const xhttp = new XMLHttpRequest();

    //2. Method, URL 정보
    xhttp.open("POST", "./reviewsCommentUpdate");

    //3. POST이기 때문에 Header정보를 입력해야함
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //4. 요청 실행
    xhttp.send("num="+num+"&contents="+contents);

    //5.응답처리

    xhttp.onreadystatechange = function(){
        if(xhttp.readyState == 4 && xhttp.status == 200){
            let result = xhttp.responseText.trim();

            if(result > 0){
                alert("댓글 수정 성공!!");
                for(let i=0; i<reviewsCommentList.children.length;){
                    reviewsCommentList.children[0].remove();
                }
                page = 1;                       //수정후 페이지 1로 이동

                getReviewsCommentList(page, reviewNum);
            }else{
                alert("댓글 수정 실패ㅜㅜ");
            }
        }
    }
});
