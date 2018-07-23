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
        async: false,
        success : function(rData, textStatus, xhr) {
            addComment(commentText.value, commentUserNickName.value, rData);
            commentText.value = "";
        },
        error : function(xhr, status, e) {
            alert(e + ", " + xhr + ", " + status);
            commentText.value = "";
        }
    });

}

Date.prototype.yyyymmdd = function() {
    var mm = this.getMonth() + 1; // getMonth() is zero-based
    var dd = this.getDate();

    return [this.getFullYear(),
        (mm>9 ? '' : '0') + mm,
        (dd>9 ? '' : '0') + dd
    ].join('-');
};


function addComment(text, user, serial) {
    var commentContainer = document.getElementById("comment-container");
    var frameWork = document.getElementById("comment-framework");
    var clonedFrameWork = frameWork.cloneNode(true);
    var date = new Date();
    clonedFrameWork.id = "";
    clonedFrameWork.lastElementChild.firstElementChild.firstElementChild.innerText = user;
    clonedFrameWork.lastElementChild.firstElementChild.firstElementChild.nextElementSibling.value = serial;
    clonedFrameWork.lastElementChild.lastElementChild.previousElementSibling.firstElementChild.firstElementChild.innerHTML = "<i class=\"fa fa-clock-o\"></i> " + date.yyyymmdd();
    clonedFrameWork.lastElementChild.lastElementChild.innerText = text;
    clonedFrameWork.style.display = "flex";
    commentContainer.appendChild(clonedFrameWork);
}





function deleteComment(obj) {
    if (confirm("댓글을 삭제하시겠습니까?")) {
        var commentArea = obj.parentNode.parentNode.parentNode;
        var commentUserSerial = commentArea.lastElementChild.firstElementChild.lastElementChild;
        var commentSerial = commentArea.lastElementChild.firstElementChild.firstElementChild.nextElementSibling;
        var commentItemSerial = document.getElementById("comment-item-serial");
        var commentType = document.getElementById("comment-type");

        $.ajax({
            type : 'POST',
            data : {userSerial: commentUserSerial.value,
                itemSerial: commentItemSerial.value,
                type: commentType.value,
                commentSerial: commentSerial.value},
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType : 'text',
            url : '/deleteComment',
            success : function(rData, textStatus, xhr) {
                commentArea.parentNode.removeChild(commentArea);
            },
            error : function(xhr, status, e) {
                alert(e + ", " + xhr + ", " + status);
            }
        });
    }
}


function getIndexOfChildNode(obj) {
    var parent = obj.parentNode;
    var children = parent.children;
    var i = children.length - 1;
    for (;i >= 0; i--) {
        if (children[i] === obj) break;
    }
    return i;
}

function mouseOver(obj) {
    obj.class = "fa fa-pencil blue-text";
}

function mouseOut(obj) {
    obj.class = "fa fa-pencil black-text";
}