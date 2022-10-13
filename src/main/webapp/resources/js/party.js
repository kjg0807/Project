//파티가입
const jm = document.querySelector("#joinModal");
const ja = document.querySelector("#joinAge");
const jb = document.querySelector("#joinbtn");
const jn = document.querySelector("#joinNum");
const ju = document.querySelector("#joinUserName");
const jid = document.querySelector("#joinuserID")
const jsn = document.querySelector("#joinShopNum");
const jg = document.getElementsByName("genderRadio");
const jc = document.querySelector("#joinComment");
const bd = document.querySelector("#btndelete")

const pm = document.querySelector("#partyMember");
const pb = document.querySelector("#partybtn");

const reject = document.querySelector("#rejectbtn");
const accept = document.querySelector("#acceptbtn");

bd.addEventListener("click", function(){
    let check3 = window.confirm("삭제 하시겠습니까?");
    console.log(check3);
    if(check3 == true){
        const xhttp = new XMLHttpRequest();
        console.log("체크1")
        xhttp.open("POST",  "./delete");
        
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        console.log(jn.value);
        xhttp.send("partyNum="+jn.value);

        xhttp.onreadystatechange=function(){
   
            if(this.readyState==4 && this.status==200){
                let result = JSON.parse(xhttp.responseText.trim());
                console.log(result);
                console.log(result.result);
                if(result.result==1){
                    alert("삭제 성공");
                    window.location.href = './list';
                }else{
                    alert("삭제 실패")
                }
            }
        }
    }
})

let check1 = false;
doublecheck();
function doublecheck(){
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./partyRequest?partyNum="+jn.value);

    xhttp.send();
    
    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState==4 && this.status==200){

            let result = JSON.parse(xhttp.responseText.trim());
        
            let ar = result;

            for(let i=0; i<ar.length; i++){

                if(ar[i].userName == ju.value && ar[i].partyRequest != null){
                    check1 = true;

                }
            }
        }
    })
}


jb.addEventListener("click",function(){
    let gender = 0;

    for (let i=0; i<jg.length; i++){
        if(jg[i].checked==true){
            gender = jg[i].value
        }
    }
    if(check1 == true){
        alert("신청 대기중입니다.");
        window.location.reload();
    }else{
        console.log(jid.value)
        const xhttp = new XMLHttpRequest();
    
        xhttp.open("POST",  "./partyJoin");
    
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    
        xhttp.send("partyNum="+jn.value+"&userName="+ju.value+"&partyAge="+ja.value+"&partyGender="+gender+"&partyComment="+jc.value
        +"&shopNum="+jsn.value+"&userID="+jid.value);
    
        xhttp.onreadystatechange=function(){
            if(this.readyState==4 && this.status==200){
                let result = xhttp.responseText;
                console.log(result)
                result = JSON.parse(result);
    
                if(result.result){
                    alert("가입신청이 완료되었습니다.")
                    window.location.reload();
                }
            }else{
                console.log("실패")
            }
        }
    }
})

//파티목록 ===
let pn = jn.value;

getRequestList(pn);

function getRequestList(pn){
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./partyRequest?partyNum="+pn);

    xhttp.send();
    
    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState==4 && this.status==200){

            let result = JSON.parse(xhttp.responseText.trim());
        
            let ar = result;

            for(let i=0; i<ar.length; i++){
                let body = document.createElement("tbody")
                let tr = document.createElement("tr");
                let td = document.createElement("td");
                tdput = document.createElement("input");

                if(ar[i].partyRequest == 0){
                    puttype = document.createAttribute("type");
                    puttype.value = "checkbox";
    
                    putid = document.createAttribute("class");
                    putid.value = "partyID";
    
                    putvalue = document.createAttribute("username");
                    putvalue.value = ar[i].userName;
    
                    putnum = document.createAttribute("partynum");
                    putnum.value = pn;
    
                    tdput.setAttributeNode(putnum);
                    tdput.setAttributeNode(putvalue);
                    tdput.setAttributeNode(putid);
                    tdput.setAttributeNode(puttype);
                    td.appendChild(tdput);
                    tr.appendChild(td);
                }else{
                    puttype = document.createAttribute("type");
                    puttype.value = "checkbox";

                    dis = document.createAttribute("disabled");

                    tdput.setAttributeNode(puttype);
                    tdput.setAttributeNode(dis);
                    td.appendChild(tdput);
                    tr.appendChild(td);
                }

                td = document.createElement("td");
                tdtext = document.createTextNode(ar[i].userName);
                td.appendChild(tdtext);
                tr.appendChild(td);

                td = document.createElement("td");
                tdtext = document.createTextNode(ar[i].partyAge);
                td.appendChild(tdtext);
                tr.appendChild(td);

                td = document.createElement("td");
                //성별작성
                tdtext = ar[i].partyGender;
                console.log(tdtext);
                if(tdtext=="1"){
                    tdtext = document.createTextNode("남자")
                }else{
                    tdtext = document.createTextNode("여자");
                }
                console.log(tdtext);
                td.appendChild(tdtext);
                tr.appendChild(td);

                td = document.createElement("td");
                tdtext = document.createTextNode(ar[i].partyComment);
                td.appendChild(tdtext);
                tr.appendChild(td);

                td = document.createElement("td");
                tdtext = ar[i].partyRequest;
                if(tdtext=="0"){
                    tdtext = document.createTextNode("참여대기");
                }else{
                    tdtext = document.createTextNode("참여")
                }
                td.appendChild(tdtext);
                tr.appendChild(td);

                body.appendChild(tr);
                pm.append(body);
            }
            
       }
    })
}

reject.addEventListener("click", function(){
    let check = window.confirm("삭제 하시겠습니까?");
    if(check==true){
        const pid = document.getElementsByClassName('partyID');
        let uv = "";
        let cn = 0;
        for(let i=0; i<pid.length; i++){
            console.log(pid[i].checked+" : "+i);
            if(pid[i].checked){
                uvs = pid[i].getAttribute("username");
                uv = uv+("&userName="+uvs);
                cn++;
            }
        }

        const xhttp = new XMLHttpRequest();

        xhttp.open("POST",  "./partyCancel");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("partyNum="+pn+uv);

        xhttp.onreadystatechange=function(){
            if(this.readyState==4 && this.status==200){
                result = JSON.parse(xhttp.responseText.trim());
                if(result.result == 1){
                    alert(cn+"건 삭제 완료")
                    window.location.reload();
                }else{
                    alert("오류 발생")
                }
            }
            
        }     
    }
})


accept.addEventListener("click", function(){
    let check = window.confirm("승인 하시겠습니까?");
    if(check==true){
        const pid = document.getElementsByClassName('partyID');
        let uv = "";
        let cn = 0;
        for(let i=0; i<pid.length; i++){
            console.log(pid[i].checked+" : "+i);
            if(pid[i].checked){
                uvs = pid[i].getAttribute("username");
                uv = uv+("&userName="+uvs);
                cn++;
            }
        }

        const xhttp = new XMLHttpRequest();

        xhttp.open("POST",  "./partyAccept");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("partyNum="+pn+uv);

        xhttp.onreadystatechange=function(){
            if(this.readyState==4 && this.status==200){
                result = JSON.parse(xhttp.responseText.trim());
                if(result.result == 1){
                    alert(cn+"건 승인 완료")
                    window.location.reload();
                }else{
                    alert("오류 발생")
                }
            }
            
        }     
    }
})
