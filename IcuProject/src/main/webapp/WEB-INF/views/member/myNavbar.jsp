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
      <nav class="nav">
        <ul>
          <li class='li1'><a href="${contextPath}/myPage.me">회원정보 수정</a></li>
          <li class='li2'><a href="${contextPath}/memDeleteForm.me">회원탈퇴</a></li>
          <li class='li3'><a href="${contextPath }/CurrentParty.py">참여중인 파티</a></li>
          <li class='li4'><a href="${contextPath }/LastParty.py">참여했던 파티</a></li>
          <li class='li5'><a href="${contextPath }/myPayListForm.pe">결제 내역</a></li>
          <li class='li6'><a href="${contextPath }/depositListForm.pe">입금 내역</a></li>
        </ul>
      </nav>
      
    </aside>

    
	<script>
		const link =  document.location.href.split('/');
	
	
		if(link[3] == 'myPage.me'){	
			
			$('.li1').addClass('active');	
		} else if(link[3] == 'memDeleteForm.me'){
			$('.li2').addClass('active');		
		} else if(link[3] == 'CurrentParty.py') {
			$('.li3').addClass('active');	
		} else if(link[3] == 'LastParty.py') {
			$('.li4').addClass('active');	
		} else if(link[3] == 'myPayListForm.pe') {
			$('.li5').addClass('active');	
		}else{
			$('.li6').addClass('active');
		}		
	</script>
</body>
</html>