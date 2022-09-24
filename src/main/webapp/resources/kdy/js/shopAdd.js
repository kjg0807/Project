const btn = document.querySelector("#btn");
const title = document.querySelector("#title");
const contents = document.querySelector("#contents");
const shopName = document.querySelector("#shopName");
const shopAddress = document.querySelector("#shopAddress");
const PriceAvg = document.querySelector("#priceAvg");
const delevery = document.querySelector("#delevery");
const shopPhone = document.querySelector("#shopPhone");
const shopNum = document.querySelector("#shopNum");
const clsoe = document.querySelector("#close");


btn.addEventListener("click", function(){
    console.log("가게정보 전송 ");
    let ti = title.value;
    let co = contents.value;
    let sh = shopName.value;
    let adr = shopAddress.value;
    let pa = priceAvg.value;
    let de = delevery.value;
    let sp = shopPhone.value;
    let si = shopNum.value;

    console.log(ti);
    console.log(co);
    console.log(sh);
    console.log(adr);
    console.log(pa);
    console.log(de);
    console.log(sp);
    console.log(si);


    // const xhttp = new XMLHttpRequest();

    // xhttp.open("POST", "/shop/add");

    // xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // xhttp.send("shopNum="+shopNum+"&title="+ti+"&contents="+co+"&shopName="+sh+"&shopAddress="+adr+"&priceAvg="+pa+"&delevery="+de+"&shopPhone"+sp);

    // xhttp.onreadystatechange=function(){
    //     if(this.readyState==4 && this.status==200){
    //         let result = xhttp.responseText.trim();

    //         if(result == 1){
    //             alert("등록 성공");
    //             document.querySelector("#close").click();
    //             window.location.reload();
    //         }else{
    //             alert("다시 시도하세요");
    //         }
    //     } 
    // }
})