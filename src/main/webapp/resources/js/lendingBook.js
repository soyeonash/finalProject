/* 주소 api 우편번호 검색 팝업 */
$(function() { $("#postcodify_search_button").postcodifyPopUp(); });

/* 택배 대출 시, 주소 입력 tr 보이기 */
function setDisplay(){
    if($('input:radio[id=bookReceive]').is(':checked')){
        $('#book-parcel').show();
        $('#book-inperson').hide();
    }else{
        $('#book-inperson').show();
        $('#book-parcel').hide();
    }
}
