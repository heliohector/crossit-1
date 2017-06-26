(function (window) {
	//안전한 코딩을 위함. 이전 JavaScript 버전에서 허용되었던 잘못된 구문을 오류로 알려줌
	'use strict';
	
	readItemAllContact();
	
	//document.oncontextmenu = new Function('return false');   	// 우클릭 방지
	document.ondragstart = new Function('return false');        // 드래그 방지
	document.onselectstart = new Function('return false');      // 복사 방지
	
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
			var text = "<thead><tr>";
			text += "<td style='width:50px;'>번호</td>";
			text += "<td style='width:100px;'>이름</td>";
			text += "<td style='width:200px;'>이메일</td>";
			text += "<td style='width:300px;'>문의내용</td>";
			text += "<td style='width:200px;'>작성일</td>";
			text += "<td style='width:250px;'>답장내용</td></tr></thead><tbody>";
			
			//json파일(json.jsp)을 읽어와서 테이블에 출력
			for(var i=0 ; i<data.item.length; i++){
				text += "<tr><td>" + data.item[i].ctNum + "</td>";			//번호
				
				text += "<td>"+data.item[i].ctName+"</td>";					//이름
				
				text += "<td>"+data.item[i].ctEmail+"</td>";				//이메일
				
				text += "<td><a href='../contact/read.jsp?ctNum=" + data.item[i].ctNum + "'>"
						+ data.item[i].ctMsg+"</a></td>";					//내용
				
				text += "<td>"+data.item[i].ctRgDate+"</td>";				//등록일시
				
				if(!data.item[i].ctReply)
					text += "<td>-</td></tr>";								//답장내용이 없으면 "-" 출력
				else
					text += "<td>"+data.item[i].ctReply+"</td></tr>";		//답장내용
			}
			text += "</tbody>";
			$("#contact-table").append(text);								//테이블에 추가
			
			paging();														//페이징 함수 호출
		},
		error: function(e){
			alert("error from readItemAllContact()");						//에러  시 alert() 호출
		}
	});	
}


//페이징 처리
function paging() {
	
	//테이블의 div요소 'paginated'에 적용
	$("table.paginated").each(function() {
		
		/****** 페이징에 필요한 변수 정의 및 초기화 ******/
		var currentPage = 0;							//현재 페이지
		var numPerView = 5;								//한 화면당 보여질 페이지 숫자버튼 수 
		var numPerPage = 4;  							//한 페이지당 보여질 목록의 수
		
		var $table = $(this);
		var numRows = $table.find("tbody tr").length;	//전체 목록 수
		var numPages = Math.ceil(numRows/numPerPage);	//전체 페이지 갯수(반올림)
		
		var $pager = $("<td colspan='6' align='center'><div class='pager'></div></td>");	//페이지 숫자버튼 담을 변수
		
		
		//페이지 숫자버튼 클릭 시 reload ('repaginate' 이벤트 실행)
		$table.on("repaginate", function() {
			
			//모든 목록을 감추었다가 현재 페이지의 해당되는 목록만 출력
			$table.find("tbody tr")
				  .hide()
				  .slice(currentPage*numPerPage, (currentPage+1)*numPerPage)
				  .show();
			$(".pager").html("");
			
			
			//페이지 '이전'버튼
			if(currentPage >= numPerView) {
				//처음 페이지가 아닐 때, 현재 페이지를 이전 페이지로 변경
				$("<span class='page-span'></span>").text("◀이전 ")
													.on("click", function() {
														currentPage = (Math.floor(currentPage/numPerView)-1)*numPerView;
														$table.trigger("repaginate");		//페이지 reload
													}).addClass("clickable")
													  .appendTo(".pager");					//'pager' div요소에 삽입
			}
			
			
			//페이지 '숫자'버튼
			for (var page=0 ; page<numPerView ; page++) {
				//해당 페이지가 속한 정해진 페이지 버튼들을 출력할 변수
				var pages = Math.floor(currentPage/numPerView)*numPerView + page+1;
				
				//정해진 페이지 버튼의 수 보다 전체 페이지가 적을 경우, 마지막 페이지를 초과할 경우 중단
				if((page >= numPages) || (pages > numPages))
					break;
				
				//페이지 숫자 구분선 삽입
				$("<span class='page-span page-line'>|</span>").appendTo(".pager");
				
				//페이지 숫자 버튼 삽입
				$("<span class='page-span'></span>").text(" " + pages + " ")
													.on("click", {dataVal: pages-1}, function(event) {
														currentPage = event.data.dataVal;			//현재 페이지 갱신
														$table.trigger("repaginate");				//페이지 reload
														
														var activePage = currentPage%numPerView;	//해당 페이지 버튼의 활성화 변수
														if(currentPage>=numPerView) 
															activePage+=1;							//'이전' 버튼은 활성화 제외
														$($(".clickable")[activePage]).addClass("active")
															   .siblings()
															   .removeClass("active");				//현재 페이지 버튼만 활성화
														
													}).addClass("clickable")
													  .appendTo(".pager");							//'pager' div요소에 삽입
			}
			
			
			//페이지 '다음'버튼
			if(Math.floor(currentPage/numPerView) != Math.floor((numPages-1)/numPerView)) {
				//페이지 숫자 구분선 삽입
				$("<span class='page-span page-line'>|</span>").appendTo(".pager");
				
				//마지막 페이지가 아닐 때, 다음 페이지로 현재 페이지 변경
				$("<span class='page-span'></span>").text(" 다음▶")
													.on("click", function() {
														currentPage = Math.floor(currentPage/numPerView)+numPerView;
														$table.trigger("repaginate");		//페이지 reload
													}).addClass("clickable")
													  .appendTo(".pager");					//'pager' div요소에 삽입
			}
		});		
		
		
		//테이블 하단에 배치할 페이지 버튼 배치
		$pager.insertAfter($table);
		//테이블에 페이지 버튼 삽입
		$pager.appendTo($table);
		//현재 페이지 출력을 위해 강제 호출
		$table.trigger("repaginate");
	});
}