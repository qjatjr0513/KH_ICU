<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티찾기</title>
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
    <link rel="icon" type="image/png" href="../image/navbarLogo.png" />

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
    <link rel="stylesheet" href="../css/08_findParty.css" />

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
            src="../image/navbarLogo.png"
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

    <section id="about" class="section section__container">
      <div class="about__majors">
        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon netfilx"></div>
          </button>
          <h2 class="major__title">Netfilx</h2>
        </div>

        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon watcha"></div>
          </button>
          <h2 class="major__title">Watcha</h2>
        </div>

        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon wavve"></div>
          </button>
          <h2 class="major__title">Wavve</h2>
        </div>

        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon disney"></div>
          </button>
          <h2 class="major__title">Disney +</h2>
        </div>
        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon appleTv"></div>
          </button>
          <h2 class="major__title">Apple TV</h2>
        </div>
      </div>
    </section>

    <!-- 이용기간 -->
    <section id="periodOfUse">
      <div class="periodOfUse-container">
        <p>이용기간(개월)</p>
        <input type="range" value="0" /> <br />
        <button>검색</button>
      </div>
    </section>

    <!-- 파티 카드 -->
    <section id="party__container">
      <div
        id="carouselExampleControls"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="100000">
            <div class="partyCard">
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
            </div>

            <br />

            <div class="partyCard">
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
            </div>
          </div>
          <div class="carousel-item" data-bs-interval="100000">
            <div class="partyCard">
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
            </div>
            <br />
            <div class="partyCard">
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
            </div>
          </div>
          <div class="carousel-item" data-bs-interval="100000">
            <div class="partyCard">
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
            </div>
            <br />
            <div class="partyCard">
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>넷플릭스</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
              <div class="cardBox">
                <h4>${casdfasdf}</h4>
                <span>있으며 인생을 풍부하게</span> <br />
                <span>2023.10.10까지 (100일)</span> <br /><br />
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                <span><i class="fa-regular fa-user fa-lg"></i></span>
                <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                <button class="joinBtn">참여하기</button>
              </div>
            </div>
          </div>
        </div>

        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </section>

    <script src="../javascript/08_findParty.js"></script>
  </body>
</html>