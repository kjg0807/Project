//ReviewsComment.js


//댓글작성 버튼
const btn = document.querySelector("#btn");
const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");
const reviewsCommentList = document.querySelector("#reviewsCommentList");

//댓글코드 시작하는 작성자의 ID명
const userID = document.querySelector("#userID");

//더보기 버튼
const plus = document.querySelector("#plus");
//더보기 페이지를 줄이는 버튼
const minus = document.querySelector("#minus");
//리뷰에 남기는 이미지
const rvimg = document.querySelector("#rvimg");
// 이미지를 감싸는 div태그 클래스명
const modal_1 = document.querySelector("#modal_1");         //태그명이 class명이기 때문에 .으로 선택
// 이미지 태그 안의 class명
const img = document.querySelectorAll(".img");
// 이미지를 눌렀을때 원본이미지
const modal_contents = document.querySelector(".modal_contents");
// 모달창에 있는 원본이미지 닫기버튼
const clos = document.querySelector(".close");

const cat = document.querySelector("#cat");
const cat2 = document.querySelector("#cat2");





//page번호를 담는 변수
let page = 1;
//reviewNum 을 담는 변수
const reviewNum = btn.getAttribute("data-reviewNum");
getReviewsCommentList(page,reviewNum);


//댓글작성 버튼 클릭 이벤트
btn.addEventListener("click", function(){

    console.log("댓글작성 버튼 클릭");
    console.log(reviewNum);

    let uv = userID.value;
    let cv = contents.value;
    console.log(uv);
    console.log(cv);


    if(contents.value == ""){
        alert("내용을 입력 해주세요.");
    }else{
        
    


        //댓글달기


        // --ajax--
        

        //1. XMLHTTPREQUEST 생성

        const xhttp = new XMLHttpRequest();

        //2. 메서드 , URL준비
        //요청을 보낼 주소 작성
        xhttp.open("POST", "reviewsCommentAdd");

        //3. enctype
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        //4. 요청발생

        xhttp.send("reviewNum="+reviewNum+"&userID="+uv+"&contents="+cv);

        //5. 응답처리

        xhttp.onreadystatechange=function(){
            if(this.readyState==4 && this.status == 200){
                let result = xhttp.responseText.trim();

                //응답은 responseText에 담긴다

                console.log(result);

                    
                if(result == 1){
                    confirm("댓글이 성공적으로 달렸습니다.");
                    // self.close();
                        
                    for(let i=0; i<reviewsCommentList.children.length;){
                        console.log("zzzzzzzzzzzzzzzz : ",reviewsCommentList.children[0]);
                        // reviewsCommentList.children[0].remove();
                        reviewsCommentList.children[0].remove();
                        }

                        //댓글을 달면 1페이지로 보여줌
                        page = 1;
                        
                        getReviewsCommentList(page, reviewNum);
                        
                       
                        contents.value='';
                        
                }else{
                    alert("댓글 남기기가 실패하였습니다.");
                }
                
                // if(!contents){
                //     alert("내용을 입력해주세요.");
                // }else if(result == 1){
                //     alert("댓글이 성공적으로 달렸습니다.");

                //     for(let i=0; i<reviewsCommentList.children.length;){
                //         console.log("코맨트 배열 자식들 : " , reviewsCommentList.children[0]);
                //         reviewsCommentList.children[0].remove();
                //     }


                //     page= 1;

                //     getReviewsCommentList(page,reviewNum);

                //     writer.value = '';
                //     contents.value = '';
                // }else{
                //     alert("댓글 작성을 실패하였습니다.");
                // }
            }
        }
    }//첫 if/else문 끝
});

function getReviewsCommentList(p, rn){

    //1. XMLHTTPRequest 생성

    const xhttp = new XMLHttpRequest();

    //2. Method, URL
    xhttp.open("GET", "./reviewsCommentList?page=" + p + "&reviewNum=" + rn)

    // 3. 요청 발생
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

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
                let tdText = document.createTextNode(ar[i].userID);      //<td>ar[i].writer</td>        
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
   
                console.log('more : ', page > result.reviewsCommentPager.totalPage)
                // //더보기 버튼
                // if(page > result.reviewsCommentPager.totalPage){
                //     plus.classList.add("disabled");
                // }else {
                //     plus.classList.remove("disabled");
                // }


                // //더보기로 늘어난 창 줄이기 버튼

                // //지금 페이지가 한페이지에 출력할 글의 갯수(perPage)보다 작다면 minus버튼 활성화
                // //더보기로 끝까지 핀 전체 페이지가 현재페이지와 같으면 활성화
                // if(page == result.reviewsCommentPager.totalPage){
                //     minus.classList.add("disabled");
                // }else{
                //     minus.classList.remove("disabled");
                // }
                
    
                reviewsCommentList.append(tb);
    
                

    
            }//for문 끝

                //더보기 버튼
                if(page >= result.reviewsCommentPager.totalPage){
                    plus.classList.add("disabled");
                    // minus.classList.remove("disabled");
                }else {
                    // minus.classList.add("disabled");
                    plus.classList.remove("disabled");
                }

                if(page == result.reviewsCommentPager.totalPage){
                    minus.classList.remove("disabled");
                }else{
                    minus.classList.add("disabled");
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
    page = 1;
    const reviewNum = btn.getAttribute("data-reviewNum");
    console.log("reviewNum : " , reviewNum);

    console.log(getReviewsCommentList(page,reviewNum));
    getReviewsCommentList(page,reviewNum);
    console.log("parendNode : " , reviewsCommentList.parentNode);

    reviewsCommentList.tb.remove();
    

});

