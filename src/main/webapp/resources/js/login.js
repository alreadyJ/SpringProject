
function doLogin() {

    var loginfrm = document.getElementById("loginForm");
    var check_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var check_Num_Eng = /[0-9]|[a-z]|[A-Z]/;

    if (loginfrm.login_email.value.length !== atrim(loginfrm.login_email.value).length) {
        alert("Your email is incorrect!");
        return;
    } //공백이 포함된경우
    if (loginfrm.login_pass.value.length !== atrim(loginfrm.login_pass.value).length) {
        alert("Your password is incorrect!");
        return;
    }

    if (!loginfrm.login_email.value.match(check_email)) {
        alert("Your email is incorrect!");
        return;
    }
    if (!loginfrm.login_pass.value.match(check_Num_Eng)) {
        alert("Your password is incorrect!");
        return;
    }

    $.ajax({
        type: 'POST',
        data: {
            email: loginfrm.login_email.value,
            pass: loginfrm.login_pass.value
        },
        dataType: 'text',
        url: 'login',
        success: function (rData, textStatus, xhr) {
            var chkRst = rData;
            if (chkRst !== "1") alert("이메일 또는 비밀 번호를 확인해주세요.");
            else location.reload();
        },
        error: function (xhr, status, e) {
            alert(e);
        }
    });

}

function doLogOut() {
    $.ajax({
        type: 'GET',
        dataType: 'text',
        url: 'logout',
        success: function (rData, textStatus, xhr) {
            var chkRst = rData;
            if (chkRst === "1") location.reload();
            else alert("logout error!");
        },
        error: function (xhr, status, e) {
            alert(e);
        }
    });
}