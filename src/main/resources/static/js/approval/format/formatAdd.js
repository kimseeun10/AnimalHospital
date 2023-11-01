
let apFormatTitle = document.getElementById("apFormatTitle");			// 전자결재 양식 제목
let apFormatContents = document.getElementById("apFormatContents");		// 전자결재 양식 내용

let addFrm = document.getElementById("addFrm");				// 작성폼
let addBtn = document.getElementById("addBtn");				// 작성폼 제출 버튼
let cancleBtn = document.getElementById("cancleBtn");		// 작성 취소 버튼


// 글 ADD
addBtn.addEventListener("click", function(){

    if(apFormatTitle.value == ""){
        alert("제목을 입력해주세요.");
        apFormatTitle.focus();
        return;
    }
    if(apFormatContents.value == ""){
        alert("내용을 입력해주세요.");
        apFormatContents.focus();
        return;
    }
    
    // 폼에 입력한 데이터를 서버로 전송
    addFrm.submit();
    
});


// 취소 버튼
cancleBtn.addEventListener("click", function(){
	location.href = "/apFormat/list";
})