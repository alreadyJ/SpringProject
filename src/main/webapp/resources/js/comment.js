function blankCheck(el, msg){
    if(el.value === ""){
        alert(msg+"를(을) 입력해주세요.");
        el.focus();
        return true;
    }
    return false;
}

function doComment() {
    var commentUserSerial = document.getElementById("comment-user-serial");
    var commentItemSerial = document.getElementById("comment-item-serial");
    var commentType = document.getElementById("comment-type");
    var commentText = document.getElementById("comment-text");
    var commentUserNickName = document.getElementById("comment-user-nickName");
    if (blankCheck(commentText, "댓글")) return;

    $.ajax({
        type : 'POST',
        data : {userSerial: commentUserSerial.value,
            itemSerial: commentItemSerial.value,
            type: commentType.value,
            text: commentText.value},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : 'text',
        url : '/comment',
        success : function(rData, textStatus, xhr) {
            addComment(commentText.value, commentUserNickName.value);
            commentText.value = "";
        },
        error : function(xhr, status, e) {
            alert(e + ", " + xhr + ", " + status);
            commentText.value = "";
        }
    });

}

function addComment(text, user) {
    var commentContainer = document.getElementById("comment-container");
    var frameWork = document.getElementById("comment-framework");
    var clonedFrameWork = frameWork.cloneNode(true);

    clonedFrameWork.id = "";
    clonedFrameWork.lastElementChild.firstElementChild.firstElementChild.innerText = user;
    //clonedFrameWork.lastChild.firstChild.nextSibling.nextSibling.firstChild.firstChild
    clonedFrameWork.lastElementChild.lastElementChild.innerText = text;
    clonedFrameWork.style.display = "flex";
    commentContainer.appendChild(clonedFrameWork);
}


function modifyComment() {

}