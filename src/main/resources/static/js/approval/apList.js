let username = document.getElementById("username").value;				// 사번

let search = document.getElementById("search");		// 전자결재 양식 내용

let searchfrm = document.getElementById("searchfrm");				// 작성폼
let searchBtn = document.getElementById("searchBtn");				// 작성폼 제출 버튼


// 글 ADD
searchBtn.addEventListener("click", function(){


    if(search.value == ""){
        alert("검색어를 입력해주세요.");
        apContents.focus();
        return;
    }
    
    // 폼에 입력한 데이터를 서버로 전송
    searchfrm.submit();
    
});

