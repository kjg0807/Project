const cccc = document.querySelector("#cccc");
const ccccChildren = cccc.children;

for(let i =0; i < ccccChildren.length; i++){
    ccccChildren[i].addEventListener("click", function(){
        location.href="../../shop/listHTML?categoryName=" + ccccChildren[i].getAttribute("data-miniCategory");
    })
}


const caNum = document.querySelector("#caNum");
const canumChildren = caNum.children;
for(let i=0; i<canumChildren.length; i++){
    canumChildren[i].addEventListener("click", function(){
    })
}
