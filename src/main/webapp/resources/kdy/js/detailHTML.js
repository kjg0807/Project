const shop = document.querySelector("#shopNum");
const menu = document.querySelector("#menuNum");
const md = document.querySelector("#deleteMenu");

const btn = document.querySelector("#num");

btn.addEventListener("click", function(){
console.log(shop.vlaue);
console.log(menu.vlaue);
});


const m = document.querySelector("#menuDelete");

m.addEventListener("click", function(){
        alert("대표메뉴 한가지를 삭제합니다");
        md.click();
})

// //지도 설정
// const mapContainer = document.getElementById('map'),
// 	mapOption = { 
// 	    center: new kakao.maps.LatLng(36.5,127.5),	
// 	    level: 13					
// 	};
    
// //설정한 지도 생성
// const map = new kakao.maps.Map(mapContainer, mapOption);

// const marker = new kakao.maps.Marker();


// kakao.maps.event.addListener(map, 'click', (mouseEvent) => {

// 	const latlng = mouseEvent.latLng;

// 	marker.setPosition(latlng);
// 	marker.setMap(map);
	
// 	alert(`위도 : ${latlng.getLat()}, 경도 : ${latlng.getLng()}`);
// });