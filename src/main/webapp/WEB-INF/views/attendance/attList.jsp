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
<title>근태관리</title>

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
						<!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <div class="card-body">
	                            <div class="table-responsive">
	                            
                         	        <%-- <input type="hidden" name="attNo" id="attNo" value="${list.attNo}"> --%>
                               		<input type="hidden" name="username" id="username" value="${user.username}">
                               		<input type="hidden" name="empName" id="empName" value="${user.empName}">
	                            
	                            	<button type="button" class="btn btn-primary" onclick="attIn()" style="width:100px;">출근</button>
	                            	<button type="button" class="btn btn-primary" id="attOut" style="width:100px;">퇴근</button>
	                                
	                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
											<tr>
												<th>번호</th>
												<th>일자</th>
												<th>부서</th>
												<th>직급</th>
												<th>이름</th>
												<th>출근시간</th>
												<th>퇴근시간</th>
											</tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach items="${list}" var="at" varStatus="i">
		                                        <tr>
		                                        	<td>${i.index + 1}</td>
		                                        	<td>${at.today}</td>
		                                        	<td>${at.deptName}</td>
		                                            <td>${at.positionName}</td>
		                                        	<td>${at.empName}</td>
		                                            <td>${at.attIn}</td>
		                                            <td>${at.attOut}</td>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>  
				    			</div>
				    			

						        <!-- 전체 페이지 수 -->
						       <%--  <input type="hidden" name="totalPage" id="totalPage" value="${pager.totalPage}">
						        
								<div class="d-flex justify-content-between mb-3">
								<div>
									<!-- 검색 -->
									<div class="input-group mb-3">
										<form action="../attList}" method="get" class="d-flex align-items-center" id="frm">
											<div class="input-group" style="width: 120px;">
												<input type="hidden" value="${pager.page}" id="page" name="page">
												<select name="kind" id="k" class="form-select"
													data-kind="${pager.kind}" aria-label="Default select example" style="width: 50px;">
													<option class="kind" value="apTitle">제목</option>
													<option class="kind" value="apContents">내용</option>
													<option class="kind" value="apKind">기안종류</option>
												</select>
											</div> 
											<input type="text" name="search" value="${pager.search}"
												class="form-control" aria-label="Amount (to the nearest dollar)" style="width: 150px;">
												<button type="submit" class="btn btn-primary" style="width:100px;">검색</button>
										</form>
									</div>
								</div>
		    					<div>
		    						<!-- 페이징 -->
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<c:if test="${pager.pre}">
											<li class="page-item ${pager.pre?'':'disabled'}"><a
												class="page-link"
												href="/approval/draftList/${user.username}?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
											</c:if>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
												var="i">
												<li class="page-item"><a class="page-link"
													href="/approval/draftList/${user.username}?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
											</c:forEach>
											<c:if test="${pager.next}">
												<li class="page-item"><a class="page-link"
													href="/approval/draftList/${user.username}?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:if>
										</ul>
									</nav>
		    					</div>
							</div> --%>
						        
						        
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
	
	<script src="/js/attendance/attendance.js"></script>
	

	
</body>
</html>