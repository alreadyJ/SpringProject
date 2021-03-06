function atrim(str){
    return str.replace(/\s/g,'');
}

function postSale() {
    var saleForm = document.getElementById("sale-form");
    var category = document.getElementById("category-selector");
    var title = document.getElementById("sale-title");
    var detail = document.getElementById("sale-detail");
    var imageFile1 = document.getElementById("image-file1");
    var imageFile2 = document.getElementById("image-file2");
    var imageFile3 = document.getElementById("image-file3");
    var location = document.getElementById("selectedLocation");
    var date = document.getElementById("date-picker-example");
    var quantity = document.getElementById("sale-quantity");
    var maxPurchase = document.getElementById("sale-max-purchase");
    var price = document.getElementById("sale-price");



    if (category.value === "") {
        alert("카테고리를 선택해주세요.");return;
    }

    if (title.value === "") {
        alert("제목을 입력해주세요.");return;
    }

    if (title.value !== "" && atrim(title.value).length === 0) {
        alert("제목에 공백만 넣어 사용할 수 없습니다.");return;
    }

    if (detail.value === "") {
        alert("상세 내용을 입력해주세요.");return;
    }

    if (detail.value !== "" && atrim(detail.value).length === 0) {
        alert("상세 내용에 공백만 넣어 사용할 수 없습니다.");return;
    }

    if (imageFile1 === "0" && imageFile2 === "0" && imageFile3 === "0") {
        alert("이미지 파일이 적어도 하나 이상은 있어야합니다.");return;
    }

    if (location.value === "location") {
        alert("위치를 선택해주세요.");return;
    }

    if (date.value === "") {
        alert("만료 날짜를 선택해주세요.");return;
    }

    if (quantity.value < maxPurchase.value) {
        alert("최대 구입 수량이 판매 수량보다 클 수 없습니다.");return;
    }
    if (price.value === "") {
        alert("가격을 입력해주세요.");return;
    }

    saleForm.submit();
}


function previewFile(img, inf, hidden){
    var preview = document.getElementById(img);
    var file    = document.getElementById(inf).files[0]; //sames as here
    var flag    = document.getElementById(hidden);
    var reader  = new FileReader();

    if (file.size > 8388608) {
        document.getElementById(inf).value = "";
        alert("최대 파일 크기는 8MB 입니다.");
        return;
    }

    reader.onloadend = function () {
        preview.src = reader.result;
    };

    if (file) {
        reader.readAsDataURL(file); //reads the data as a URL
        flag.value = "1";
    }

}
