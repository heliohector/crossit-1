(function (window) {
	//안전한 코딩을 위함. 이전 JavaScript 버전에서 허용되었던 잘못된 구문을 오류로 알려줌
	'use strict';
	
	check_all();												//checkbox - 전체 체크 및 전체체크해제
	readItemAllAttendance();									//전체 리스트 읽기
	
	//document.oncontextmenu = new Function('return false');   	// 우클릭 방지
	document.ondragstart = new Function('return false');        // 드래그 방지
	document.onselectstart = new Function('return false');      // 복사 방지
	
})(window);


//전체 칼럼 수
var numCol = 12;


//전체 리스트 읽기
function readItemAllAttendance(){
	
	$.ajax({
		url: "json.jsp",
		method: "GET",
		//dataType: "json",
		headers: {
			'Content-Type': 'application/json'
		},
		success:function(data){
			
			//테이블 최상단에 날짜 칼럼 추가
			for(var i=8 ; i<=numCol ; i++){
				var thead_text = "<td id='td0-"+i+"'>--.--&nbsp;";
				thead_text += "<input type='hidden' id='start_date"+i+"' name='start_date"+i+"' value=''>";
				thead_text += "<input type='button' name='달력' value='▼' onClick=\"calendar(event, 'start_date"+i+"', '#td0-"+i+"');\"></td>";
				
				$("thead tr").append(thead_text);
			}
			
			//기존에 선택된 기수에 따른 테이블 내용 출력
			tableBySelected($("#term-select"), data);
			
			//select박스 기수 선택시, 테이블 새로고침
			$("#term-select").change(function() {
				tableBySelected($(this), data);
			});
			
			
		},
		error: function(e){
			alert("error from readItemAllAttendance()");					//에러  시 alert() 호출
		}
	});	
}


//select에 따라 테이블 내용 전환
function tableBySelected(select, data) {
	//테이블 내용 전환
	$("tbody").html("");

	//선택된 옵션에 'selected' 속성 추가 및 선택되지 않은 옵션은 'selected'속성 제거
	select.children("option:selected").attr("selected", "selected");
	select.children("option:selected").siblings().removeAttr("selected");

	//json파일(json.jsp)을 읽어와서 테이블에 출력
	//selectbox 옵션 개수만큼 반복
	for(var n=1 ; n<=select.children().size() ; n++){
		
		//전체 목록 개수만큼 반복
		for(var i=0, j=i+1 ; i<data.item.length ; i++, j++){
			//선택된 기수와 동일한 기수인 회원 목록 출력
			if((n == select.children("option:selected").val()) && (n == data.item[i].atUrTerm)){
				var td_text = "<tr>";
				td_text += "<td id='td"+j+"-1'><input type='checkbox' name='attendance-check' ";	
				td_text += "value='"+data.item[i].atNum+"'/></td>";						//체크 박스
				td_text += "<td id='td"+j+"-2'>"+data.item[i].atUrName+ "</td>";		//회원이름
				td_text += "<td id='td"+j+"-3'>"+data.item[i].atRest+ "</td>";			//잔여
				td_text += "<td id='td"+j+"-4'>"+data.item[i].atPresent+ "</td>";		//출석횟수
				td_text += "<td id='td"+j+"-5'>"+data.item[i].atLate+ "</td>";			//지각횟수
				td_text += "<td id='td"+j+"-6'>"+data.item[i].atAbsent+ "</td>";		//결석횟수
				td_text += "<td id='td"+j+"-7'>"+data.item[i].atPlus+ "</td>";			//가산점
				
				for(var k=8 ; k<=numCol ; k++){
					td_text += "<td id='td"+j+"-"+k+"'></td>";							//날짜
				}
				td_text += "</tr>";
				$("tbody").append(td_text);												//tbody에 삽입
				
				//각 칼럼에 대한 td의 value값을 초기화
				$("#td"+j+"-3").val(data.item[i].atRest);
				$("#td"+j+"-4").val(data.item[i].atPresent);
				$("#td"+j+"-5").val(data.item[i].atLate);
				$("#td"+j+"-6").val(data.item[i].atAbsent);
				$("#td"+j+"-7").val(data.item[i].atPlus);
				
				for(var k=8 ; k<=numCol ; k++){
					$("#td"+j+"-"+k).val(-2);
				}
			}
		}
	}	
}


//checkbox - 전체 체크 및 전체체크해제
function check_all(){
	if($("#check-all").is(":checked")){
		$("input:checkbox[name=attendance-check]").prop("checked", true);
	}
	else{
		$("input:checkbox[name=attendance-check]").prop("checked", false);
	}
}