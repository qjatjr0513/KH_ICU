<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="c" value="${content}"/>
<c:set var="g" value="${genre }"/>
<c:set var="size" value="${fn:length(genre)}" />
<c:set var="memNo" value="${memNo }"/>
<c:set var="memId" value="${memId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  	#whole{
	  	margin: auto;
		margin-top: 100px;
		width: 800px;
		height: 1000px;
		border: 2px solid black;
  	}
  	#infoAndPoster{
  		width: 100%;
  		height: 40%;
  	}
  	#info{
  		width: 60%;
  		height: 100%;
  		float: left;
  	}
  	#poster{
  		width: 40%;
  		height: 100%;
  		float: left;
  	}
  	#poster>img{
  		width: 80%;
  		height: 80%;
  		margin-top: 30px;
  		margin-left: 30px;
  	}
  	#preview{
  		width: 80%;
  		height: 35%;
  		margin-left: 80px;
  	}
  	#preview>iframe{
  		margin-top: 20px;
  	}
  	#info2{
  		width: 100%;
  		height: 25%;
  	}
  	.wideLineHeight {
		line-height: 1.8;
	}
	#reviewWrite{
	  	margin: auto;
		width: 800px;
		height: 200px;
  	}
  	.star {
	    position: relative;
	    font-size: 2rem;
	    color: #ddd;
	}
	.star input {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    left: 0;
	    opacity: 0;
	    cursor: pointer;
	}  
	.star span {
	    width: 0;
	    position: absolute; 
	    left: 0;
	    color: red;
	    overflow: hidden;
	    pointer-events: none;	
	}
	.setStar {
    	position: relative;
    	font-size: 2rem;
    	color: #ddd;
	}
	.setStar span {
    	width: 0;
    	position: absolute; 
    	left: 0;
    	color: red;
    	overflow: hidden;
    	pointer-events: none;
	}
	
  	textarea{
  		resize: none;
  	}
  	#reviewInput{
  		height: 100px;
  		float: left;
  		margin-bottom: 20px;
  	}
  	#submitBtn{
  		width: 100px;
  		height: 100px;
  		margin-bottom: 90px;
  	}
  	#review{
  		margin: auto;
  		width: 800px;
  		height: 600px;
  	}
  	#writtenReview{
  		margin-top: 10px;
  		width: 90%;
  		height: 120px;
  	}
  	#profileArea{
  		width: 15%;
  		height: 100%;
  		margin-bottom: 20px;
  		float: left;
  	}
  	#reviewContent{
  		width: 80%;
  		height: 100%;
  		margin-bottom: 20px;
  		float: right;
  	}
  	#profile{
  		width: 100%;
  		height: 80%;
  	}
  	#profile>img{
  		width: 100%;
  		height: 100%;
  		border-radius: 50%;
  	}
  	#userName{
  		width: 100%;
  		height: 20%;
  	}
  	#scoreStar{
  		width: 100%;
  		height: 40%;
  	}
  	#reviewText{
  		margin-top: 20px;
  		width: 100%;
  		height: 55%;
  	}
  	.setStarTitle {
    	position: relative;
    	font-size: 2rem;
    	color: #ddd;
	}
	.setStarTitle span {
    	width: 0;
    	position: absolute; 
    	left: 0;
    	color: red;
    	overflow: hidden;
    	pointer-events: none;
	}
