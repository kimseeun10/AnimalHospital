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

	<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
	<meta charset="UTF-8">
	<title>지출내역서 작성</title>
	
	<style>
	    .hidden {
	      display: none;
	    }
    </style>

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
	                    <div class="card shadow mb-4" style="align-items: center;">
	                        <div class="card-body">
						<div class="row">
				    		<form action="expenseAdd" id="addFrm" method="post">
				    		
				    			<div class="mb-3">
								  <label for="username" class="form-label"></label>
								  <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
								</div>
								
								
								<div class="firstApLineBox mb-2" style="display: flex; align-items: center;">
								  <!-- controller에 정보 전달하기 위함 -->
								  <div id="apLine[0]">
								  <input type="hidden" id="firstLineUsername" name="lineUsername" value="">
								  <input type="hidden" id="firstLineEmpName" name="lineEmpName" value="">
								  </div>
								  
								  <label for="firstApLineInfo" class="form-label"></label>
								  <input type="text" class="form-control firstApLineInfo" id="firstApLineInfo" readonly style="width:250px;">
								  <button type="button" class="btn btn-primary ms-2" id="firstApLineSelect" name="firstApLineSelect" data-bs-target="#staticBackdrop1">1차 결재선 설정</button>
			                   
								  <button type="button" class="btn btn-primary ms-3" id="deleteLineBtn" style="font-size: 20px; display: none;" onclick="toggleButtons2()">-</button>
			                      <button type="button" class="btn btn-primary ms-3" id="addLineBtn" style="font-size: 20px;" onclick="toggleButtons2()">+</button>
								</div>
								
			                    
								<div class="secondApLineBox hidden mb-4" id="secondApLineBox" style="align-items: center;">
								  <!-- controller에 정보 전달하기 위함 -->
								  <div id="apLine[1]">
								  <input type="hidden" id="secondLineUsername" name="lineUsername" value="">
								  <input type="hidden" id="secondLineEmpName" name="lineEmpName" value="">
								  </div>
								  
								  <label for="secondApLineSelect" class="form-label"></label>
								  <input type="text" class="form-control secondApLineInfo" id="secondApLineInfo" style="width:250px; display: inline-block;" value="" readonly>
								  <button type="button" class="btn btn-primary" id="secondApLineSelect" name="secondApLineSelect" data-bs-target="#staticBackdrop2" style="display: inline-block; margin-left: 5px;">2차 결재선 설정</button>
								</div>

								
 								<jsp:include page="/WEB-INF/views/approval/apLineSelect.jsp"></jsp:include>
 								
 								<div style="display: flex; flex-wrap: wrap; justify-content: space-between; max-width: 800px;">
								
				    						    			
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="positionName" class="form-label">부서</label>
								  <input type="text" class="form-control" id="positionName" name="positionName" value="${user.positionName}" readonly>
								</div>
								
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="deptName" class="form-label">직급</label>
								  <input type="text" class="form-control" id="deptName" name="deptName" value="${user.deptName}" readonly>
								</div>
								
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="empName" class="form-label">성명</label>
								  <input type="text" class="form-control" id="empName" name="empName" value="${user.empName}" readonly>
								</div>
								
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="cDate" class="form-label">기안일자</label>
								  <input type="text" class="form-control" id="cDate" name="cDate" value="${date}" disabled>
								</div>
				    			
				    			<div class="mb-3 inputGroup" style="width: 100%;">
								  <label for="apTitle" class="form-label">제목</label>
								  <input type="text" class="form-control" id="apTitle" name="apTitle" placeholder="제목을 입력하세요">
								</div>


			                    <!-- <div class="mb-1" style="margin:0 auto; width:fit-content;">
			                        <button type="button" class="btn btn-primary" id="expensePlusBtn">내역 추가</button>
			                    </div> -->
			        
			                    <!-- 지출결의서 폼이 추가되는 곳 -->
			                    <div id="addList" class="my-5" style="width: 100%;">
									<div class="expense row g-3 mb-2" id="expense[0]" name="expense">
									    <input type="text" class="form-control me-2" id="expenseName0" name="expenseName" placeholder="항목" style="width:300px;">
									    <input type="text" class="form-control me-2" id="expenseAmount0" name="expenseAmount" placeholder="수량"
									    		style="width:80px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '');">
									    <input type="text" class="form-control me-2" id="expensePrice0" name="expensePrice" placeholder="금액"
									    		style="width:120px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '');">
									    <input type="text" class="form-control me-2" id="expenseBigo0" name="expenseBigo" placeholder="비고" style="width:200px;">
									    <button type="button" class="btn btn-primary" id="expensePlusBtn"  style="width:50px; height:38.94px;">+</button>
									</div> 
			                    </div>
			                    
			                    
			                    
			                    <!-- Upload file *************************************** -->
			                    <!-- <div class="mb-1" style="margin:0 auto; width:fit-content;">
			                        <button type="button" class="btn btn-primary" id="filePlus">File 추가</button>
			                    </div>
			        
			                    파일첨부 추가되는 영역
			                    <div id="fileList" class="my-5">
			                        <div class="input-group mb-3">
			                            <input type="file" name="files" class="form-control">
			                        </div>
			        
			                    </div> -->
			                    
			                    </div>
								
								<div class="row">
									<div class="demo-inline-spacing" style="text-align: right;">
										<button type="button" class="btn btn-primary" onclick="addSubmitBtn()">작성</button>
										<button type="button" class="btn btn-primary" onclick="cancleBtn()">취소</button>
									</div>
			                    </div>
								
				    		</form>
			    		</div>
					
					</div>
					<!-- / Content -->
					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
					<div class="content-backdrop fade"></div>
					</div>
					</div>
					
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	
	
	<!-- / Layout wrapper -->
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
	<!-- Vendors JS -->
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<!-- Page JS -->
	<script src="${pageContext.request.contextPath}/assets/js/dashboards-analytics.js"></script>
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	
	
	<script src="/js/approval/apExpenseAdd.js"></script>
	<script src="/js/approval/apFileAdd.js"></script>
	<script src="/js/approval/apLineSelect.js"></script>
	
	<script>
	    $(document).ready(function () {
	        $('#jstree').jstree();       
	        $("#jstree").jstree("open_all");
	        $('#jstree').on("changed.jstree", function (e, data) {
	            console.log(data.selected);
	        });
	    });
	</script>
	
	<script>
	    $(document).ready(function () {
	        $('#jstree2').jstree();       
	        $("#jstree2").jstree("open_all");
	        $('#jstree2').on("changed.jstree2", function (e, data) {
	            console.log(data.selected);
	        });
	    });
	</script>
	
	<script type="text/javascript">
	
		function toggleButtons() {
		  var addLineBtn = document.getElementById('addLineBtn');
		  var deleteLineBtn = document.getElementById('deleteLineBtn');
		  var secondApLineBox = document.getElementById('secondApLineBox');
		  var secondApLineInfo = document.getElementById('secondApLineInfo');
		  var secondLineUsername = document.getElementById('secondLineUsername');
		  var secondLineEmpName = document.getElementById('secondLineEmpName');
		  
		  if (addLineBtn.style.display !== 'none') {
			  	addLineBtn.style.display = 'none';
			  	secondApLineBox.style.display = 'inline-block';
			  	secondApLineInfo.value = "";
			  } else {
				addLineBtn.style.display = 'inline-block';
				secondApLineBox.style.display = 'none';
			  	secondLineUsername.value = "";
			  	secondLineEmpName.value = "";
			  }
		}
		
		
	    function toggleButtons2() {
	        var addLineBtn = document.getElementById('addLineBtn');
	        var deleteLineBtn = document.getElementById('deleteLineBtn');
	        var secondApLineBox = document.getElementById('secondApLineBox');
	        var secondApLineInfo = document.getElementById('secondApLineInfo');
	        var secondLineUsername = document.getElementById('secondLineUsername');
	        var secondLineEmpName = document.getElementById('secondLineEmpName');

	        if (addLineBtn.style.display !== 'none') {
	            addLineBtn.style.display = 'none';
	            deleteLineBtn.style.display = 'inline-block';
	            secondApLineBox.style.display = 'inline-block';
	            secondApLineInfo.value = "";
	        } else {
	            addLineBtn.style.display = 'inline-block';
	            deleteLineBtn.style.display = 'none';
	            secondApLineBox.style.display = 'none';
	            secondLineUsername.value = "";
	            secondLineEmpName.value = "";
	        }
	    }
	</script>


</body>
</html>