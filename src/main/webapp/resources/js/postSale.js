var Upload = function (file) {
    this.file = file;
};

Upload.prototype.getType = function() {
    return this.file.type;
};
Upload.prototype.getSize = function() {
    return this.file.size;
};
Upload.prototype.getName = function() {
    return this.file.name;
};
Upload.prototype.doUpload = function () {
    var that = this;
    var formData = new FormData();

    // add assoc key values, this will be posts values
    formData.append("file", this.file, this.getName());
    formData.append("upload_file", true);

    $.ajax({
        type: "POST",
        url: "/upload",
        success: function (data) {
            // your callback here
        },
        error: function (error) {
            alert("이미지 업로드 실패!");
        },
        async: true,
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        timeout: 60000
    });
};



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
    if (imageFile1 === "1")imageUpload("sale-file1");
    if (imageFile2 === "1")imageUpload("sale-file2");
    if (imageFile3 === "1")imageUpload("sale-file3");

    saleForm.submit();
}





function imageUpload(image) {
    var imageFile = document.getElementById("image").files[0];
    var upload = new Upload(imageFile);
    upload.doUpload();
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
