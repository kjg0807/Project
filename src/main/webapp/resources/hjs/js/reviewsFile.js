//reviewsFile.js
const fileAdd = document.getElementById("fileAdd"); //  reviews/add.jsp에 있는 파일추가 div버튼 id
const addFiles = document.getElementById("addFiles");   //  "
const reviewsFilesDelete = document.querySelectorAll("#reviewsFilesDelete");  //forEach가능

//수정하기에 보이는 이미지 ID명
const img = document.querySelectorAll("#img");



//============================= Review Add할때 fileAdd   ========================

let idx = 0;
let count = 0;

function setCount(c){
    if(c>=0){
        count = c;
    }
}

try{
    addFiles.addEventListener("click", function(e){



        console.log("실행됨?")
        if(count>2){
            alert("이미지 첨부는 최대 3장만 가능합니다.");
            return;
        }


        // <div id="addfiles" class="mb-3">
        //     <button type="button" id="fileAdd" class="btn btn-secondary">파일추가</button>
        // </div>

        //부모 Element div 생성하기
        let div = document.createElement("div");    //<div></div>
        let classes = document.createAttribute("class");  //class=""
        classes.value = "mb-3";                           //class="mb-3"
        div.setAttributeNode(classes);                  //<div class="mb-3"></div>
        classes = document.createAttribute("id");   //
        classes.value="file"+idx;                          
        div.setAttributeNode(classes);                     //<div class="mb-3" id="file+i"></div> 

        console.log("한종석배고픔상태")
        //자식 Element Lable생성
        let label = document.createElement("label");            //<label></label>
        let labelText = document.createTextNode("File");        
        label.appendChild(labelText);                           //<label>File</label>
        let labelClass = document.createAttribute("class");     //<label class="">File</label>
        labelClass.value="form-label";
        label.setAttributeNode(labelClass);                     //<label class="form-label">File</label>
        labelClass = document.createAttribute("for");           //<label class="form-label" for="">File</label>
        labelClass.value="files"                                
        label.setAttributeNode(labelClass);                     //<label class="form-label" for="files">File</label>

        div.appendChild(label);

        //자식 Input 생성
        let input = document.createElement("input");            //<input></input>
        let inputAttr = document.createAttribute("type");       //<input type=""></input>
        inputAttr.value = "file";
        input.setAttributeNode(inputAttr);                      //<input type="file"></input>
            
        inputAttr = document.createAttribute("name");           //<input type="file" name=""></input>
        inputAttr.value = "files";
        input.setAttributeNode(inputAttr);                      //<input type="file" name="files"></input>

        inputAttr = document.createAttribute("class");          //<input type="file" name="file" class=""></input>
        inputAttr.value = "form-control";
        input.setAttributeNode(inputAttr);                      //<input type="file" name="file" class="form-control"></input>

        inputAttr = document.createAttribute("id");             //<input type="file" name="file" class="form-control" id=""></input>
        inputAttr.value = "file";
        input.setAttributeNode(inputAttr);                      //<input type="file" name="file" class="form-control" id="file"></input>

        div.appendChild(input);

    
         //  <div class="mb-3">
        //     <label for="file" class="form-label">File</label>
        //     <input type="file" name="files" class="form-control" id="file">
        //   </div>

        // <button type="button" id="fileAdd" class="btn btn-secondary">파일추가</button>


        //자식 Element 삭제 버튼 만들기
        let button = document.createElement("button");      //<button>
        let buttonText = document.createTextNode("삭제");
        button.appendChild(buttonText);                    //<button>싹제</button>
        let buttonAttr = document.createAttribute("type");  //<button type="">싹제</button>
        buttonAttr.value = "button";                        
        button.setAttributeNode(buttonAttr);                //<button type="button">싹제</button>

        buttonAttr = document.createAttribute("class");     //<button type="button" class="">싹제</button>
        buttonAttr.value = "del btn btn-danger";            //class="del btn btn-danger"
        button.setAttributeNode(buttonAttr);                //<button type="button" class="del btn btn-danger">싹제</button>

        buttonAttr = document.createAttribute("title");     
        buttonAttr.value = idx;
        button.setAttributeNode(buttonAttr);

        div.appendChild(button);

        fileAdd.append(div);


      
        count ++;
        idx ++;
        

    });

    //삭제 클릭이벤트 만들기

    fileAdd.addEventListener("click", function(event){
        let button = event.target;
        if(event.target.classList[0]=='del'){
            alert(button.title);
            document.getElementById("file"+ button.title).remove();
            count--;
        }
    });


}catch(e){

}





//---------------------리뷰 수정할때 파일 수정/삭제---------------------


//배열(forEach)로 생성

//예외처리때문에 try catch 사용
try{
reviewsFilesDelete.forEach(function(f){

    f.addEventListener("click", function(){



        console.log(f.parentNode);

        let check = window.confirm("삭제를 원하십니까??");


        //삭제를 원하지 않다면 return;
        if(!check){
            return;
        }
         
        let filesNum = f.getAttribute("data-file-filesNum");


        //1. XTMLHTTPRequest 생성
        const xhttp = new XMLHttpRequest();


        //2. 메서드,URL 준비
        // 요청을 보낼 주소 작성
        xhttp.open("POST", "./reviewsFilesDelete");


        //3. enctype(헤더 정보) / GET 메서드일땐 필요없음
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        //4. 요청 발생, 전송(post일 경우 파라미터 추가)
        console.log(filesNum);
        xhttp.send("filesNum="+filesNum);


        //5. 응답 처리
        xhttp.onreadystatechange = function(){
            if(xhttp.status == 200 && xhttp.readyState == 4){
                //결과를 responseText에 담는다
                let result = xhttp.responseText.trim();
                if(result == 1){
                    alert("삭제 완료");
                    //
                    console.log(f.parentNode);
                    f.parentNode.remove();
                    //파일을 삭제하면 총합 3개까지 다시 만들수 있도록 삭제한 수 만큼 총 파일수에서 --
                    count--;
                }else{
                    alert("삭제 실패");
                }
            }
        }

    });
});
}catch(e){
    console.log(e);
}


img.forEach(function(im, index){

    const c2 = document.querySelector("#c2");

    c2.src = im.src;

});
