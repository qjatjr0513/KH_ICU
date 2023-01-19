<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="c" value="${content}"/>
<c:set var="g" value="${genre }"/>
<c:set var="size" value="${fn:length(genre)}" />
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
		height: 250px;
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
  		float: left;
  	}
  	#submitBtn{
  		margin-bottom: 70px;
  		margin-left: 20px;
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
</style>
</head>
<body>
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

    <!-- animate.css -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <!-- 웹사이트에 아이콘 추가 -->
    <link rel="icon" type="image/png" href="resources/images/navbarLogo.png" />

    <!-- Font Awesome cdn -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- css -->
    <link rel="stylesheet" href="resources/css/04_enrollForm1.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
    
    <jsp:include page="../common/header.jsp"/>
    
    <div id="whole">
    	<div id="infoAndPoster">
	    	<div id="info">
	    	<br>
	    		<h2>&nbsp;&nbsp;${c.conKTitle}</h2>
	    		<h4>&nbsp;&nbsp;${c.conETitle}, ${c.conDate }</h4>
	    		<h4>&nbsp;&nbsp;★★★★★(미구현)</h4>
	    		<br>
	    		<h6>&nbsp;&nbsp;관람 연령 : ${c.conAge }</h6>
	    		<h6>&nbsp;&nbsp;장르 : 
		    		<c:forEach var="genre" items="${g }" varStatus="status">
		    			${genre }<c:if test="${status.count ne size}">, </c:if>
		    		</c:forEach>
	    		</h6>
	    		<c:if test="${c.conCategory eq '드라마'}">
	    			<h6>&nbsp;&nbsp;방영 회차 : ${c.conInfo }</h6>
	    		</c:if>
	    		<c:if test="${c.conCategory eq '영화'}">
	    			<h6>&nbsp;&nbsp;상영 시간 : ${c.conInfo }</h6>
	    		</c:if>
	    		<h6>&nbsp;&nbsp;방영 날짜 : ${c.conDate }</h6>
	    	</div>
	    	<div id="poster">
	    		<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
	    	</div>
    	</div>
    	
    	<div id="preview">
    		<iframe width="600" height="300" src="https://${c.conPreview }" title="YouTube video player" 
    		frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    	</div>
    	
    	<div id="info2">
    		<br>
	    	<h6>&nbsp;&nbsp;감독 : ${c.conDirector }</h6>
	    	<h6>&nbsp;&nbsp;배우 : ${c.conActor }</h6>
	    	<h6 class="wideLineHeight">&nbsp;&nbsp;줄거리 : ${c.conSynop }</h6>
    	</div>
    </div>
    <div id="reviewWrite">
    	<br>
    	<h6 id="average">평점</h6>
		<span class="star">
		★★★★★
		<span>★★★★★</span>
		<input type="range" name="score" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
		</span>
		<br><br>
		<div id="reviewInput">
			<textarea cols="70" rows="3" placeholder="내용을 입력해주세요" required></textarea>
			<button type="submit" id="submitBtn" class="btn btn-outline-primary btn-lg">제출</button>
		</div>
		
    </div>
	<div id="review">
		<div id="writtenReview">
			<div id="profileArea">
				<div id="profile">
					<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
				</div>
				<div id="userName">
					<h5 align="center">닉네임</h5>
				</div>
			</div>
			<div id="reviewContent">
				<div id="scoreStar">
					<span>★★★★★</span>
				</div>
				<div id="reviewText">
					<h5>리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰
					리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰</h5>
				</div>
			</div>
		</div>
	</div>
    <script>
    	 function drawStar(target){
	    	let percent = 0;
	    	percent = target.value * 10+'%';
	    	
	    	$('.star>span').width(percent);
	    	$('#average').text("평점 : "+target.value * 0.5+"점");	
	    	console.log(percent);
	    }
    	
    	$(function(){
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
					for(let comment of result){
						html += "<div id='profileArea'>" +
									"<div id='profile'>" +
										"<img src='https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png'>" +
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
					}														
				},error : function(req,sts,err){
					console.log(req);
					console.log(sts);
					console.log(err);
				} 
    		})
    	}
    </script>
</body>
</html>