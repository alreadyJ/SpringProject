/**
 * Created by root on 16. 11. 28.
 */

function atrim(str){
    return str.replace(/\s/g,'');
}
function blankcheck(el,msg){
    if(el.value === ""){
        alert(msg+"를(을) 입력해주세요.");
        el.focus();
        return true;
    }
    if(el.value.length !== atrim(el.value).length){
        alert(msg+"에는 공백을 허용하지 않습니다.");
        el.focus();
        return true;
    }
}
function goHome() {
    location.href = "/";
}
function doSubmit() {
    var joinfrm = document.getElementById("signUpForm");
    console.log("doSubmit");

    if (joinfrm.email_ch.value === "false") {
        alert("check the email!");
        return;
    }

    if (joinfrm.email_dup.value === "false") {
        alert("check duplicated email!");
        return;
    }

    if (joinfrm.pass.value === "false") {
        alert("check the password!");
        return;
    }

    if(blankcheck(joinfrm.m_pass,'password')) {
        return;
    }

    if (joinfrm.pass_ch.value === "false") {
        alert("wrong confirm password!");
        return;
    }

    if(blankcheck(joinfrm.m_pass_ch,'password')) return;

    if(blankcheck(joinfrm.m_name,'nickname')) return;


    if (joinfrm.m_email.value.length !== atrim(joinfrm.m_email.value).length){
        return;
    } //공백이 포함된경우
    if (joinfrm.m_pass.value.length !== atrim(joinfrm.m_pass.value).length){
        return;
    } //공백이 포함된경우
    if (joinfrm.m_name.value.length !== atrim(joinfrm.m_name.value).length){
        return;
    } //공백이 포함된경우

    $.ajax({
        type : 'POST',
        data : {m_email: joinfrm.m_email.value,
            m_pass: joinfrm.m_pass.value,
            m_name: joinfrm.m_name.value},
        dataType : 'text',
        url : 'signUp',
        success : function(rData, textStatus, xhr) {
            var chkRst = rData;
            if(chkRst === "1") alert("가입 성공!");
            else alert("가입 실패!");
            location.reload();
        },
        error : function(xhr, status, e) {
            alert(e);
        }
    });
}

function checkDuplicate() {
    var joinfrm = document.getElementById("signUpForm");
    var check_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if (!joinfrm.m_email.value.match(check_email)){
        $("#email_notice").css("display","inline-block");
        joinfrm.m_email.focus();
        return;
    }

    if (joinfrm.m_email.value.length !== atrim(joinfrm.m_email.value).length){
        alert("Your email contains spaces");
        return;
    }

    $("#email_notice").css("display","none");
    console.log(joinfrm.m_email.value);
    $.ajax({
        type : 'POST',
        data:"email="+ joinfrm.m_email.value,
        dataType : 'text',
        url : 'checkDuplicate',
        success : function(rData, textStatus, xhr) {
            var chkRst = rData;
            if(chkRst === "0"){
                alert("You can register.");

                $("#email_dup").val('true');
                joinfrm.m_email.disabled = true;
                $("#dup-btn").css("display", "none");
                $("#mod-btn").css("display", "inline-block");
            }else{
                alert("Duplicate!");
                $("#email_dup").val('false');
            }
        },
        error : function(xhr, status, e) {
            alert(e);
        }
    });
}
function modifyEmail() {
    var joinfrm = document.getElementById("signUpForm");
    $("#email_dup").val('true');
    joinfrm.m_email.disabled = false;
    $("#dup-btn").css("display", "inline-block");
    $("#mod-btn").css("display", "none");
}

$(document).ready(function() {
    var check_Eng= /[a-z]|[A-Z]/;
    var check_Num= /[0-9]/;
    var check_Num_Eng= /[0-9]|[a-z]|[A-Z]/;
    var check_kor = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
    var check_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var joinfrm = document.getElementById("signUpForm");

    // $("#m_id").change(function(){
    //     joinfrm.id_ch.value = false; //id_ch 히든값 초기화 후 검사 시작
    //     console.log('1. '+joinfrm.id_ch.value);
    //     // alert('id값 변경');
    //     var id = joinfrm.m_id.value;
    //     var id_flag = false;
    //     if(id.match(check_Num_Eng) === null || id.match(check_Eng) === null){
    //         /*if(!check_kor.test(id)){*/
    //         $("#info_id1").css("color","red");
    //         // alert('영문 또는 영문,숫자 조합을 사용하여야 합니다.');
    //         id_flag = true;
    //     }else{$("#info_id1").css("color","blue");}
    //
    //     if(id.length<5 || id.length >13){
    //         $("#info_id2").css("color","red");
    //         id_flag = true;
    //     }else{$("#info_id2").css("color","blue");}
    //     if(id_flag){
    //         joinfrm.m_id.focus();
    //         return;
    //     }
    //     joinfrm.id_ch.value = true;
    //     console.log('2. '+joinfrm.id_ch.value);
    // });

    $("#m_pass").change(function(){
        joinfrm.pass_ch.value = false;
        joinfrm.pass.value = false;
        joinfrm.m_pass_ch.value = ""; //비밀번호 변경시 비밀번호 확인 칸 초기화
        var pass = joinfrm.m_pass.value;
        // alert("포커스 아웃  " + pass);
        if(!pass.match(check_Num_Eng) || pass.length < 8){
            $("#info_pass1").css("display","inline-block");
            joinfrm.pass.value = false;
            joinfrm.m_pass.focus();
            return;
        }
        if (joinfrm.m_pass.value.length !== atrim(joinfrm.m_pass.value).length){
            alert("Your password contains spaces!");
            return;
        }
        $("#info_pass1").css("display","none");
        joinfrm.pass.value = true;
        console.log(pass);

    });

    $("#m_pass_ch").change(function() {

        joinfrm.pass_ch.value = false;
        if(joinfrm.m_pass_ch.value !== joinfrm.m_pass.value){
            $("#pass_ch_notice").css("display","inline-block");
            joinfrm.m_pass_ch.focus();
            return;
        }
        $("#pass_ch_notice").css("display","none");
        joinfrm.pass_ch.value = true;
    });

    $("#m_email").change(function(){
        joinfrm.email_ch.value = false;
        if(!joinfrm.m_email.value.match(check_email)){
            $("#email_notice").css("display","inline-block");
            joinfrm.m_email.focus();
            return;
        }

        if (joinfrm.m_email.value.length !== atrim(joinfrm.m_email.value).length){
            alert("Your email contains spaces!");
            return;
        }


        $("#email_notice").css("display","none");
        joinfrm.email_ch.value = true;
    });
    $("#m_name").change(function () {
        joinfrm.m_name_ch.value = false;
        if (joinfrm.m_name.value.length !== atrim(joinfrm.m_name.value).length){
            $("#name_notice").css("display", "inline-block");
            joinfrm.m_name.focus();
            return;
        }
        $("#name_notice").css("display", "none");
        joinfrm.m_name_ch.value = true;
    });
});