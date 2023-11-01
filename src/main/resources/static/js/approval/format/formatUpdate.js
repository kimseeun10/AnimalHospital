let apFormatNo = document.getElementById("apFormatNo").value;			// 글번호


let apFormatTitle = document.getElementById("apFormatTitle");			// 전자결재 양식 제목
let apFormatContents = document.getElementById("apFormatContents");		// 전자결재 양식 내용

let updateFrm = document.getElementById("updateFrm");					// 수정폼

let updateBtn = document.getElementById("updateBtn");					// 수정 버튼
let cancleBtn = document.getElementById("cancleBtn");					// 목록 버튼

/*let markupStr = apFormatContents.summernote('code');*/

updateBtn.addEventListener("click", function(){
	
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
    
	
    updateFrm.submit();
    
});



cancleBtn.addEventListener("click", function(){
	apFormatNo = apFormatNo * 1;
	location.href = "./detail?apFormatNo=" + apFormatNo;
})

