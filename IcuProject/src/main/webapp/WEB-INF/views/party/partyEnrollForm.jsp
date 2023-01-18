<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티등록</title>
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
    <link rel="stylesheet" href="resources/css/07_enrollParty.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- sweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <!-- Navbar -->
    <nav id="navbar">
      <div class="navbar__logo">
        <a href="#">
          <img
            class="logoImg"
            src="resources/images/navbarLogo.png"
            alt="cloudLogo"
            width="150px"
          />
        </a>
      </div>

      <ul class="navbar__menu">
        <li class="navbar__menu__item active1" data-link="#home">파티만들기</li>
        <li class="navbar__menu__item">파티찾기</li>
        <li class="navbar__menu__item">컨텐츠 찾기</li>
        <li class="navbar__menu__item">자유게시판</li>
        <li class="navbar__menu__item">FAQ</li>
        &nbsp;&nbsp;
        <div class="dropdown">
          <button
            class="btn btn-secondary dropdown-toggle profile"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <i class="fa-solid fa-user fa-lg"></i>
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">사용자 닉네임</a></li>
            <li><a class="dropdown-item" href="#">마이페이지</a></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul>
        </div>
      </ul>
    </nav>

    <div class="header__title">
      <h2>파티 등록</h2>
    </div>
    <!-- 등록 섹션 -->
    <table class="enroll__party-table">
      <tr>
        <td>서비스</td>
        <td>
          <select name="" id="">
            <option value="넷플릭스">넷플릭스</option>
            <option value="왓챠">왓챠</option>
            <option value="웨이브">웨이브</option>
            <option value="디즈니 플러스">디즈니 플러스</option>
            <option value="애플TV">애플TV</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>서비스 가격</td>
        <td>17,000원</td>
      </tr>
      <tr>
        <td>제목</td>
        <td>
          <input type="text" placeholder="제목을 입력해주세요." />
        </td>
      </tr>
      <tr>
        <td>모집 인원</td>
        <td>
          <select name="" id="">
            <option value="">1명</option>
            <option value="">2명</option>
            <option value="">3명</option>
            <option value="">4명</option>
            <option value="">5명</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>계정</td>
        <td>
          <input type="text" placeholder="계정 아이디(이메일)" />
          <input type="text" placeholder="비밀번호" />
        </td>
      </tr>
      <tr>
        <td>계좌번호</td>
        <td>
          <input type="text" />
        </td>
      </tr>
      <tr>
        <td>진행 기간</td>
        <td>
          2023-01-01 ~ <input type="text" placeholder="종료일" />&nbsp; 예상기간
          : 80일
        </td>
      </tr>
      <tr>
        <td>참여 금액</td>
        <td>1인당 1일 142원</td>
      </tr>
      <tr>
        <td>예상 금액</td>
        <td>11,360원</td>
      </tr>
    </table>

    <div class="btnGroup">
      <button>초기화</button>
      <button>등록</button>
    </div>
  </body>
</html>