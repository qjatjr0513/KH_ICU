<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU 헤더</title>
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
    <link rel="stylesheet" href="${contextPath }/resources/css/main.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- sweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
    <!-- Toastr -->
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <style>
      #profile-img{
        vertical-align: middle;
        width: 200%;
        height: 150%;
        border-radius: 50%;
        left: -52%;
        position: relative;
        top: -21%;
      }
    </style>
</head>
<body>
	
	<!-- Navbar -->
    <nav id="navbar">
      <div class="navbar__logo">
        <a href="${contextPath }/main">
          <img class="logoImg" src="${contextPath }/resources/images/navbarLogo.png" alt="cloudLogo" width="150px">
        </a>
      </div>
      <ul class="navbar__menu">
      <c:if test="${loginUser.memId != 'admin'}">
        <li class="navbar__menu__item active1" data-link="#home">
        	<a href="${contextPath }/partyEnroll.py" style="text-decoration: none; color:black;">파티만들기</a></li>
        <li class="navbar__menu__item" data-link="#about">
        	 <a href="${contextPath }/findParty.py" style="text-decoration: none; color:black;">파티찾기</a></li>
        </li>
        <li class="navbar__menu__item" data-link="#skills">
           <a href="${contextPath }/contentList.co" style="text-decoration: none; color:black;">컨텐츠 찾기</a>
        </li>

        <li class="navbar__menu__item" data-link="#work">
        	<a href="${contextPath }/chat/chatRoomList" style="text-decoration: none; color:black;">실시간 문의</a>
        	</li>
        <li class="navbar__menu__item">
        	<a href="${contextPath }/list.bo" style="text-decoration: none; color:black;">자유게시판</a></li>
        <li class="navbar__menu__item">
        <a href="${contextPath }/faq.fq" style="text-decoration: none; color:black;">FAQ</a></li>
        &nbsp;&nbsp;
        <li>
        </c:if>
        <c:choose>
        	<c:when test="${ empty loginUser }">
        	<!-- 로그인 전 -->
          		<a href="${contextPath }/loginForm.me" style="text-decoration: none; color:black;">로그인</a>
          	</c:when>
          	<c:when test="${ loginUser.memId == 'admin' }">
        	<!-- 로그인 전 -->
          		<a href="${contextPath }/logout.me" style="text-decoration: none; color:black;">로그아웃</a>
          	</c:when>
          	<c:otherwise>
          		<div class="dropdown">
		          <button
		            class="btn btn-secondary dropdown-toggle profile"
		            type="button"
		            data-bs-toggle="dropdown"
		            aria-expanded="false"
		          >
              <c:choose>
                <c:when test="${!empty profile}">
                  <img id="profile-img" class='view-img' src="${contextPath }${profile.filePath }${profile.changeName}">
                </c:when>
                <c:otherwise>
                  <i class="fa-solid fa-user fa-lg"></i>
                </c:otherwise>
              </c:choose>
		          </button>
		          <ul class="dropdown-menu">
		            <li><span class="dropdown-item">${loginUser.memNickname}</span></li>
		            <li><a class="dropdown-item" href="${contextPath }/myPage.me">마이페이지</a></li>
		            <li><a class="dropdown-item" href="${contextPath }/logout.me">로그아웃</a></li>
		          </ul>
		        </div>
          	</c:otherwise>
          </c:choose>
        </li>
      </ul>
      <!-- Toggle button -->
      <button class="navbar__toggle-btn">
        <i class="fa-solid fa-bars"></i>
      </button>
    </nav>
      <!-- <div id="socketAlert" class="alert alert-success" role="alert" style="display:none; margin-top:90px;"></div> -->
    <!-- sockjs  -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
		var socket = null;
		const contextPath = "${contextPath}";
		
		$(document).ready(function(){
			connectWS();
		});
		
		function connectWS(){
			var ws = new SockJS(contextPath+"/alram");
			socket = ws;
			
			ws.onopen = function(){ // 커넥션이 연결되면 실행
				console.log('Info: connection opend.');
				
			};
			
			ws.onmessage = function (event){
				console.log("ReceiveMessage:", event.data+'\n');
				/* let $socketAlert =  $('div#socketAlert');
				$socketAlert.html(event.data);
				$socketAlert.css('display', 'block');
				
				setTimeout( function(){
					$socketAlert.css('display', 'none');
				}, 5000);*/
				
				toastr.options = {
						"closeButton": false,
						  "debug": false,
						  "newestOnTop": false,
						  "progressBar": true,
						  "positionClass": "toast-bottom-right",
						  "preventDuplicates": false,
						  "onclick": null,
						  "showDuration": "100",
						  "hideDuration": "1000",
						  "timeOut": "5000",
						  "extendedTimeOut": "5000",
						  "showEasing": "swing",
						  "hideEasing": "linear",
						  "showMethod": "fadeIn",
						  "hideMethod": "fadeOut"
	                  };
				toastr.options.onclick = function() { location.href="${contextPath}/list.bo" }
				toastr.success(event.data);
			};
			
			ws.onclose = function (event) { 
				console.log('Info: connection closed.');
				//setTimeout(function(){ connect();}, 1000); // retry connection()!!
			};
			ws.onerror = function (err) { console.log('Error:;', err);};
			
		}
		
	</script>
</body>
</html>