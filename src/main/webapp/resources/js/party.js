//파티가입
const jm = document.querySelector("#joinModal");
const ja = document.getElementById("joinAge");
const jb = document.querySelector("#joinbtn");
const jn = document.querySelector("#joinNum")
const ju = document.querySelector("#joinUserName")
const jg = document.getElementsByName("genderRadio")
const jc = document.querySelector("#joinComment")

const pm = document.querySelector("#partyMember");
const pb = document.querySelector("#partybtn");

const reject = document.querySelector("#rejectbtn");
const accept = document.querySelector("#acceptbtn");

jm.addEventListener("click",age())

function age(){
    for(let i=0; i<101; i++){
        let op = document.createElement("option");
        op.value=i;
        let t = document.createTextNode(i+"세");
        op.appendChild(t);
        ja.appendChild(op);
    }
}

jb.addEventListener("click",function(){
    let gender = 0;

    for (let i=0; i<jg.length; i++){
        if(jg[i].checked==true){
            gender = jg[i].value
        }
    }
    
    const xhttp = new XMLHttpRequest();

    xhttp.open("POST",  "./partyJoin");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send("partyNum="+jn.value+"&userName="+ju.value+"&partyAge="+ja.value+"&partyGender="+gender+"&partyComment="+jc.value);

    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200){
            let result = xhttp.responseText;
            console.log(result)
            result = JSON.parse(result);

            if(result.result){
                alert("가입신청이 안료되었습니다.")
                window.location.reload();
            }
        }else{
            console.log("실패")
        }
    }
})

//파티목록 ===
let pn = jn.value;

pb.addEventListener("click", function(){
    getRequestList(pn);
})

function getRequestList(pn){
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./partyRequest?partyNum="+pn);

    xhttp.send();
    
    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState==4 && this.status==200){

            let result = JSON.parse(xhttp.responseText.trim());
        
            let ar = result;

            console.log(ar[0].userName);

            for(let i=0; i<ar.length; i++){
                let tr = document.createElement("tr");
                let td = document.createElement("td");
                tdput = document.createElement("input");

                puttype = document.createAttribute("type");
                puttype.value = "checkbox";

                putid = document.createAttribute("id");
                putid.value = "partyID"+i;

                putvalue = document.createAttribute("username");
                putvalue.value = ar[i].userName;

                putnum = document.createAttribute("partnum");
                putnum.value = pn;

                tdput.setAttributeNode(putnum);
                tdput.setAttributeNode(putvalue);
                tdput.setAttributeNode(putid);
                tdput.setAttributeNode(puttype);
                td.appendChild(tdput);
                tr.appendChild(td);

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

                pm.append(tr);
            }
            
       }
    })
}

reject.addEventListener("click", function(){
    let check = window.confirm("삭제 하시겠습니까?");
    if(check==true){
        for(let i=0; i<10; i++){
            const pid = document.querySelector("#partyID"+i)
            if(pid != null){
                if(pid.checked){
                    let uv = pid.getAttribute("username");

                    const xhttp = new XMLHttpRequest();

                    xhttp.open("POST",  "./partyCancel");

                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                    xhttp.send("partyNum="+pn+"&userName="+uv);

                    xhttp.onreadystatechange=function(){
                        if(this.readyState==4 && this.status==200){
                            let result = xhttp.responseText.trim();
                            if(result == 1){

                            }
                        }
                        
                }
            }
        }
    }

})