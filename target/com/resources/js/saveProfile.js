function atrim(str){
    return str.replace(/\s/g,'');
}

function saveProfile() {
    var profileForm = document.getElementById("profile-form");
    var country = document.getElementById("selectedLocation");
    var address = document.getElementById("profile-address");
    var description = document.getElementById("profile-description");

    if (country.value === "location") {
        alert("나라를 선택해주세요.");return;
    }

    if (address.value === "") {
        alert("제목을 입력해주세요.");return;
    }

    if (address.value !== "" && atrim(address.value).length === 0) {
        alert("제목에 공백만 넣어 사용할 수 없습니다.");return;
    }

    if (description.value === "") {
        alert("자기 소개를 입력해주세요.");return;
    }

    if (description.value !== "" && atrim(description.value).length === 0) {
        alert("자기 소개에 공백만 넣어 사용할 수 없습니다.");return;
    }

    profileForm.submit();
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