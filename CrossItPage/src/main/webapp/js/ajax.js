(function (window) {
	//안전한 코딩을 위함. 이전 JavaScript 버전에서 허용되었던 잘못된 구문을 오류로 알려줌
	'use strict';
	
	readItemAllContact();
	
})(window);

//전체 리스트 읽기
function readItemAllContact(){
	
	$.ajax({
		url: "json.jsp",
		method: "GET",
		//dataType: "json",
		headers: {
			'Content-Type': 'application/json'
		},
		success:function(data){
			var text = "<table><tr>";
			text += "<td>번호</td><td>이름</td>";
			text += "<td>이메일</td><td>문의내용</td>";
			text += "<td>작성일</td><td>답장내용</td></tr>";
			
			for(var i=0 ; i<data.item.length; i++){
				text += "<tr><td>" + data.item[i].ctNum + "</td>";
				
				text += "<td>"+data.item[i].ctName+"</td>";
				
				text += "<td>"+data.item[i].ctEmail+"</td>";
				
				text += "<td><a href='../contact/read.jsp?ctNum=" + data.item[i].ctNum + "'>"
						+ data.item[i].ctMsg+"</a></td>";
				
				text += "<td>"+data.item[i].ctRgDate+"</td>";
				
				if(!data.item[i].ctReply)
					text += "<td>-</td></tr>";
				else
					text += "<td>"+data.item[i].ctReply+"</td></tr>";
			}
			text += "</table>";
			$("#contact-table").append(text);
		},
		error: function(e){
			alert("error from readItemAllContact()");
		}
	});	
}
