function deleteAll(userId){
    let checkArr = [];
    $('.list-checkBox:checked').each(function(i){
        checkArr.push($(this).val());
    })
    $.ajax({
        url : 'deleteRsvList.do',
        type : 'post',
        traditional : true, // 배열 전송 시, 입력
        data : { 
            "rsvNum" : checkArr,
            "userId" : userId
        },
        success : function(data){
            console.log(checkArr);
            if(data == "success"){
                alert("예약 내역을 일괄 삭제하였습니다.");
                location.href = "bookingList.do?userId=" + userId;
            }else{
                console.log("실패");
                alert("일괄 삭제 실패");
            }
        }
    });
}
