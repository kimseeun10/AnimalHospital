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
	<meta charset="UTF-8">
	<title>지출내역서 작성</title>

</head>

<body>
	<!-- Layout wrapper -->
	<sec:authentication property="Principal" var="user"/>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
			
			
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">				
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
					
						<div class="row">
				    		<form action="expenseAdd" id="addFrm" method="post">
				    		
				    			<div class="mb-3">
								  <label for="username" class="form-label"></label>
								  <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
								</div>
				    						    			
				    			<div class="mb-3">
								  <label for="positionName" class="form-label">부서</label>
								  <input type="text" class="form-control" id="positionName" name="positionName" value="${user.positionName}" readonly>
								</div>
								
				    			<div class="mb-3">
								  <label for="deptName" class="form-label">직급</label>
								  <input type="text" class="form-control" id="deptName" name="deptName" value="${user.deptName}" readonly>
								</div>
								
				    			<div class="mb-3">
								  <label for="empName" class="form-label">성명</label>
								  <input type="text" class="form-control" id="empName" name="empName" value="${user.empName}" readonly>
								</div>
								
				    			<div class="mb-3">
								  <label for="apCDate" class="form-label">기안일자</label>
								  <input type="text" class="form-control" id="apCDate" name="apCDate" value="${date}" readonly>
								</div>
				    			
				    			<div class="mb-3">
								  <label for="apTitle" class="form-label">제목</label>
								  <input type="text" class="form-control" id="apTitle" name="apTitle" placeholder="제목을 입력하세요">
								</div>

			
			                    <div class="mb-1" style="margin:0 auto; width:fit-content;">
			                        <button type="button" class="btn btn-primary" id="expensePlusBtn">내역 추가</button>
			                    </div>
			        
			                    <!-- 지출결의서 폼이 추가되는 곳 -->
			                    <div id="expenseList" class="my-5">
									<div class="row g-3 mb-2" id="expense1">
									  <div class="col-4">
									    <input type="text" class="form-control" id="expenseName" name="expenseName" placeholder="항목">
									  </div>
									  <div class="col-2">
									    <input type="text" class="form-control" id="expenseAmount" name="expenseAmount" placeholder="수량">
									  </div>
									  <div class="col-2">
									    <input type="text" class="form-control" id="expensePrice" name="expensePrice" placeholder="금액">
									  </div>
									  <div class="col-3">
									    <input type="text" class="form-control" id="expenseBigo" name="expenseBigo" placeholder="비고">
									  </div>
									  <div class="col-1">
									  	<button type="button" id="expenseMinusBtn" name="expenseMinusBtn" class="btn btn-primary df align-bottom"> X </button>
									  </div>
									</div>
			        
			                    </div>
								
					    		<div class="row">
									<div class="demo-inline-spacing">
										<button type="button" class="btn btn-primary" id="addBtn">작성</button>
										<button type="button" class="btn btn-primary" id="cancleBtn">취소</button>
									</div>
	                            </div>
								
				    		</form>
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
	
	<!-- language pack -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	
	<script>
	$('#apContents').summernote({
	  tabsize: 2,
	  height: 300,
	  codemirror: { // codemirror options
		    theme: 'monokai'
		  },
	  lang: 'ko-KR', // default: 'en-US'
	});
	
	$("#apContents").summernote('code'); 
	</script>
	
	<script src="/js/approval/apExpenseAdd.js"></script>
</body>
</html>