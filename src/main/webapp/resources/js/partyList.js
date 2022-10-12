const TT = document.querySelector("#TT")
const MM1 = document.querySelector("#MM1")

HH();
MM();

function HH(){
    for(let i=1; i<25; i++){
        let op = document.createElement("option");
        op.value=i;
        let t = document.createTextNode(i+"시");
        op.appendChild(t);
        TT.appendChild(op);
    }
}

function MM(){
    for(let i=1; i<60; i++){
        let op = document.createElement("option");
        op.value=i;
        let t = document.createTextNode(i+"분");
        op.appendChild(t);
        MM1.appendChild(op);
    }
}
