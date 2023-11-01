let username = document.getElementById("username").value;				// 사번

let apTitle = document.getElementById("apTitle");			// 전자결재 양식 제목
let apContents = document.getElementById("apContents");		// 전자결재 양식 내용

let addFrm = document.getElementById("addFrm");				// 작성폼
let addBtn = document.getElementById("addBtn");				// 작성폼 제출 버튼
let cancleBtn = document.getElementById("cancleBtn");		// 작성 취소 버튼


const expenseList = document.getElementById("expenseList");
const expensePlusBtn = document.getElementById("expensePlusBtn");
const expenseMinusBtn = document.getElementById("expenseMinusBtn");
// const df = document.getElementsByClassName("df"); 
const deletes = document.getElementsByClassName("deletes");

let max = 9;
let count = 0;

if(deletes != null) {
    count = deletes.length;
}
let idx = 2;


// expenseList에 항목 입력 폼 추가하기
$("#expensePlusBtn").click(function(){

    if(count>=max){
        alert("지출 항목은 최대 10개까지 추가할 수 있습니다.");
        return;
    }
    count++;    


  	let f = '<div class="row g-3 mb-2" id="expense'+idx+'">';
    
    f = f + '<div class="col-4">';
    f = f + '<input type="text" class="form-control" id="expenseName" name="expenseName" placeholder="항목">';
    f = f + '</div>';
    
    f = f + '<div class="col-2">';
    f = f + '<input type="text" class="form-control" id="expenseAmount" name="expenseAmount" placeholder="수량">';
    f = f + '</div>';
    
    f = f + '<div class="col-2">';
    f = f + '<input type="text" class="form-control" id="expensePrice" name="expensePrice" placeholder="금액">';
    f = f + '</div>';
    
    f = f + '<div class="col-3">';
    f = f + '<input type="text" class="form-control" id="expenseBigo" name="expenseBigo" placeholder="비고">';
    f = f + '</div>';
    
    f = f + '<div class="col-1">';
    f = f + '<button type="button" id="expenseMinusBtn" name="expenseMinusBtn" class="btn btn-primary df align-bottom"> X </button>';
    f = f + '</div>';
    
    idx++;

    $("#expenseList").append(f);

})


// expenseList에 항목 입력 폼 추가한거 지우기
$("#expenseList").on("click", ".df", function(){
    $("#expense").parent().remove();
    count--;
})




// 글 ADD
addBtn.addEventListener("click", function(){

    if(apTitle.value == ""){
        alert("제목을 입력해주세요.");
        apTitle.focus();
        return;
    }
    if(apContents.value == ""){
        alert("내용을 입력해주세요.");
        apContents.focus();
        return;
    }
    

    // 폼에 입력한 데이터를 서버로 전송
    addFrm.submit();
    
});


// 취소 버튼
cancleBtn.addEventListener("click", function(){
	/*location.href = "/approval/draftList/" + username;*/
	location.href = "/approval/formatList";
})