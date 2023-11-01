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
<title>Insert title here</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
			<sec:authentication property="Principal" var="user"/>
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->

				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
					
					<form>
					<h3>${user.empName}의 마이페이지</h3>
													
					<div class="card shadow mb-4" style="align-items: center; width: 68%; float: left;">
							<div>
								<div style="width: 300px; float: left;">
									<c:if test="${vo.originalFileName == null }">
										<img alt="" src="/resources/images/default.jpeg" style="width: 250px; height: 250px; margin: 30px;">
									</c:if>
									<c:if test="${vo.originalFileName != null }">		
										<img alt="" src="../files/emp/${vo.fileName}" style="width: 250px; height: 250px; margin: 30px;">
									</c:if>
								</div>
							<div style="width: 550px; margin-top: 20px; margin-bottom: 20px; float: left;">
								
								<table class="table" style="margin-top: 40px;">

									<tr>
										<td>사번</td>
										<td>${user.userName}</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${user.empName}</td>
									</tr>
									<tr>
										<td>부서</td>
										<td>${user.deptName}</td>
									</tr>
									<tr>
										<td>직급</td>
										<td>${user.positionName}</td>
									</tr>

								</table>							
							</div>
							<br>
							<div>
								<table class="table">
									<tr>
										<td>입사일</td>
										<td>${user.hireDate}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${user.email}</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>${user.phone}</td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td>${user.birth}</td>
									</tr>
									<tr>
										
									</tr>
								</table>
							</div>
							<br>
							<a href="/emp/mypageUpdate?userName=${user.userName}" class="btn btn-danger">수정</a>
							<a href="/emp/pwUpdate?username=${user.userName}" class="btn btn-danger">비밀번호 변경</a>
						</div>
				</div>
				<!-- Content wrapper -->
				<div class="card shadow mb-4" style="width:30%; height: 500px; float: right;">	
					<h3>도장관리</h3>
				</div>			
					</form>
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	</div>
</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

</body>
</html>