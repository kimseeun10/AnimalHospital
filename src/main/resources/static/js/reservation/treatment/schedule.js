
$(function(){
	var request = $.ajax({
		url:"/treatment/schedule",
		method:"POST",			
		dataType:"json"
	});

	request.done(function(data){    
		console.log(data);
		console.log(data.start);
		console.log(data.treatmentNo);
		var calendarEl = document.getElementById('calendar');
		
		$('#closeBtn').on("click",function(){
							$("#customerNo").val("");
							$("#animalName").val("");
							$("#empNo").val("");
							$("#name").val("");    
							$("#treatmentDatet").val("");
		});

		var calendar= new FullCalendar.Calendar(calendarEl, {
			height:'600px',
			expandRows:true,
			customButtons:{
				myCustomButton:{
					text:"예약 등록하기",
					click : function(){
						$('#addModal').modal("show");
						
						var animalName=$("#animalName").val();
						console.log(animalName);
						
						/*$("#customerSearch").on("click",function(){
							if(animalName==""){
								alert("이름을 입력해주세요!");
								return false;
							}						
						})*/

						// $("#customerSearch").on("click", function(){
						// 	var animalName = $("#animalName").val();

						// 	$.ajax({
						// 		url:"/treatment/customerList",
						// 		data: animalName,
						// 		method:"GET",
						// 		success:function(data){
						// 			console.log(data);									
						// 			location.href="/treatment/customerList?animalName=" + data;
						// 			console.log("데이터전송성공");
						// 		}
						// 	})
						// })

						$('#addBtn').on("click", function(){

							var customerNo = $("#customerNo").val();
							var empNo = $("#empNo").val();
							var treatmentDatet = $("#treatmentDatet").val();
							
						
							var param = {"customerNo":customerNo, "empNo":empNo, "treatmentDatet":treatmentDatet};
							
							
							$.ajax({
								url:"/treatment/scheduleAdd",
								data:JSON.stringify(param),
								method:"POST",												
								contentType: "application/json",
								success : function(data){
									console.log(data);
									alert("예약이 완료되었습니다!")																		
								}
							})

							$("#addModal").modal("hide");
							$("#customerNo").val("");
							$("#animalName").val("");
							$("#empNo").val("");
							$("#name").val("");    
							$("#treatmentDatet").val("");

							location.href="/treatment/schedule";		
						});
						
					
						
					}
				}
			},
			headerToolbar: {
				left: 'prev,next,today,myCustomButton',
				center: 'title',
				right: 'dayGridMonth'
			},
			initialView:'dayGridMonth',
			events: data,
			navLinks: true,
			navLinkDayClick:function(date,jsEvent){
				console.log('day',date.format());
				console.log('coords',jsEvent.pageX,jsEvent.pageY);
			},
			editable: true,
			selectable: true,
			locale: 'ko',

			//이벤트 클릭했을시
			eventClick:function(info){		
				
				 var animalName=info.event.title;
				 var treatmentNo=info.event.id;
				 console.log(treatmentNo);
				 var param={"treatmentNo":treatmentNo}
				//  var treatmentDatet=info.event.start;
				
				//  var animalName=info.event.treatmentNo;
				//  var param={"animalName":animalName, "treatmentDatet":treatmentDatet};
				//  console.log(param);
				//  alert(treatmentNo);
				//  alert(animalName);
				//  alert(treatmentDatet);
				//파라미터로 가져올때 시간이 이상하게 변환됨 -9되서 
				// var param={"animalName":animalName};

			
				$.ajax({
					url:"/treatment/scheduleDetail",
					data: JSON.stringify(param),
					method:"POST",
					contentType: "application/json",
					success : function(data){
						
						console.log("detail 전송성공");
						console.log(data);
						console.log(data.animalName);
						
						$("#detailModal").modal("show");
						$("#treatmentNo").val(data.treatmentNo);
						$("#getanimalName").val(data.animalName);
						$("#getcustomerName").val(data.name);
						$("#getempNo").val(data.empNo);
						$("#getdate").val(data.treatmentDatet);							
																	            													
					}
				 })
				 
				 $("#modifyBtn").on("click", function(){
					 $("#detailModal").modal("hide");
					 $("#updateModal").modal("show");
					 
				 })
				 
				 
				 
				 
				 //삭제버튼클릭시
				 $("#deleteBtn").on("click",function(){
							
							$.ajax({
								url:"/treatment/scheduleDelete",
								data:JSON.stringify(param),
								method:"POST",
								contentType: "application/json",
								success : function(data){
									console.log("delete");
									alert("정말로 삭제하시겠습니까?");
									$("#detailModal").modal("hide");
									
									location.href="/treatment/schedule";
								}								 
							})
				 })				
				
				// location.href="/treatment/scheduleDetail";	
				// var animalName=info.event.title;
				// var treatmentDatet=info.event.start;
				// var param={"treatmentDatet":treatmentDatet};

				// $.ajax({
				// 	url:"/treatment/scheduleDelete",
				// 	data: JSON.stringify(param),
				// 	method:"POST",												
				// 	dataType: "json",
				// 	success : function(data){
				// 		console.log("delete");																		
				// 	}
				// })

				// var events = new Array();
				// var obj = new Object();
				// obj.animalName = info.event.title;
				// obj.treatmentDatet = info.event.start;			
				// events.push(obj);

				// console.log(events);
				// $.ajax({
				// 	url:"/treatment/scheduleDetail",
				// 	data:JSON.stringify(events),
				// 	method:"POST",												
				// 	contentType: "application/json",
				// 	success : function(data){
				// 		console.log("detail 전송성공");
				// 	}
				// });

				// $(function deleteData(){
				// 	$.ajax({
				// 		url:"treatment/scheduleDelete",
				// 		method:"DELETE",
				// 		dataType: "json",  
				// 		data: JSON.stringify(events),
				// 		contentType: 'application/json'
				// 	})
				// })

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