const cccc = document.querySelector("#cccc");
const ccccChildren = cccc.children;
for(let i =0; i < ccccChildren.length; i++){
    ccccChildren[i].addEventListener("click", function(){
        location.href="../../shop/listHTML?categoryName=" + ccccChildren[i].getAttribute("data-miniCategory");
    })
}

const add = document.querySelector("#add");
add.addEventListener("click", function(){
   alert("글");

})

const detailHTMLList = document.querySelectorAll(".detailHTMLList");
detailHTMLList.forEach(function( dh, index){
    console.log(dh);
    dh.addEventListener("click", function(){
        alert("로그인이 필요한 서비스입니다");
    })
})

const sn = document.querySelector("#searchNull");
const s = document.querySelector("#search");

sn.addEventListener("click", function(){
    let ss = s.value;
    console.log(ss);
    if(ss <= 0){
        alert("검색어를 입력해주세요");
        return;
    }
})

function listAddCheck(){
const caNum = document.querySelector("#caNum");
const canumChildren = caNum.children;
    for(let i=0; i<canumChildren.length; i++){
        canumChildren[i].addEventListener("click", function(){
        })
    }
    const listAddForm = document.querySelector("#listAddForm");
    const listAddButton = document.querySelector("#listAddButton");

    const shopPhone = document.getElementById("shopPhone");
    const shopName = document.querySelector("#shopName");
    const shopAddress = document.querySelector("#shopAddress");
    const priceAvg = document.querySelector("#priceAvg");
    const delivery = document.querySelector("#delivery");
    // const shopContents = document.querySelector("#shopContents");
    const shopTitle = document.querySelector("#shopTitle");

    const inputShopPhoneResult = document.getElementById("inputShopPhoneResult");
    const inputShopNameResult = document.getElementById("inputShopNameResult");
    const inputShopAddressResult = document.getElementById("inputShopAddressResult");
    const inputPriceAvgResult = document.getElementById("inputPriceAvgResult");
    const inputDeliveryResult = document.getElementById("inputDeliveryResult");
    // const inputShopContentsResult = document.getElementById("inputShopContentsResult");
    const inputShopTitleResult = document.getAnimations("inputShopTitleResult");

    let shopPhoneCheck = false;
    let shopNameCheck = false;
    let shopAddressCheck = false;
    let priceAvgCheck = false;

    let shopContentsCheck = false;
    let shopTitleCheck = false;

    shopPhone.addEventListener("blur", function(){
        if(shopPhone.value.length>1){
            inputShopPhoneResult.innerHTML="";
            shopPhoneCheck = true;
        }else{
            inputShopPhoneResult.innerHTML="!!필수!!식당의 전화번호를 입력해주셔야 합니다.";
            shopPhoneCheck = false;
        }
    })
    shopName.addEventListener("blur", function(){
        if(shopName.value.length>1){
            inputShopNameResult.innerHTML="";
            shopNameCheck = true;
        }else{
            inputShopNameResult.innerHTML="!!필수!!식당의 상호명을 입력해주셔야 합니다.";
            shopNameCheck = false;
        }
    })
    shopAddress.addEventListener("blur", function(){
        if(shopAddress.value.length>1){
            inputShopAddressResult.innerHTML="";
            shopAddressCheck = true;
        }else{
            inputShopAddressResult.innerHTML="!!필수!!식당의 주소를 입력해주셔야 합니다.";
            shopAddressCheck = false;
        }
    })
    priceAvg.addEventListener("blur", function(){
        if(priceAvg.value.length>1){
            inputPriceAvgResult.innerHTML="";
            priceAvgCheck = true;
        }else{
            inputPriceAvgResult.innerHTML="!!필수!!식당의 가격대를 입력해주셔야 합니다";
            priceAvgCheck = false;
        }
    })
    // shopContents.addEventListener("blur", function(){
    //     if(shopContents.value.length>1){
    //         inputShopContentsResult.innerHTML="";
    //         shopContentsCheck = true;
    //     }else{
    //         inputShopContentsResult = "!!필수!!식당에 대해 소개해주세요.";
    //         shopContentsCheck = false;
    //     }
    // })
    shopTitle.addEventListener("blur", function(){
        if(shopTitle.value.length>1){
            inputShopTitleResult.innerHTML="";
            shopTitleCheck = true;
        }else{
            inputShopTitleResult="!!필수!!식당 게시글에 보일 제목을 입력해주셔야 합니다.";
            shopTitleCheck = false;
        }
    })

    listAddButton.addEventListener("click", function(){
        console.log(shopPhoneCheck);
        console.log(shopNameCheck);
        console.log(shopAddressCheck);
        console.log(priceAvgCheck);
        // console.log(shopContentsCheck);
        console.log(shopTitleCheck);
        if(shopPhoneCheck&&shopNameCheck&&shopAddressCheck&&priceAvgCheck&&shopTitleCheck){
            alert("축하합니다 게시글이 등록되었습니다 ")
            listAddForm.submit();
            listAddButton.submit();

        }else{
            alert("필수 입력사항을 확인해보세요!!")
        }
    })
}