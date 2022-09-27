//ReviewsComment.js
const btn = document.querySelector("#btn");
const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");
const reviewsCommentList = document.querySelector("#reviewsCommentList");
const plus = document.querySelector("#plus");
const minus = document.querySelector("#minus");

//page번호를 담는 변수
let page = 1;
//reviewNum 을 담는 변수
const reviewNum = btn.getAttribute("data-reviewNum");
getReviewsCommentList(page,reviewNum);

btn.addEventListener("click", function(){

    console.log("댓글작성 버튼 클릭");
    console.log(reviewNum);

    let wv = writer.value;
    let cv = contents.value;
    console.log(wv);
    console.log(cv);

    // --ajax--
    

    //1. XMLHTTPREQUEST 생성

    const xhttp = new XMLHttpRequest();

    //2. 메서드 , URL준비
    //요청을 보낼 주소 작성
    xhttp.open("POST", "reviewsCommentAdd");

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
            
            if(result == 1){
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
    xhttp.open("GET", "./reviewsCommentList?page=" + p + "&reviewNum=" + rn)

    // 3. 요청 발생
    // xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send();

    //4. 응답처리
    xhttp.addEventListener("readystatechange", function(){
        if(xhttp.readyState==4 && xhttp.status==200){

            console.log(xhttp.responseText);
    
            //1. jsp에 사용한 결과물
            //reviewsCommentList.innerHTML=xhttp.responseText;
    
            //2. JSON 결과물
             let result = JSON.parse(xhttp.responseText.trim());
            //let result = xhttp.responseText.trim();
            console.log("result",result);
    
            let pager = result.pager;   //reviewsCommentPager
            let ar = result.list;       //댓글리스트(배열)
            // let pager = document.createElement("pager");
            // let ar = document.createElement("ar");
            console.log("ar",ar)
            console.log(result.reviewsCommentPager);
            console.log(result.reviewsCommentPager.totalPage);
            let tb = document.createElement("tbody");
    
            for(let i=0;i<ar.length;i++){
    
                let tr = document.createElement("tr");                   //<tr></tr>
                let td = document.createElement("td");                   //<td></td>
                let tdText = document.createTextNode(ar[i].writer);      //<td>ar[i].writer</td>        
                td.appendChild(tdText);
                tr.appendChild(td);
    
                td = document.createElement("td");
                tdText = document.createTextNode(ar[i].contents);
                td.appendChild(tdText);
                tr.appendChild(td);
    
                td = document.createElement("td");
                tdText = document.createTextNode(ar[i].regDate);
                td.appendChild(tdText);
                tr.appendChild(td);
    
    
                td = document.createElement("td");
                tdText = document.createTextNode("수정");
                let tdAttr = document.createAttribute("class");
                tdAttr.value = "update";
                td.setAttributeNode(tdAttr);
                tdAttr = document.createAttribute("data-comment-num");
                tdAttr.value = ar[i].num;
                td.setAttributeNode(tdAttr);
                td.appendChild(tdText);
                tr.appendChild(td);
    
                td = document.createElement("td");
                tdText = document.createTextNode("삭제")
                tdAttr = document.createAttribute("class");
                tdAttr.value = "delete";
                td.setAttributeNode(tdAttr);
                tdAttr = document.createAttribute("data-comment-num");
                tdAttr.value = ar[i].num;
                td.setAttributeNode(tdAttr)
                td.appendChild(tdText)
                tr.appendChild(td);
    
                tb.appendChild(tr);
    
                if(page >= result.reviewsCommentPager.totalPage){
                    plus.classList.add("disabled");
                }else {
                    plus.classList.remove("disabled");
                }

                if(page >= result.reviewsCommentPager.totalPage){
                    minus.classList.add("disabled");
                }else{
                    minus.classList.remove("disabled");
                }
    
                reviewsCommentList.append(tb);
    
    
            }
        }//if end

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

//----------------더보기 닫기---------------
minus.addEventListener("click", function(){
    page--;
    const reviewNum = btn.getAttribute("data-reviewNum");
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
        document.querySelector("#updateWriter").value = writer;
        document.querySelector("#updateContents").value = contents;
        document.querySelector("#num").value = num;
        console.log("contents : ", contents);
        console.log("writer : ", writer);

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
                        return;
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
    let writer = document.querySelector("#updateWriter").value;
    let contents = document.querySelector("#updateContents").value;

    //------------AJAX-------------

    //1.XHTTPRequest 생성
    const xhttp = new XMLHttpRequest();

    //2. Method, URL 정보
    xhttp.open("POST", "./reviewsCommentUpdate");

    //3. POST이기 때문에 Header정보를 입력해야함
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //4. 요청 실행
    xhttp.send("num="+num+"&writer"+writer+"&contents="+contents);

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
