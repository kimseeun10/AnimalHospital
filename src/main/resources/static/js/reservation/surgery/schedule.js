

$(function(){
			
		var request = $.ajax({				
		url:"/surgery/schedule",
	    method:"POST",			
		dataType:"json"
		});		

			
	request.done(function(data){
	
		
		console.log(data);
	
		var calendarEl = document.getElementById('calendar');
		
		$('#closeBtn').on("click",function(){
							$("#customerNo").val("");
							$("#animalName").val("");
							$("#username").val("");
							$("#name").val("");    
							$("#treatmentDate").val("");
		});
		
		
		var calendar= new FullCalendar.Calendar(calendarEl, {
			height:'600px',
			expandRows:true,
			customButtons:{
				myCustomButton:{
					text:"수술실 예약",
					click : function(){
						$('#addModal').modal("show");
						
					
						//등록버튼클릭시
						$('#addBtn').on("click", function(){

							var customerNo = $("#customerNo").val();
							var userName = $("#username").val();
							var surgeryRoom = $("#surgeryRoom").val();
							var surgeryName = $("#surgeryName").val();
							var surgeryStart = $("#surgeryStart").val();
							var surgeryEnd = $("#surgeryEnd").val();
							
						
			
							var param = {"customerNo":customerNo, "userName":userName, "surgeryRoom":surgeryRoom,
											"surgeryName":surgeryName, "surgeryStart":surgeryStart, "surgeryEnd":surgeryEnd};
							
							
							$.ajax({
								url:"/surgery/scheduleAdd",
								data:JSON.stringify(param),
								method:"POST",												
								contentType: "application/json",
								success : function(data){
									console.log(data);
									console.log("수술예약!!!");
									location.href="/surgery/schedule";							
								}
							})

						});				
					}
				}
			},
			headerToolbar: {
				left: 'prev,next,today,myCustomButton',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek'
			},
			initialView:'dayGridMonth',
			events: data,
			navLinks: true,
			navLinkDayClick:function(date,jsEvent){
				console.log(date);
				$("#addModal").modal("show");
				console.log('coords',jsEvent.pageX,jsEvent.pageY);
			},
			editable: true,
			selectable: true,
			locale: 'ko',
			dateClick: function() {  
				//달력안에 클릭하면 				 
 			},
			
			
			//이벤트 클릭했을시 detail
			eventClick:function(info){		
				 console.log(info);
			
				 var surgeryNo=info.event.id;
				 console.log(surgeryNo);
				 var param={"surgeryNo":surgeryNo}				

				$.ajax({
					url:"/surgery/scheduleDetail",
					data: JSON.stringify(param),
					method:"POST",
					contentType: "application/json",
					success : function(detail){
						
						console.log("detail 전송성공");
						console.log(detail);
						console.log(detail.animalName);
						
						$("#detailModal").modal("show");
						$("#surgeryNo").val(detail.surgeryNo);
						$("#getanimalName").val(detail.animalName);
						$("#getcustomerName").val(detail.name);
						$("#getempname").val(detail.empName);
						$("#getcustomerNo").val(detail.customerNo);						
						$("#getsurno").val(detail.surgeryRoom);
						$("#getsurname").val(detail.surgeryName);
						$("#getstartdate").val(detail.surgeryStart);
						$("#getenddate").val(detail.surgeryEnd);
						
						
						 //수정버튼클릭시
						$("#modifyBtn").on("click", function(){	
							$("#detailModal").modal("hide");
							$("#updateModal").modal("show");
							
							$("#upname").val(detail.animalName);
							$("#upsurno").val(detail.surgeryRoom);
							$("#upsurname").val(detail.surgeryName);
							$("#upusername").val(detail.userName);
							
							$("#upstartdate").val(detail.surgeryStart);
							$("#upenddate").val(detail.surgeryEnd);
					
							var usernameval = $("#upusername");
							console.log(usernameval);		
							
					   })				
											            													
					}
				 })
				 
				 //삭제버튼클릭시
				 $("#deleteBtn").on("click",function(){
							console.log(param);
							$.ajax({
								url:"/surgery/scheduleDelete",
								data:JSON.stringify(param),
								method:"POST",
								contentType: "application/json",
								success : function(data){
									console.log("delete");
									
									$("#detailModal").modal("hide");
									
									location.href="/surgery/schedule";
								}								 
							})
				 })	
				 
				 
				 //수정등록버튼클릭시
				 $("#updateBtn").on("click",function(){
					 		var upname = $("#upname").val();
							
					 		var surgeryNo = $("#surgeryNo").val();				 
							var customerNo = $("#getcustomerNo").val();
																		
							var username= $("#upusername").val();							
							var surgeryStart = $("#upstartdate").val();
							var surgeryEnd=$("#upenddate").val();
							var surgeryRoom=$("#upsurno").val();
							var surgeryName=$("#upsurname").val();
							
							
							var param = {"surgeryNo":surgeryNo, "customerNo":customerNo, "userName":username, "surgeryStart":surgeryStart,
										 "surgeryEnd":surgeryEnd, "surgeryRoom":surgeryRoom, "surgeryName":surgeryName}
							
							console.log(param);
							$.ajax({
										url:"/surgery/scheduleUpdate",
										data:JSON.stringify(param),
										method:"POST",
										contentType: "application/json",
										success : function(data){
											console.log("surgery update성공")					
											location.href="/surgery/schedule";
										}							 
						 	})		   
								
				 })				

			},

		eventAdd:function(obj){
			console.log(obj)
		},
		

		});
		calendar.render();
		});
	
	request.fail(function(jqXHR, textStatus){
		alert("Request failed: " + textStatus);

	});
	
});