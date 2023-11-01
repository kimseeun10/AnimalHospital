<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
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
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h1>Format Detail Page</h1>
						
						<!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <div class="card-body">
	                            <div class="table-responsive">
		                            <div>
		                            
										<form action="" id="frm">
		                            		<input type="hidden" id="apFormatNo" name="apFormatNo" value="${apFormatVO.apFormatNo}">
										</form>
		                            
                                		<table class="table">
		
									    <tr>
									        <th class="text-center" style="width: 100px;">제목</th>
									        <td>${apFormatVO.apFormatTitle}</td>
									    </tr>

									    <tr>
									        <th class="text-center" style="width: 100px;">작성일</th>
									        <td>${apFormatVO.apFormatDate}</td>
									    </tr>
								 
										</table>
										
										<div class="mb-3 mt-4 ms-4">
											<label for="contents" class="form-label"></label>
											${apFormatVO.apFormatContents}
										</div>
										
									
										</div>
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary submitBtn" id="updateBtn" data-url="update">수정</button>
												<button type="button" class="btn btn-danger submitBtn" id="deleteBtn" data-url="delete">삭제</button>
												<button type="button" class="btn btn-primary" id="listBtn">목록</button>
											</div>
			                            </div>
					    			</div>
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
	
	<script src="/js/approval/format/formatDetail.js"></script>

</body>
</html>