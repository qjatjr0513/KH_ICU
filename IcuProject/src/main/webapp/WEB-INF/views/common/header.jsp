<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU 헤더</title>
<!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
    
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
      integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
      integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
      integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

 <script src="https://cdn.jsdelivr.net/npm/modaal@0.4.4/dist/js/modaal.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/modaal@0.4.4/dist/css/modaal.min.css" rel="stylesheet" />

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
    <link rel="icon" type="image/png" href="${contextPath }/resources/images/navbarLogo.png" />

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
    <link href="https://fonts.googleapis.com/css?family=Poor+Story:400" rel="stylesheet">

    <!-- css -->
    <link rel="stylesheet" href="${contextPath }/resources/css/main.css" />
	<link rel="stylesheet" href="${contextPath }/resources/css/chat.css" />
    

    <!-- sweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
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
      <c:if test="${loginUser.role != 'A'}">
        <li class="navbar__menu__item active1">
           <span onclick="partyEnroll();" style="text-decoration: none; color:black;">파티만들기</span></li>
        <li class="navbar__menu__item" data-link="#about">
            <a href="${contextPath }/findPartyForm.py" style="text-decoration: none; color:black;">파티찾기</a></li>
        <li class="navbar__menu__item">
           <a href="${contextPath }/contentList.co" style="text-decoration: none; color:black;">컨텐츠 찾기</a></li>
        <li class="navbar__menu__item">
           <a href="${contextPath }/list.bo" style="text-decoration: none; color:black;">자유게시판</a></li>
        <li class="navbar__menu__item">
        <a href="${contextPath }/faq.fq" style="text-decoration: none; color:black;">FAQ</a></li>
        
        &nbsp;
       
        </c:if>
        <c:choose>
           <c:when test="${ empty loginUser }">
           <!-- 로그인 전 -->
           <li class="navbar__menu__item">
                <a href="${contextPath }/loginForm" style="text-decoration: none; color:black; margin-top:16px;">로그인</a>
             </li>
             </c:when>
             <c:when test="${ loginUser.role == 'A' }">
           <!-- 로그인 후 -->
             <li>
                <a href="${contextPath }/admin/memListForm.ad" style="text-decoration: none; color:black; margin-right:30px;">관리자 페이지</a>
             </li>
             
              <li>
                <a href="${contextPath }/memLogout" style="text-decoration: none; color:black; margin-right:30px;">로그아웃</a>
             </li>
             </c:when>
             <c:otherwise>
             <li class='navbar__icon'>
                <div class="dropdown">
                <button
                  class="btn btn-secondary profile"
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
                  <li><span class="dropdown-item firstItem">${loginUser.memNickname}</span></li>
                  <li><a class="dropdown-item" href="${contextPath }/myPage.me">마이페이지</a></li>
                  <li><a class="dropdown-item" href="${contextPath }/memLogout">로그아웃</a></li>
                </ul>
              </div>
             </li>
             &nbsp;&nbsp;
             <li class='navbar__icon'>
              <div class="dropdown">
              <button class="btn btn-secondary alert" id="alarm" type="button" data-bs-toggle="dropdown"  aria-expanded="false">
                <i class="fa-solid fa-bell fa-lg"></i>
                <div id="count">

                </div>
              </button>
              <ul class="dropdown-menu" id="msg2">

              </ul>
            </div>
            </li>
             </c:otherwise>
          </c:choose>
        
      </ul>

    </nav>
		<div class="toast-container position-fixed bottom-0 end-0 p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
		  <div class="toast-header" style="background-color:#dee2e6">
		    <img src="${contextPath }/resources/images/navbarLogo.png" width="50" class="rounded me-2">
		    <strong class="me-auto">알림</strong>
		    <small class="text-muted"></small>
		    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		  </div>
		  <div class="toast-body" style="background-color:#f8f9fa;text-align: center; border-bottom-left-radius: inherit; border-bottom-right-radius: inherit;">
		  </div>
		</div>
		</div>
   
   
    <!-- sockjs  -->
   <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
   <script>
      var socket = null;
      const contextPath = "${contextPath}";
	  let chatWs;
      
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
             let $liveToast =  $('.toast-body');
             let $currentTime =  $('.text-muted');
            $liveToast.html(event.data);
            $currentTime.html(time());
            const toastLiveExample = document.getElementById('liveToast')
            const toast = new bootstrap.Toast(toastLiveExample)

      	    toast.show();
         };
         
         ws.onclose = function (event) { 
            console.log('Info: connection closed.');
         };
         ws.onerror = function (err) { console.log('Error:;', err);};
         
      }

	   
      $(document).ready(function(){
    	$.ajax({
       		url : "${contextPath }/alarm",
       		type: 'POST',
       		dataType: 'json',      // 호출 했을 때 결과타입
			contentType: "application/json",
               success : function(alist){
            	   
            	   //location.reload();
            	   // list로 반복문 돌려서 동적으로 html요소추가
            	   var html = "";
            	   var al ="";
            	   
            	   if(alist.length == 0){
            		   html += "<li><div id='none'><span>알림이 없습니다.</span><div></li>";
            		   $("#msg2").html(html);
            	   }else{
	            	   for(let a of alist){
	            		let tableCd = a.tableCd;
	      				
	      				if($.trim(tableCd) == "B"){
			            	html +="<li><a class='dropdown-item' href='"+contextPath+"/detail/"+a.refTno+"?mesNo="+a.mesNo+"'>"+a.mesContent+"</a><li>"; 
			            	al += '<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle"><span class="visually-hidden">New alerts</span></span>'
	      				}else if($.trim(tableCd) == "P"){
	      					html +="<li><a class='dropdown-item' href='"+contextPath+"/partyDetail.py/"+a.refTno+"?mesNo="+a.mesNo+"'>"+a.mesContent+"</a><li>";
	      					al += '<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle"><span class="visually-hidden">New alerts</span></span>'
	      				}else if($.trim(tableCd) == "A"){
	      					html +="<li><a class='dropdown-item' href='"+contextPath+"/depositListForm.pe?mesNo="+a.mesNo+"'>"+a.mesContent+"</a><li>"; 
	      					al += '<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle"><span class="visually-hidden">New alerts</span></span>'
	      				}else{
	      					html +="<li><a class='dropdown-item' href='"+contextPath+"/main?mesNo="+a.mesNo+"'>"+a.mesContent+"</a><li>";
	      					al += '<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle"><span class="visually-hidden">New alerts</span></span>'
	      				}
	      				$("#count").html(al);
	      				$("#msg2").html(html);
	            	   } 
            	   }
                   
               },	
               error : function(){
            	   console.log("에러");
                }
           })
      	});
      
      	var time = function () {
      	  var date = new Date();
      	  var hh =  addZero(date.getHours());
      	  var mm =  addZero(date.getMinutes());
      	  var apm = hh > 12 ? '오후' : '오전';
      	  var ct = apm + ' ' + hh + ':' + mm + '';
      	  return ct;
      	}; 
     
		function partyEnroll(){
			if(${loginUser.bkStatus == 'N'}){
	 			location.href = "${contextPath }/partyEnroll.py";
			}else{
				Swal.fire({
    	            icon:'error',
    	            title: "파티만들기가 제한되었습니다.",
    	            text:"관리자에게 문의하세요."
    	        });
			}
			
			if(${loginUser == null}){
				Swal.fire({
    	            icon:'error',
    	            title: "로그인 후 이용가능합니다."
    	        });
			}
	 	};
    	   
   </script>
   <script src="${contextPath }/resources/js/main.js" defer></script>
</body>
</html>