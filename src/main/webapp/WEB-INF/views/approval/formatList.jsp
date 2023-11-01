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
</head>
<meta charset="UTF-8">
<title>양식 선택 리스트</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<sec:authentication property="Principal" var="user"/>
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">				
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <div class="card-body">
	                            <div class="table-responsive">
	                            	
	                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>양식 종류</th>
	                                            <th>설명</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td><a href="/approval/add/poomAdd">품의서</a></td>
	                                            <td>품의서 작성페이지입니다.</td>
	                                        </tr>
	                                        <tr>
	                                            <td><a href="/approval/add/expenseAdd">지출결의서</a></td>
	                                            <td>지출결의서 작성페이지입니다.</td>
	                                        </tr>
	                                        <tr>
	                                            <td><a href="/approval/add/dayoffAdd">휴가신청서</a></td>
	                                            <td>휴가신청서 작성페이지입니다.</td>
	                                        </tr>
	                                        <tr>
	                                            <td><a href="/approval/add/vacationAdd">휴직신청서</a></td>
	                                            <td>휴직신청서 작성페이지입니다.</td>
	                                        </tr>  
	                                        <tr>
	                                            <td><a href="/approval/add/retireAdd">퇴직신청서</a></td>
	                                            <td>퇴직신청서 작성페이지입니다.</td>
	                                        </tr>  
	                                    </tbody>
	                                </table>  
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
	

</body>
</html>