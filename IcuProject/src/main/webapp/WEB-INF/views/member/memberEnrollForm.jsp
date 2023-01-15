<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 회원가입</title>
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
    <link rel="stylesheet" href="resources/css/05_enrollForm2.css" />

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

    <!-- 회원정보 입력 -->
    <form action="insert.me" method="post">
      <table>
        <tr>
          <td><label>이름</label></td>
          <td><input type="text" placeholder="사용자 이름" /></td>
          <td><label>&nbsp;&nbsp;생년월일</label></td>
          <td><input type="date" /></td>
        </tr>
        <tr>
          <td><label for="">아이디</label></td>
          <td><input type="text" placeholder="아이디" /></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              data-bs-toggle="modal"
              data-bs-target="#idModal"
            >
              중복확인
            </button>
          </td>
          <td></td>
        </tr>
        <tr>
          <td><label>닉네임</label></td>
          <td><input type="text" placeholder="닉네임" /></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              data-bs-toggle="modal"
              data-bs-target="#nickNameModal"
            >
              중복확인
            </button>
          </td>
          <td></td>
        </tr>
        <tr>
          <td><label>비밀번호</label></td>
          <td><input type="text" placeholder="비밀번호" /></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><label></label>비밀번호 확인</td>
          <td><input type="text" placeholder="비밀번호 확인" /></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><label>휴대폰 번호</label></td>
          <td><input type="text" placeholder="010-0000-0000" /></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              data-bs-toggle="modal"
              data-bs-target="#phoneModal"
            >
              인증번호 전송
            </button>
          </td>
          <td></td>
        </tr>
      </table>

      <div class="btn__group">
        <button type="reset">취소</button>
        <button type="submit">회원가입</button>
      </div>
    </form>

    <!-- 아이디 중복확인 모달창 -->
    <div
      class="modal fade"
      id="idModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              회원가입 - 아이디 중복확인
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">사용가능한 아이디 입니다!</div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
            <button type="button" class="btn btn-primary">확인</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 닉네임 중복확인 모달창 -->
    <div
      class="modal fade"
      id="nickNameModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              회원가입 - 닉네임 중복확인
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">사용가능한 닉네임 입니다!</div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
            <button type="button" class="btn btn-primary">확인</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 휴대폰 인증번호 전송 모달창 -->
    <div
      class="modal fade"
      id="phoneModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">휴대폰인증</div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
            <button type="button" class="btn btn-primary">확인</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>