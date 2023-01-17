<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${list}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchContent{
		margin: auto;
		margin-top: 100px;
		width: 800px;
		height: 500px;
		font-size: 20px;
		font-weight: bold;
  	}
  	#whole{
	  	margin: auto;
		margin-top: 20px;
		width: 810px;
		height: 700px;
		border: 1px solid black;
  	}
  	#card{
  		margin: auto;
  		width: 200px;
		height: 350px;
		float: left;
  	}
  	tr, td{
  		padding: 15px;
  		margin: auto;
  	}
  	#poster{
  		width: 180px;
  		height: 230px;
  	}
  	.btn_netflix{
  		width: 100px;
  		height: 100px;
  	}
  	.btn_netflix>img{
  		width: 100%;
  		height: 100%;
  		border-radius: 50%;
  	}
  	#movie, #drama{
  		background-color: mediumorchid;
  		color: white;
  		border: none;
  	}
  	#info>h4, h5{
  		margin:auto;
  	}
</style>
</head>
<body>
<!-- bootstrap -->
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
	
	<table id="searchContent">
		<tr>
			<td></td>
			<td>
				<div class="d-grid gap-2">
					<button class="btn btn-outline-primary btn-lg" id="movie" name="movie">영화</button>
				</div>
			</td>
			<td></td>
			<td>
				<div class="d-grid gap-2">
					<button class="btn btn-outline-primary btn-lg" id="drama" name="drama">드라마</button>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<button class="btn_netflix">
					<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
				</button>
			</td>
			<td>
				<button class="btn_netflix">
					<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
				</button>
			</td>
			<td>
				<button class="btn_netflix">
					<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
				</button>
			</td>
			<td>
				<button class="btn_netflix">
					<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
				</button>
			</td>
			<td>
				<button class="btn_netflix">
					<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkEtR9%2FbtrgfMGHvbz%2FULwHeMTVRAhKiykodpkP6K%2Fimg.png">
				</button>
			</td>
		</tr>
		<tr>
			<td>장르 : </td>
		</tr>
		<tr>
			<td><input type="checkbox" name="genre" value="action">&nbsp;액션</td>
			<td><input type="checkbox" name="genre" value="drama">&nbsp;드라마</td>
			<td><input type="checkbox" name="genre" value="sf">&nbsp;SF</td>
			<td><input type="checkbox" name="genre" value="fantasy">&nbsp;판타지</td>
			<td><input type="checkbox" name="genre" value="romance">&nbsp;로맨스</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="genre" value="horror">&nbsp;공포</td>
			<td><input type="checkbox" name="genre" value="thriller">&nbsp;스릴러</td>
			<td><input type="checkbox" name="genre" value="family">&nbsp;가족</td>
			<td><input type="checkbox" name="genre" value="animation">&nbsp;애니메이션</td>
			<td><input type="checkbox" name="genre" value="comedy">&nbsp;코미디</td>
		</tr>
		<tr>
			<td>연령 제한 : </td>
		</tr>
		<tr>
			<td><input type="checkbox" name="age" value="all">&nbsp;모든 연령</td>
			<td><input type="checkbox" name="age" value="child">&nbsp;7세 이상</td>
			<td><input type="checkbox" name="age" value="teen">&nbsp;12세 이상</td>
			<td><input type="checkbox" name="age" value="teen2">&nbsp;15세 이상</td>
			<td><input type="checkbox" name="age" value="adult">&nbsp;19세 이상</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td>
				<div class="d-grid gap-2">
					<button class="btn btn-outline-primary btn-lg" id="search">검색</button>
				</div> 
			</td>
			<td colspan="2"></td>
		</tr>
	</table>
	

	<div id="whole">
		<c:forEach var="c" items="${list }">
			<div id="card">
				<img id="poster" onclick="movePage(${c.conNo });" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Question_mark_%28black%29.svg/1200px-Question_mark_%28black%29.svg.png">
				<div id="info" onclick="movePage(${c.conNo });">
					<h4 align="center">${c.conKTitle }</h4>
					<h5 align="center">(${ c.conDate})</h5>
					<h5 align="center">★★★★★</h5>
				</div>
			</div>
		</c:forEach>
	</div>

	<script>
		$(function() {
			let mvClicked = false;
			let drClicked = false;
			
			$('#movie').click(function(){
				console.log(mvClicked)
				if(mvClicked == false){
		    		$(this).css('background', 'plum');
		    		$('#drama').css('background', 'mediumorchid');
		    		mvClicked = true;
		    		drClicked = false;
				}
				else{
					$(this).css('background', 'mediumorchid');
					mvClicked = false;
				}		    	
		  	});
			
			$('#drama').click(function(){				
				if(drClicked == false){
		    		$(this).css('background', 'plum');
		    		$('#movie').css('background', 'mediumorchid');
		    		drClicked = true;
		    		mvClicked = false;
				}
				else{
					$(this).css('background', 'mediumorchid');
					drClicked = false;
				}
		  	});
		});
		
		function movePage(cno){
	 		location.href = '${contextPath}/detail?conNo='+cno;
	 	}
	</script>
</body>
</html>