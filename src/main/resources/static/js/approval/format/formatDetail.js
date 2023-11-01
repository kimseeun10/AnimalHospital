let apFormatNo = document.getElementById("apFormatNo").value;			// 글번호

let apFormatTitle = document.getElementById("apFormatTitle");			// 전자결재 양식 제목
let apFormatContents = document.getElementById("apFormatContents");		// 전자결재 양식 내용

let frm = document.getElementById("frm");								// 삭제/수정 결정하는 폼

let updateBtn = document.getElementById("updateBtn");					// 수정 버튼
let deleteBtn = document.getElementById("deleteBtn");					// 삭제 버튼
let listBtn = document.getElementById("listBtn");						// 목록 버튼

let submitBtn = document.getElementsByClassName("submitBtn");			// 수정/삭제 버튼



// 수정버튼
updateBtn.addEventListener("click", function(){
	location.href = "/apFormat/update?apFormatNo="+apFormatNo;
})

// 삭제버튼
deleteBtn.addEventListener("click", function(){

    let result = confirm("정말로 삭제하시겠습니까?");

    if(result) {
	    frm.method = "post";
	    frm.action = "delete";		
	    frm.submit();
	}
})


// 목록버튼
listBtn.addEventListener("click", function(){
	location.href = "/apFormat/list";
})