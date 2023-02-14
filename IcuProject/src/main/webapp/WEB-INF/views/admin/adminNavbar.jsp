<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css?" />
    
    <style>
    a{
    	font-size:16px;
    }
	
	.imgBox{
		width:100%;
		height:100%;
		z-index:-999;
		position:absolute;
	background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
		opacity:0.8;
		box-shadow: 0 0 5px 1px gray;
	}
      .sidebar {
        position: fixed;
        top:77px;
        width: 20%;
        height: 1000px;
		padding-bottom:100px;
        font-size: 18px;
        z-index:1;
        transition: background 1s linear;
        font-family:'Poor Story', 'cursive';
      }

      .nav {
        position: relative;
        margin: 0 15%;
        text-align: right;
        top: 50%;
        transform: translateY(-50%);
        font-weight: bold;
      }

      .nav ul {
        list-style: none;
        margin-left:120px;
      }
      .nav ul li {
        position: relative;
      }
      .nav ul li a {
        line-height: 5em;
        text-transform: uppercase;
        text-decoration: none;
        letter-spacing: 0.4em;
        color:black;
        display: block;
        transition: all ease-out 200ms;
      }
     .nav ul li.active a {
        color: var(--color-orange);
      }
      .nav ul li:not(.active)::after {
        opacity: 0.2;
      }
      .nav ul li:not(.active):hover a {
        color: gray;
        font-weight:bold;
        transform:scale(1.1);
      }
      .nav ul li::after {
        content: '';
        position: absolute;
        width: 100%;
        height: 0.2em;
        background: black;
        left: 0;
        bottom: 0;
        background-color: white;
      }
      
    </style>
    
</head>
<body>
 
    
     <aside class="sidebar">
 	  
      <div class='imgBox'></div>
      <nav class="nav" style='top:47%;'>
        <ul>
          <li class='li1'><a href="${contextPath}/admin/memListForm.me">회원정보 조회</a></li>
          <li class='li2'><a href="${contextPath}/admin/memBlackListForm.me">블랙리스트 관리</a></li>
          <li class='li3'><a href="${contextPath }/admin/current.py">진행중인 파티</a></li>
          <li class='li4'><a href="${contextPath }/admin/end.py">종료된 파티</a></li>
          <li class='li5'><a href="${contextPath }/admin/contentListForm">컨텐츠 관리</a></li>
          <li class='li6'><a href="${contextPath }/admin/faqList.fq">FAQ 관리</a></li>
          <li class='li7'><a href="${contextPath }/admin/noticeList.bo">공지사항 관리</a></li>
          <li class='li8'><a href="${contextPath }/admin/payManageListForm.pe">결제 관리</a></li>
          <li class='li9'><a href="${contextPath }/chat/chatRoomList">실시간 문의</a></li>
        </ul>
      </nav>
      
    </aside>

    
	<script>
		const link =  document.location.href.split('/');
		/* console.log(link[4]);	 */
	
	
		if(link[5] == 'memListForm.me'){	
			$('.li1').addClass('active');	
		} else if(link[5] == 'memBlackListForm.me'){
			$('.li2').addClass('active');		
		} else if(link[5] == 'current.py') {
			$('.li3').addClass('active');	
		} else if(link[5] == 'end.py') {
			$('.li4').addClass('active');	
		} else if(link[5] == 'contentListForm') {
			$('.li5').addClass('active');	
		}else if(link[5] == 'faqList.fq'){
			$('.li6').addClass('active');
		}else if(link[5] == 'noticeList.bo'){
			$('.li7').addClass('active');
		} else if(link[5] == 'payManageListForm.pe') {
			$('.li8').addClass('active');
		} else {
			$('.li9').addClass('active');
		}
	</script>
    
    
    
</body>
</html>