function atrim(str){
    return str.replace(/\s/g,'');
}

function postTrip() {
    var tripForm = document.getElementById("trip-form");
    var location1 = document.getElementById("selectedLocation");
    var location2 = document.getElementById("selectedLocation2");
    var departureDate = document.getElementById("date-picker-example");
    var ArrivalDate = document.getElementById("date-picker-example2");
    var detail = document.getElementById("trip-detail");

    if (detail.value === "") {
        alert("상세 내용을 입력해주세요.");return;
    }

    if (detail.value !== "" && atrim(detail.value).length === 0) {
        alert("상세 내용에 공백만 넣어 사용할 수 없습니다.");return;
    }

    if (location1.value === "location") {
        alert("출발 위치를 선택해주세요.");return;
    }
    if (location2.value === "location") {
        alert("도착 위치를 선택해주세요.");return;
    }

    if (departureDate.value === "") {
        alert("출발 날짜를 선택해주세요.");return;
    }
    if (ArrivalDate.value === "") {
        alert("출발 날짜를 선택해주세요.");return;
    }
    tripForm.submit();
}

