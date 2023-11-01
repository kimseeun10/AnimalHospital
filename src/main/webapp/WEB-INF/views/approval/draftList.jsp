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
<title>기안함</title>

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
	                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>번호</th>
	                                            <th>종류</th>
	                                            <th>제목</th>
	                                            <th>작성자</th>
	                                            <th>부서</th>
	                                            <th>기안일</th>
	                                            <th>상태</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach items="${list}" var="ap" varStatus="i">
	                                    	
	                                    		<input type="hidden" name="apNo" id="apNo" value="${ap.apNo}">
	                                    		<input type="hidden" name="username" id="username" value="${user.username}">
	                                    		
		                                        <tr>
		                                        	<td>${i.index + 1}</td>
		                                        	<td>${ap.apKind}</td>
		                                            <td><a href="/approval/detail?apNo=${ap.apNo}">${ap.apTitle}</a></td>
		                                            <td>${ap.empName}</td>
		                                            <td>${ap.deptName}</td>
		                                            <td>${ap.apCDate}</td>
		                                            <td>${ap.apState}</td>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>  
				    			</div>
				    			

						        <!-- 전체 페이지 수 -->
						        <input type="hidden" name="totalPage" id="totalPage" value="${pager.totalPage}">
						        
						        <!-- 검색 Search (수정 후) -->
						        <!-- Search Box -->
<%-- 						        <div class="row" style="margin-top: 20px;">
						            <div class="col-xl-12">
						                <!-- form -->
						                <form action="../draftList/${pager.empNo}" method="get" id="searchFrm">
											<input type="hidden" value="${pager.page}" id="page" name="page">
											<select name="kind" id="kind">
												<option class="s" value="apKind">기안서종류</option>
												<option class="s" value="apTitle">제목</option>
												<option class="s" value="apContents">내용</option>
											</select>
											<input type="text" name="search" id="search" value="${pager.search}">
											<button type="submit" id="searchBtn">검색</button>
										</form>
						            </div>
						        </div>
						    
						        <!-- Pager -->
 						        <nav class="container" aria-label="Page navigation example">
						            <ul class="pagination justify-content-center">
						                <c:if test="${pager.pre}">
						                    <li class="page-item ${pager.pre?'':'disabled'}">
							                    <a class="page-link"
							                       href="/approval/draftList/${pager.empNo}?kind=${pager.kind}&search=${pager.search}&page=${pager.startNum-1}">Previous
							                    </a>
						                    </li>
						                </c:if>
						                <!-- pager.startNum : ${pager.startNum}, pager.lastNum : ${pager.lastNum} -->
						                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							                <li class="page-item move">
								                <a class="page-link"
								                   href="/approval/draftList/${pager.empNo}?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}
								                </a>
							                </li>
						                </c:forEach>
						                <c:if test="${pager.next}">
							                <li class="page-item move">
								                <a class="page-link"
								                   href="/approval/draftList/${pager.empNo}?kind=${pager.kind}&search=${pager.search}&page=${pager.lastNum+1}">Next
								                </a>
							                </li>
						                </c:if>
						            </ul>
						        </nav> --%>
						        


						        
						        
								<!-- 검색 -->
<%-- 								<form action="../draftList/${pager.empNo}" id="searchFrm">
									<input type="hidden" name="pageNum" value="1" id="pageNum">
									<select name="kind" id="kind">
										<option class="s" value="title">제목</option>
										<option class="s" value="contents">내용</option>
										<option class="s" value="writer">작성자</option>
									</select>
									<input type="text" name="search" id="search" value="${pager.search}">
									<button type="submit" id="btn">검색</button>
								</form>
								
								<!-- 페이징 -->
								<section id="paging">
									<button class="p" data-list-pn="${pager.startNum-1}" type="button">이전</button>
								
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<span class="p" data-list-pn="${i}" >${i}</span>
									</c:forEach>
								
									<c:if test="${!pager.lastCheck}">
										<button class="p" data-list-pn="${pager.lastNum+1}" type="button">다음</button>
									</c:if>
								</section> --%>
						        
						        
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
	
	<script type="text/javascript">
		setKind("${pager.kind}");
	</script>
	
</body>
</html>