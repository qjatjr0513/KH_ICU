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
    <link rel="stylesheet" href="resources/css/25_memberDeleteForm.css" />

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
  <div id="main__logo">
	<h2>회원탈퇴</h2>
  <hr><br>
  </div>

  <div id="whole">
    <div id="content">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br><br>
      
      <i class="fa-solid fa-check"></i>&nbsp;&nbsp;사용하고 계신 아이디(<span style="color:#004643;" ><b>${loginUser.memId}</b></span>)는 탈퇴할 경우 재 사용 및 복구가 불가능 합니다.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <span style="color: #f25042;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가능하오니 신중하게 선택하시기 바랍니다.</span><br><br>

      <i class="fa-solid fa-check"></i>&nbsp;&nbsp;탈퇴 후 회원 정보 및 서비스 이용 기록은 모두 삭제됩니다.<br>

      <i class="fa-solid fa-check"></i>&nbsp;&nbsp;탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      삭제를 원하는 게시글이 있다면
      <span style="color: #f25042;">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span><br><br>

      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <span style="color: #f25042;">탈퇴 후에는 아이디 <span style="color:#004643;" ><b>${loginUser.memId}</b></span>로 다시 가입할 수 없으며
      아이디와 데이터는 복구할 수 없습니다.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</span>
      <br><br>
      <!-- Button trigger modal -->
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        확인
      </button>
    </div>
    <br>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="memberDelete" action="${contextPath }/memDelete.me" method="post">
              <label>비밀번호 입력 : </label>
              <input type="password" id="memPwd" placeholder="비밀번호" name="memPwd" required/>
              <!-- <input type="hidden" id="memPwdCheck" value="${member.getMemPwd}"/> -->
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
            <button type="button" class="btn btn-primary" onclick="btnDelete();" name="delete">확인</button>
          </div>
        </div>
      </div>
    </div>
  </div>


</body>
<script> 
  $(function(){
    if('${flag}' == 'showAlert'){
      Swal.fire({
            icon:'error',
            title: "비밀번호가 일치하지 않습니다."
        });
    }
  });
  
  $(function(){
    if('${flag3}' == 'showAlert3'){
      Swal.fire({
            icon:'error',
            title: "회원 탈퇴 실패하였습니다."
        });
    }
  });
  
  function btnDelete(){
    
    if($('input[name=memPwd]').val() == ""){
           Swal.fire({
              icon: 'error',
              title: '비밀번호를 입력해주세요.'                  
          });
    } else {
      Swal.fire({
              title: '회원탈퇴는 되돌릴 수 없습니다<br>탈퇴하시겠습니까?',
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              cancelButtonText: '취소',
              confirmButtonText: '탈퇴'
          }).then((result) => {
              if (result.isConfirmed) {
                $("#memberDelete").submit();
                  
              }
          });
    }
    
   }
  
  </script>
</html>