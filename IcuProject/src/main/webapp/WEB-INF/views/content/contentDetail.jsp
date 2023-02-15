<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="c" value="${content}"/>
<c:set var="g" value="${genre }"/>
<c:set var="size" value="${fn:length(genre)}" />
<c:set var="ott_size" value="${fn:length(ott)}" />
<c:set var="memNo" value="${memNo }"/>
<c:set var="memId" value="${memId }"/>
<c:set var="o" value="${ott }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 컨텐츠 상세</title>


<!-- css -->
<link rel="stylesheet" href="${contextPath }/resources/css/contentDetail.css" />

</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <div id="whole">
    	<div id="infoAndPoster">
	    	<div id="info">
	    	<br>
	    		<h2>&nbsp;&nbsp;${c.conKTitle}</h2>
	    		<h4>&nbsp;&nbsp;${c.conETitle}, ${c.conDate }</h4>
	    		&nbsp;&nbsp;<span class='setStarTitle'>★★★★★ 
					<span style='width:0%'>★★★★★</span>
				</span>
				<h4 id="scoreAvg">&nbsp;&nbsp;()</h4>
	    		<br>
	    		<c:if test="${c.conAge ne 0}">
	    			<h6>&nbsp;&nbsp;<b>관람 연령 : ${c.conAge }세 미만 관람 불가</b></h6>
	    		</c:if>
	    		<c:if test="${c.conAge eq 0}">
	    			<h6>&nbsp;&nbsp;<b>관람 연령 : 전체이용가</b></h6>
	    		</c:if>
	    		<h6>&nbsp;&nbsp;<b>장르 : 
		    		<c:forEach var="genre" items="${g }" varStatus="status">
		    			${genre }<c:if test="${status.count ne size}">, </b></c:if>
		    		</c:forEach>
	    		</h6>
	    		<c:if test="${c.conCategory eq 2}">
	    			<h6>&nbsp;&nbsp;<b>방영 회차 : ${c.conInfo }부작</b></h6>
	    		</c:if>
	    		<c:if test="${c.conCategory eq 1}">
	    			<h6>&nbsp;&nbsp;<b>상영 시간: ${c.conInfo }분</b></h6>
	    		</c:if>
	    		<h6>&nbsp;&nbsp;<b>방영 날짜 : ${c.conDate }</b></h6>
	    		<h6>&nbsp;&nbsp;<b>플랫폼 : 
	    			<c:forEach var="ott" items="${o }" varStatus="status">
	    				<c:if test="${ott eq 1}">넷플릭스</c:if>
	    				<c:if test="${ott eq 2}">웨이브</c:if>
	    				<c:if test="${ott eq 3}">왓챠</c:if>
	    				<c:if test="${ott eq 4}">디즈니 플러스</c:if>
	    				<c:if test="${ott eq 5}">Apple Tv</c:if>
		    			<c:if test="${status.count ne ott_size}">, </b></c:if>
		    		</c:forEach>
				</h6>
	    	</div>
	    	<div id="poster">
	    		<c:if test="${c.filePath eq '' or c.filePath eq null}">
					<a href="${c.filePath}${c.changeName}" class="imageFocus" data-modaal-desc="${c.conETitle}">
						<img src="${c.filePath}${c.changeName}"/>
					</a>
	
				</c:if>
				<c:if test="${c.filePath ne '' and c.filePath ne null}">
					<a href="${contextPath}/${c.filePath}${c.changeName}" class="imageFocus" data-modaal-desc="${c.conETitle}">
						<img src="${contextPath}/${c.filePath}${c.changeName}"/>
					</a>
				</c:if>
	    	</div>
    	</div>
    	
    	<div id="preview">
    	
    	<a href="${c.conPreview }" class="video aTag">Show</a>
    	
   		<iframe class='bTag' width="810" height="300" src="${c.conPreview }" title="YouTube video player" 
   		frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" ></iframe>
    	</div>
    	
    	<div id="info2">
    		<br>
	    	<h6><span class="hTitle">감독</span> : ${c.conDirector }</h6>
	    	<h6><span class="hTitle">배우</span> : ${c.conActor }</h6>
	    	<h6 class="wideLineHeight"><span class="hTitle">줄거리</span> : ${c.conSynop }</h6>
	    	<c:if test="${loginUser.role eq 'A'}">
	    		<button type="submit" id="updateBtn" class="btn btn-outline-primary btn-lg" onclick="movePage(${c.conNo});">수정하기</button>
	    		<button type="submit" id="deleteBtn" class="btn btn-outline-primary btn-lg" onclick="deleteContent(${c.conNo});">삭제하기</button>
	    	</c:if>
    	</div>
    </div>
    <br>
    
    <section id='review-container'>
    <div id="reviewWrite">
    	<c:if test="${loginUser.role eq 'C' || memNo gt 1}">
	    	<h6 id="average">평점 : 0점</h6>
			<span class="star">
			★★★★★
			<span>★★★★★</span>
			<input type="range" id="score" name="score" oninput="drawStar(this)" value="0" step="1" min="0" max="10">
			</span>
		</c:if>
		<div id="reviewInput">

			<c:if test="${loginUser.role eq 'C' || memNo gt 1 }">
				<textarea cols="75" rows="5" id="cmtContent" placeholder="내용을 입력해주세요" style="resize: none;" required></textarea>
				<button type="submit" id="submitBtn" class="btn btn-outline-primary btn-lg" onclick="insertReview();">작성</button>
			</c:if>
			
			<c:if test="${memNo eq 0 }">
				<textarea cols="75" rows="4" placeholder="로그인 후 이용해주세요" disabled style="resize: none;"></textarea>
				<button type="submit" id="submitBtn" class="btn btn-outline-primary btn-lg" disabled>작성</button>
			</c:if>
		</div>
		
	<div id="review">
		<div id="writtenReview">
			<div id="reviewContent">
				<div id="reviewText">
					<h5 style='margin-top:200px;'>작성된 리뷰가 존재하지 않습니다</h5>
				</div>
			</div>
		</div>
	</div>
    </div>
    </section>
	
	<!-- 실시간 문의 -->
	<c:if test="${loginUser != null }">
    	<jsp:include page="../common/chatForm.jsp"/>
    </c:if>
    <script>

    </script>
    <script>
    $('.video').modaal({
    	type: 'video'
    });
 
    $('.imageFocus').modaal({
        type: 'image',
        width: 900,
        height:500
        
    });
    
    $(function(){
    	console.log("${ott}");
    	selectReview();
    	//"<button type='button' id='deleteComment'>삭제하기</button>"
    	starChange();
    })
    
	function drawStar(target){
		   let percent = 0;
		   percent = target.value * 10+'%';
		    	
		   $('.star>span').width(percent);
		   $('#average').text("평점 : "+target.value * 0.5+"점");	
		   console.log(percent);
		}
		
	    function insertReview(){
	    	if($("#cmtContent").val() == ''){
	    		Swal.fire({
                    icon: 'error',
                    title: '댓글 내용을 입력해주세요'                  
                });
	    		return false;
	    	}
			if($("#score").val() == 0){
	    		Swal.fire({
                    icon: 'error',
                    title: '평점을 입력해주세요'                  
                });
	    		return false;
	    	}
	    	$.ajax({
	    		url : '${contextPath}/commentInsert.co',
				data : {conNo : '${c.conNo}', memNo : '${memNo}'
					, cmtContent : $("#cmtContent").val()
					, cmtScore : ($("#score").val()) * 10},
				success: function(result){
					$("#cmtContent").val('');
					$('.star>span').width('0%');
					$('#average').text('평점');
					selectReview();
				}
	    	})
	    }
		
	    function deleteReview(cno){
	    	Swal.fire({
	    		icon: 'warning',
	    		title: '댓글을 삭제하시겠습니까?',   
            }).then((result) => {
        		if (result.isConfirmed) {
        		    $.ajax({
        		    	url : '${contextPath}/commentDelete.co',
        				data : {cmtNo : cno},
        				success: function(result){
        					Swal.fire({
        		            	icon: 'success',
        		            	title: '댓글을 삭제했습니다'                  
        		            });
        					selectReview();
        					location.reload();
        				}
        		    })                    	
        		}
            });
	    }
	    
		function selectReview(){
			$.ajax({
				url : '${contextPath}/comment.co',
				data : {conNo : '${c.conNo}'},
				dataType : 'json',
				success: function(result){
					console.log(result);
					let html ="";
					let img = "";
					for(let comment of result){
						if('${memNo}' == comment.cmtWriter){
							$('#submitBtn').attr("disabled", true);
							$('.textarea').attr("disabled", true);
							$('#score').attr("disabled", true);
							$('.textarea').attr("placeholder", "이미 평가를 진행한 유저입니다");
						}
						html += "<div class='profile-container'><div id='profileArea'>" +
									"<div id='profile'>";
						if(comment.filePath != "" && comment.chagneName != ""){
							html += "<img src='"+${contextPath}/+comment.filePath+comment.changeName+"'/>";
						}
						else{
							html += "<i class='fa-solid fa-user fa-lg'></i>";
						}
						html +=	"</div>" +
									"<div id='userName'>" +
										"<h5 align='center'>"+comment.memNickname+"</h5>" +
									"</div>" +
								"</div>" +
								"<div id='reviewContent'> " +
									"<div id='scoreStar'>" +
										"<span class='setStar'>★★★★★" +
											"<span style='width:"+comment.cmtStar+"%'>★★★★★</span>"+
										"</span>" +
									"</div>" +
									"<div id='reviewText'>" +
										"<h5>"+comment.cmtContent+"</h5>";
						if("${loginUser.memNickname}" == comment.memNickname){
							html += "<button type='button' id='deleteComment' onclick='deleteReview("+comment.cmtNo+");'>삭제하기</button>";
						}
						html +=		"</div>"+
								"</div></div>";
						$("#writtenReview").html(html);
						starChange();
					}														
				}
			})
			
		}
		
		function starChange(){
			$.ajax({
				url : '${contextPath}/starChange.co',
				data : {conNo : '${c.conNo}'},
				success: function(result){
					let percent = 0;
			    	percent = result * 20 + '%';
					$("#scoreAvg").text("\u00A0\u00A0("+result+")");
					$('.setStarTitle>span').width(percent);
					console.log(percent);
				}
			})
		}
		
	function movePage(cno){	 		
		location.href = '${contextPath}/admin/contentUpdateForm.ad?conNo='+cno;	 	
	}
	
		
	function deleteContent(cno){
		Swal.fire({
    		icon: 'warning',
    		title: '컨텐츠를 삭제하시겠습니까?',
    		showCancelButton: true,
            confirmButtonColor: '#3085d6',
    		cancelButtonColor: '#d33',
            cancelButtonText: '취소',
            confirmButtonText: '확인'
        }).then((result) => {
    		if (result.isConfirmed) {
    			location.href = '${contextPath}/admin/contentDelete.ad?conNo='+cno; 	
    		}
        });
	 }   	
    	
    	
    </script>


</body>
</html>