</style>
	<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />>
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
	    			<h6>&nbsp;&nbsp;관람 연령 : ${c.conAge }세 미만 관람 불가</h6>
	    		</c:if>
	    		<c:if test="${c.conAge eq 0}">
	    			<h6>&nbsp;&nbsp;관람 연령 : 전체이용가</h6>
	    		</c:if>
	    		<h6>&nbsp;&nbsp;장르 : 
		    		<c:forEach var="genre" items="${g }" varStatus="status">
		    			${genre }<c:if test="${status.count ne size}">, </c:if>
		    		</c:forEach>
	    		</h6>
	    		<c:if test="${c.conCategory eq 2}">
	    			<h6>&nbsp;&nbsp;방영 회차 : ${c.conInfo }부작</h6>
	    		</c:if>
	    		<c:if test="${c.conCategory eq 1}">
	    			<h6>&nbsp;&nbsp;상영 시간 : ${c.conInfo }분</h6>
	    		</c:if>
	    		<h6>&nbsp;&nbsp;방영 날짜 : ${c.conDate }</h6>
	    	</div>
	    	<div id="poster">
	    		<c:if test="${c.filePath eq '' or c.filePath eq null}">
					<img src="${c.filePath}${c.changeName}"/>
				</c:if>
				<c:if test="${c.filePath ne '' and c.filePath ne null}">
					<img src="${contextPath}/${c.filePath}${c.changeName}"/>
				</c:if>
	    	</div>
    	</div>
    	
    	<div id="preview">
    		<iframe width="600" height="300" src="${c.conPreview }" title="YouTube video player" 
    		frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    	</div>
    	
    	<div id="info2">
    		<br>
	    	<h6>&nbsp;&nbsp;감독 : ${c.conDirector }</h6>
	    	<h6>&nbsp;&nbsp;배우 : ${c.conActor }</h6>
	    	<h6 class="wideLineHeight">&nbsp;&nbsp;줄거리 : ${c.conSynop }</h6>
	    	<c:if test="${memId eq 'admin'}">
	    		<button type="submit" id="updateBtn" class="btn btn-outline-primary btn-lg" onclick="movePage(${c.conNo});">수정하기</button>
	    		<button type="submit" id="deleteBtn" class="btn btn-outline-primary btn-lg" onclick="deleteContent(${c.conNo});">삭제하기</button>
	    	</c:if>
    	</div>
    	
    </div>
    <div id="reviewWrite">
    	<br>
    	<c:if test="${memNo ne 0 }">
	    	<h6 id="average">평점</h6>
			<span class="star">
			★★★★★
			<span>★★★★★</span>
			<input type="range" id="score" name="score" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
			</span>
		</c:if>
		<br><br>
		<div id="reviewInput">
			<c:if test="${memNo ne 0 }">
				<textarea cols="75" rows="4" id="cmtContent" placeholder="내용을 입력해주세요" required></textarea>
				<button type="submit" id="submitBtn" class="btn btn-outline-primary btn-lg" onclick="insertReview();">작성</button>
			</c:if>
			
			<c:if test="${memNo eq 0 }">
				<textarea cols="75" rows="4" placeholder="로그인 후 이용해주세요" disabled></textarea>
				<button type="submit" id="submitBtn" class="btn btn-outline-primary btn-lg" disabled>작성</button>
			</c:if>
		</div>
		
    </div>
	<div id="review">
		<div id="writtenReview">
			<div id="reviewContent">
				<div id="reviewText">
					<h5>작성된 리뷰가 존재하지 않습니다</h5>
				</div>
			</div>
		</div>
	</div>
    <script>
		function movePage(cno){
	 		location.href = '${contextPath}/contentUpdateForm?conNo='+cno;
	 	}
		function deleteContent(cno){
			if(confirm('컨텐츠를 삭제하시겠습니까?') == true){
	 			location.href = '${contextPath}/contentDelete?conNo='+cno;
			}
			else{
				return false;
			}
	 	}
    	 function drawStar(target){
	    	let percent = 0;
	    	percent = target.value * 10+'%';
	    	
	    	$('.star>span').width(percent);
	    	$('#average').text("평점 : "+target.value * 0.5+"점");	
	    	console.log(percent);
	    }
    	
    	$(function(){
    		starChange();
    		selectReview();
		});
    	
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
						html += "<div id='profileArea'>" +
									"<div id='profile'>" +
										"<img src='"+${contextPath}/+comment.filePath+comment.changeName+"'>" +
									"</div>" +
									"<div id='userName'>" +
										"<h5 align='center'>"+comment.memNickname+"</h5>" +
									"</div>" +
								"</div>" +
								"<div id='reviewContent'>" +
									"<div id='scoreStar'>" +
										"<span class='setStar'>★★★★★" +
											"<span style='width:"+comment.cmtStar+"%'>★★★★★</span>"+
										"</span>" +
									"</div>" +
									"<div id='reviewText'>" +
										"<h5>"+comment.cmtContent+"</h5>"+
									"</div>"+
								"</div>";
						$("#writtenReview").html(html);
						starChange();
					}														
				},error : function(req,sts,err){
					console.log(req);
					console.log(sts);
					console.log(err);
				} 
    		})
    		
    	}
    	
    	function insertReview(){
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
    </script>
</body>
</html>