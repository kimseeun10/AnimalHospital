<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>

<!-- include summernote -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">	  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include summernote css/js-->
<link href="summernote.css">
<script src="summernote.js"></script>

<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">	
					<sec:authentication property="Principal" var="user"/>
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="card shadow mb-4" style="align-items: center;">
							<div style="width:75%; margin-bottom: 30px; margin-top: 30px;">
								<form action="noticeUpdate" method="post" enctype="multipart/form-data">
									<input type="hidden" name="noticeNo" value="${vo.noticeNo}">
									  <div class="mb-3">
									  	<input type="radio" name="important" id="important" value="중요"><span>중요</span>
									  	<input type="radio" name="important" id="important" value="일반" checked="checked"><span>일반</span>
									  </div>
			        				  <div class="mb-3">
									    <label for="title" class="form-label" style="font-size: 15px;">Title</label>
									    <input type="text" class="form-control" name="title" id="title" value="${vo.title}">
									  </div>
			        				  <div class="mb-3">
									    <label for="username" class="form-label" style="font-size: 15px;">Writer</label>
									    <input type="hidden" class="form-control" name="username" id="username" value="${user.username}">
									    <input type="text" class="form-control" id="empName" value="${vo.empName}" readonly="readonly">
									  </div>
									 <div class="mb-3">
									    <label for="contents" class="form-label" style="font-size: 15px;">Contents</label>
									    <textarea class="form-control" name="contents" id="contents" style="height: 200px;">${vo.contents}</textarea>
									  </div>

									<div id="fileList" class="my-5">
										<c:forEach items="${vo.fileVO}" var="f">
											       <div class="file-item mb-2">
											           <span class="alert alert-primary me-2" role="alert" id="${f.originalFileName}">
											             첨부파일: ${f.originalName}
											           </span>
											      <button class="delets x2 btn btn-outline-primary" type="button" data-file="${f.fileName}" data-num="${f.fileNo}">삭제</button>
											  </div>
										</c:forEach>
									</div>
									<label for="contents" class="form-label" style="font-size: 15px;">Files</label>

									  <div class="mb-3">
									    <input type="file" class="form-control" name="files">
									  </div>
									  <div class="mb-3">
									    <input type="file" class="form-control" name="files">
									  </div>									  
									  <button id="updateBtn" class="btn btn-primary">작성완료</button>
		        				</form>
	        				</div>
						</div>
					</div>
					<!-- / Content -->
					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
	<!-- summernote -->

	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
	
	<!-- language pack -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	
<script type="text/javascript">
const fileList = document.getElementById("fileList");
const fileAdd = document.getElementById("fileAdd");
const deletes = document.getElementsByClassName("deletes");

$('#fileList').on("click",'.x2',function(){
	if(confirm("삭제시 복원이 불가능 합니다.")){
    	let num = $(this).attr("data-num");
    	let name = $(this).attr("data-file");
    	
		fileDelete(num, name);
		
		$(this).parent().remove();
    	count --;
    	
	}
})

 function fileDelete(fileNo, fileName){
	$.ajax({
		type:"get",
		url:"./fileDelete?fileNo="+fileNo,
		data:{
			"fileNo":fileNo,
			"fileName":fileName
		},
		success:function(response){
			r=response.trim();
			console.log(r);
			if(r>0){
				alert("삭제되었습니다.");
			}else{
				alert("삭제 실패");
			}
			
		},
		error:function(){
			console.log("ajax 실패");
			console.log(data);
		}
	}) 
}

</script>
	<script>
	$('#contents').summernote({
	  tabsize: 2,
	  height: 300,
	  codemirror: { // codemirror options
		    theme: 'monokai'
		  },
	  lang: 'ko-KR', // default: 'en-US'
	});
	
	$("#contents").summernote('code'); 
	</script>
	
		<script type="text/javascript">
		$("#updateBtn").on("click", function(){
			let title = $("#title").val();
			let contents = $("#contents").val();
			
			if(title == ""){
				event.preventDefault();
				alert("제목을 입력해주세요.")
				title.focus();
			}
			
			if(contents == ""){
				event.preventDefault();
				alert("내용을 입력해주세요.")
				contents.focus();
			}
			
			alert("수정완료되었습니다.")
		})
	</script>
	
</body>
</html>