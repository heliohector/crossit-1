(function (window) {
	//안전한 코딩을 위함. 이전 JavaScript 버전에서 허용되었던 잘못된 구문을 오류로 알려줌
	'use strict';
	
	readItemAll();
	
})(window);

//전체 리스트 읽기
function readItemAll(){
	
	$.ajax({
		url: "BoardJson.jsp",
		method: "GET",
		//dataType: "json",
		headers: {
			'Content-Type': 'application/json'
		},
		success:function(data){
			var text = "<table><tr>";
			text += "<td class='tableTop'>번호</td><td class='tableTop'>제목</td>";
			text += "<td class='tableTop'>글쓴이</td><td class='tableTop'>파일</td>";
			text += "<td class='tableTop'>작성일</td></tr>";
			
			for(var i=0 ; i<data.item.length; i++){
				text += "<tr><td>" + data.item[i].boardIndex + "</td>";
				
				text += "<td><a href='BoardRead.jsp?boardIndex=" + data.item[i].boardIndex + "'>"
						+ data.item[i].title+"</a></td>";

				text += "<td>"+data.item[i].userName+"</td>";
				
				if(!data.item[i].file)
					text += "<td>-</td>";
				else
					text += "<td>"+data.item[i].file+"</td>";
				
				text += "<td>"+data.item[i].registerDate+"</td></tr>";
			}
			text += "</table>";
			$("#tableIndex").append(text);
		},
		error: function(e){
			alert("error from readItemAll()");
		}
	});	
}

function createItem(value){
	/*var title = $("#createTitle").val().trim();
	var userName = $("#createUserName").val().trim();
	var content = $("#createContent").val().trim();
	var file = $("#createFile").val().trim();
	
	if(file){
		var fileName = file.split("\\");
		file = fileName[fileName.length-1];
	}
	
	var text = "BoardCreate.jsp?title="+title;
	*/
	/*var value = {
			"content" : content,
			"file" : file,
			"title" : title,
			"userName" : userName
	};
	
	console.log(value); */
	
	//$.ajax({
	//	url: "BoardJson2.jsp",
	//	method: "POST",
	//	headers: {
	//		'Content-Type': 'application/json'
	//	},
		//data: value,
		//data: {
		//	"item" : value
		//},
	//	data: JSON.stringify({
	//		"item" : value
		//	"content" : value.content,
		//	"file" : value.file,
		//	"title" : value.title,
		//	"userName" : value.userName
	//	}),
	//	success:function(data){
	//		console.log(data);
			//var text = value.title;
			//$("#ajax").append(text);
			//$(location).attr("href", "BoardJson2.jsp");
	//	},
	//	error: function(e){
	//		alert("error");
	//	}
	//})
	//$(location).attr("href", "BoardCreate.jsp");
}

function readItem(boardIndex){
	//alert(boardIndex);
	/*$.ajax({
		url: "BoardJson2.jsp?boardIndex=3",
		method: "GET",
		headers: {
			'Content-Type': 'application/json'
		},
		success: function(data){
			//alert("aa");
		},
		error: function(e){
			alert("error from readItem()");
		}
	});*/	
}

//$(document).ready(function() {
//});
//jQuery(loadData);
