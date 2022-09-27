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
