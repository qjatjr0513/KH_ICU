<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티 상세조회</title>
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
    <link rel="stylesheet" href="resources/css/09_partyDetail.css" />

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

    <!-- header -->
    <section id="service-title">
      <div class="netfilx">
        <h2>넷플릭스</h2>
        <h4>제목 있을 뿐이다.</h4>
      </div>
      <div class="info__partyOwner">
        <i class="fa-solid fa-user fa-lg">&nbsp;파티장 닉네임</i>
        <span>파티번호 : 11111111</span>
      </div>
      <hr />
      <div class="info__date">
        <span>종료일자 : 2023/10/20 (100일)</span> <br />
        <span>금액 : 40000원</span>
        <button>참여 신청</button>
      </div>
    </section>
    <!-- User Profile -->
    <section id="userProfile">
      <div class="containerBox">
        <div class="photo-container">
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4>파티장 닉네임</h4>
              <span>2023.01.01 참여</span>
            </div>
          </div>
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4>닉네임</h4>
              <span>2023.01.01 참여</span>
            </div>
          </div>
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4>닉네임</h4>
              <span>2023.01.01 참여</span>
            </div>
          </div>
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4>닉네임</h4>
              <span>2023.01.01 참여</span>
            </div>
          </div>
        </div>
        <br />
      </div>
      <hr style="width: 50%; margin: auto" />
    </section>
    <br />
    <!-- 댓글 -->
    <section id="comment">
      <div class="comment__text">
        <textarea name="" id="" cols="60" rows="4"></textarea> &nbsp;
        <button>입력</button>
      </div>
      <hr />
      <div class="member__comment">
        <div class="first-box">
          <div class="member__photo">
            <div class="photoImg">
              <i class="fa-solid fa-user fa-2x"></i>
            </div>
            <h4>파티원</h4>
          </div>
          <div class="party__comment">
            <p>
              너무재밌어요! 정말 재밌어서 다시 한번 꼭 봐보고싶을 정도에요!
              너무재밌어요! 정말 재밌어서 다시 한번 꼭 봐보고싶을 정도에요!
              너무재밌어요! 정말 재밌어서 다시 한번 꼭 봐보고싶을 정도에요!
            </p>
          </div>
        </div>
        <br />
        <div class="first-box">
          <div class="member__photo">
            <div class="photoImg">
              <i class="fa-solid fa-user fa-2x"></i>
            </div>
            <h4>파티원</h4>
          </div>
          <div class="party__comment">
            <p>
              너무재밌어요! 정말 재밌어서 다시 한번 꼭 봐보고싶을 정도에요!
              너무재밌어요! 정말 재밌어서 다시 한번 꼭 봐보고싶을 정도에요!
              너무재밌어요! 정말 재밌어서 다시 한번 꼭 봐보고싶을 정도에요!
            </p>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>