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

function listAddCheck(){
    const listAddForm = document.querySelector("#listAddForm");
    const listAddButton = document.querySelector("#listAddButton");

    const shopName = document.querySelector("#shpName");
    const shopAddress = document.querySelector("#shopAddress");
    const priceAvg = document.querySelector("#priceAvg");
    const delivery = document.querySelector("#delivery");
    const contents = document.querySelector("#contents");
    const title = document.querySelector("#title");
}