reviewsCommentList.addEventListener("click", function(event){

    //--------------------------update----------------------

    if(event.target.className == "update"){
        let check = window.confirm("수정을 하시겠습니까??")
        if(check != true ){
            return false;
        }
        
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
        let check = window.confirm("삭제를 하시겠십니까?");

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
                        alert("삭제가 되었습니다!");
                        page = 1;                   //삭제 후 1페이지로 이동
                        for(let i=0; i<reviewsCommentList.children.length;){
                            reviewsCommentList.children[0].remove();
                        }

                        getReviewsCommentList(page, reviewNum);
                    }else{
                        alert("삭제를 실패했습니다.");
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
                alert("댓글 수정이 성공하였습니다!");
                for(let i=0; i<reviewsCommentList.children.length;){
                    reviewsCommentList.children[0].remove();
                }
                page = 1;                       //수정후 페이지 1로 이동

                getReviewsCommentList(page, reviewNum);
            }else{
                alert("댓글 수정이 실패하였습니다.");
            }
        }
    }
});

rvimg.addEventListener("click", function(event){
    // rvimg.click();
    // let check = window.confirm("이미지를 바꾸시겠습니까?");
    console.log("이미지 강제클릭 이벤트");
    
    
    let num = document.getElementById("num").value;

    let writer = document.getElementById("writer").value;
    let contents = document.getElementById("contents").value;


    //--ajax--
    const xhttp = XMLHttpRequest();

    xhttp.open("POST", "./reviewsFilesDelete");

    xhttp.send("num="+num+"&writer"+writer+"&contents"+contents);

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.onreadystatechange = function(){

        if(xhttp.status = 200 && xhttp.readyState == 4){
            let result = xhttp.responseText.trim();

            if(result>0){
                confirm("")
            }
        }

    }

});


//이미지 클릭시 모달창을 띄우고 모달의 display를 "block"으로 변경후, 이미지의 display로 block 으로 바꾼다.
//                         => 모달창을 스크롤할 때 모달창 뒤에 있는 이미지 등이 움직이지 않게 하기 위해서

//-------------------------------------------------------------------------------------
img.forEach(function(im, index){
    console.log(im);
    im.addEventListener("click", function(){
        const modalExecute = document.querySelector("#modalExecute");
        modalExecute.click();

        // modalDisplay("block");
        // modal_contents.src = im.src;
        console.log("이미지 클릭");
        console.log(im.src);            //이미지 속성값

        const c1 = document.querySelector("#c1");
        

        c1.src = im.src;                //이미지 속성값을 이미지 링크에있는 src속성값에 보내줌

        // c1.style.width = 600+"px";
        // c1.style.height = auto;
        // c1.style.margin = 0;
        // c1.style.padding = 0;
        
    })
})

//-----------------------------------------------------------------------------------------
// img.addEventListener("click", ()=>{

//     modalDisplay("block");
//     modal_contents.src = img.src;
//     console.log("이미지 클릭");
// });


// 닫기 X 버튼과 모달의 공백부분을 클릭 했을때 모달창을 none으로 바꾼다 ===> 모달창 공백 아무곳이나 닫기버튼을 누르면 원본이미지가 꺼진다
clos.addEventListener("click", ()=>{

    modalDisplay("none");
});

modal_1.addEventListener("click", ()=>{

    modalDisplay("none");
});



//위에서 쓰인 modalDisplay() 함수, text로 받은 값을 display값으로 변경함
function modalDisplay(text){
    modal_1.style.display='block';
    console.log(modal_1.style.display);
    //modal_1.sytle.display = text; 

}





// img.addEventListener("click", function(){
//     confirm();
//     console.log("이미지 클릭222");
// });

// cat2.addEventListener("click", function(){
//     cat.click();
// });


//리스트 테이블 tr을 눌렀을때 조회수 1씩 증가

const trow = document.querySelectorAll("#trow");

trow.forEach(function(tr, index){
    console.log(tr);

    tr.addEventListener("click", function(){
        console.log("tr 클릭이벤트");
    });
});
