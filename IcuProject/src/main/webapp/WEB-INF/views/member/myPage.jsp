<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    <link rel="stylesheet" href="resources/css/myPage.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- Alert 창  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
	<!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>

    <div id="whole">
      <div id="imgAndInfo">
        <div id="viewAndEnroll">
          <div id="view" class="titleImg">
          <!-- 올린 파일이 들어가는 자리 -->

          </div>
          <div id="enroll">
            <form id="enrollForm" action="${contextPath }/insertImg.me" encType="multipart/form-data" method="post">
              <button type="submit" id="upfile" class="form-control" name="upfile">사진등록</button>
              <input type="hidden" name="originName" value="${m.originName }"/>
			  <input type="hidden" name="changeName" value="${m.changeName }"/>
            </form>
          </div>
        </div>
        <div id="info">
          <h4><input type="text" name="memNickname" value="${loginUser.memNickname}"/></h4><br>
          아이디 : <input type="text" name="memId" value="${loginUser.memId}"><br><br>
          이름   : <input type="text" name="memName" value="${loginUser.memName}"><br><br>
          연락처 : <input type="text" name="phone" value="${loginUser.phone}"><br><br>
          이메일 : <input type="text" name="email" value="${loginUser.email}"><br><br>
          가입일 : <input type="text" name="enrolldate" value="${loginUser.enrollDate}"><br><br>
        </div>
        <br>
      </div>
      <div id="updateButton">
        <a class="btn" href="${contextPath}/memUpdate.me">정보 수정</a>
      </div>
      
    </div>

    <script>
    function loadImg(inputFile, num){
      if(inputFile.files.length != 0){

          let reader = new FileReader();
          reader.readAsDataURL(inputFile.files[0]);
          
          // 파일 읽기가 완료되었을때 실행할 함수 정의
          reader.onload = function(e){
              $(".titleImg").attr("src",e.target.result);
          }
      }
    }
    </script>
</body>
</html>