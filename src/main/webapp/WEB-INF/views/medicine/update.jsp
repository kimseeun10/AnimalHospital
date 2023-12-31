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
<title>약품수정페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page" style="align-items:center;">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h3>약품수정</h3>
							<div class="card shadow mb-4" style="align-items: center;">
								<form action="./update" method="POST">
									<input type="hidden" name="medicineNo" value="${vo.medicineNo}">
			
									<div>	
										<div style="width: 550px; margin-top: 50px;">
											<div class="mb-3 row">
											    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">약품명</label>
												    <div class="col-sm-10">
												      <input type="text" readonly class="form-control-plaintext" id="name" value="${vo.name}">
												    </div>
											</div>
											<div class="mb-3 row">
											    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">재고</label>
												    <div class="col-sm-10">
												      <input type="text" name="stock" class="form-control" id="stock" value="${vo.stock}">
												    </div>
											</div>
											<div class="mb-3 row">
											    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">입고일</label>
												    <div class="col-sm-10">
												      <input type="date" name="medicineDate" readonly class="form-control-plaintext" id="medicineDate" value="${vo.medicineDate}">
												    </div>
											</div>
											<div class="mb-3 row">
											    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">유통기한</label>
												    <div class="col-sm-10">
												      <input type="date" name="expirationDate" readonly class="form-control-plaintext" id="expirationDate" value="${vo.expirationDate}">
												    </div>
											</div>
											<button class="btn btn-primary" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">수정</button>
										</div>
									</div>
								</form>
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