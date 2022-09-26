const btn = document.querySelector("#btn");
const shopNum = document.querySelector("#shopNum");
const categoryNum = document.querySelector("#categoryNum");
const title = document.querySelector("#title");
const contents = document.querySelector("#contents");
const shopName = document.querySelector("#shopName");
const shopAddress = document.querySelector("#shopAddress");
const priceAvg = document.querySelector("#priceAvg");
const delivery = document.querySelector("#delivery");
const shopPhone = document.querySelector("#shopPhone");
const close = document.querySelector("#close");



btn.addEventListener("click", function(){
    console.log("가게정보 전송 ");
    let si = shopNum.value;
    let cat = categoryNum.value;
    let sp = shopPhone.value;
    let sh = shopName.value;
    let adr = shopAddress.value;
    let pa = priceAvg.value;
    let de = delivery.value;
    let co = contents.value;
    let ti = title.value;
    const files = document.querySelector("#files");
    let file = files.value;

    console.log(si);
    console.log(cat);
    console.log(sp);
    console.log(sh);
    console.log(adr);
    console.log(pa);
    console.log(de);
    console.log(co);
    console.log(ti);
    console.log(file);


    const xhttp = new XMLHttpRequest();

    xhttp.open("POST", "/shop/add");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send("shopNum="+si+"&categoryNum="+cat+"&shopPhone="+sp+"&shopName="+sh+"&shopAddress="+adr+"&priceAvg="+pa+"&delivery="+de+"&contents="+co+"&title="+ti+"&files="+file);
    // +"&files="+file

    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200){
            let result = xhttp.responseText.trim();

            if(result == 1){
                alert("등록 성공");
                document.querySelector("#close").click();
                window.location.reload();
            }else{
                alert("다시 시도하세요");
            }
        } 
    }
})