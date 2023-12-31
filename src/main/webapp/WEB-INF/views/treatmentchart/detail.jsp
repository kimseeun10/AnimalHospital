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
<title>진료차트상세페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page" style="align-items:center;">
			<sec:authentication property="Principal" var="user"/>
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="card shadow mb-4" style="align-items: center;">
								<div>
									<div style="width: 700px; margin-top: 20px;">
										<div>
											<table class="table">
												<tr>
													<td rowspan="2" style="font-size: xx-large; font-weight: bolder;">진료차트상세</td>
													<!-- <td></td> -->
													<td>작성자</td>
													<td>${vo.empName}</td>
												</tr>
												<tr>
													<!-- <td></td> -->
													<!-- <td></td> -->
													<td>작성일</td>
													<td>${vo.date}</td>
												</tr>
											</table>
											<div style="width: 100%; height: 300px;">
												<br><h3>반려동물</h3>
												<div style="width: 50%; float: left;">
													<div class="mb-3 row">
													    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">이름</label>
														    <div class="col-sm-10">
														      <input type="text" readonly class="form-control-plaintext" id="animalName" value="${cus.animalName}">
														    </div>
													  </div>
													  <div class="mb-3 row">
													    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">성별</label>
														    <div class="col-sm-10">
														      <input type="text" readonly class="form-control-plaintext" id="gender" value="${cus.gender}">
														    </div>
													  </div>
													  <div class="mb-3 row">
													    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">나이</label>
														    <div class="col-sm-10">
														      <input type="text" readonly class="form-control-plaintext" id="age" value="${cus.age}">
														    </div>
													  </div>
													  <div class="mb-3 row">
													    <label for="disease" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">병명</label>
														    <div class="col-sm-10">
														    <input type="text" readonly class="form-control-plaintext" id="disease" value="${vo.disease}">
														    </div>
													  </div>
												</div>
												
												<div style="width: 50%; float: right;">
													
												</div>	
											</div>
                                            
                                            <div class="card" style="width: auto; margin-top: 20px;">
											  <div class="card-body" style="border-style: ridge;">
											    <h5 class="card-title">진료내용</h5>
											    <p class="card-text">${vo.contents}</p>
											  </div>
											</div>
                                            
                                            <div class="mb-3" style="margin-top: 20px;">
                                            	사용한 약품 이름: ${vo.name}
                                            </div>
                                            
                                            <div>
												<c:forEach items="${vo.fileVOs}" var="f">
													<img alt="" src="../files/treatmentchart/${f.fileName}"
													style="width: 300px; height: 300px; margin: 30px;">
												</c:forEach>
											</div>

										</div>
										<a href="./update?chartNo=${vo.chartNo}&customerNo=${cus.customerNo}&username=${user.username}" class="btn btn-primary" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">진료차트수정</a>
									</div>
								</div>
						</div>	
					</div>
				<!-- Content wrapper -->
				</div>
			<!-- / Layout page -->
			</div>
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

</body>
</html>