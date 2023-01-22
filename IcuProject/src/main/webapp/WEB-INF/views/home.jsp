<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>ICU (I See You)</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/01_startPage.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="common/header.jsp"/>
    
    <!-- Home -->
    <section id="home">

      <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="first-box">

              <div class="head__left-box">
                <h1>
                  더 안전하고 안정적인 구독 생활. <br>
                  공동 구독 플랫폼 ICU에서.
                </h1>
                <br><br>
                <h3>
                  넷플릭스부터 애플TV까지. <br>
                  생활 속 모든 구독, ICU에서 만나보세요.
                </h3>
              </div>

              <div class="head__right-box">
                <div class="our-story-card-animation-container">
                  <img class="our-story-card-img" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/device-pile.png" data-uia="our-story-card-img">
                  <div class="our-story-card-animation" data-uia="our-story-card-animation">
                    <video class="our-story-card-video" data-uia="our-story-card-video" autoplay="" playsinline="" muted="" loop="">
                    <source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-devices.m4v" type="video/mp4"></video>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <div class="carousel-item">
            <div class="second-box">
              <div class="head__left-box2">
                  <h1>
                    원하는 컨텐츠를 편하게. <br>
                    다양한 플랫폼으로 부터.    
                  </h1>
                  <br><br>
                  <h3>
                    요즘 이런거 안쓰는 사람있어요? 없다니까요. <br>
                    ICU에서 책임지는 당신의 간편한 영화 & 드라마 보기.
                  </h3>
              </div>
              <div class="head__right-box2">
                <img src="resources/images/ipad-removebg-preview.png"> 
              </div>
            </div>            
          </div>

          <div class="carousel-item">
            <div class="third-box">
              <div class="head__left-box3">
                <h1>
                  파티장이 되어보세요! <br>
                  지금 파티원은 매칭 대기중 😊
                </h1>
                <br><br>
                <h3>
                  사장, 회장, 반장보다 ICU 파티장이 백만 배 쉽다구요.  <br>
                  파티만 만들면 귀찮은 건 ICU가 다 하니까요.
                </h3>
            </div>
            <div class="head__right-box3">
              <div class="imgBox">
                <img class="party-img1" src="resources/images/party.jpg" style="width:300px;">
                <img class="party-img2" src="resources/images/party.jpg" style="width:350px;">
              </div>
            </div>
            </div>
          </div>

        </div>
      </div>
    
    </section>

    <!-- 플랫폼 -->
    <section id="about" class="section section__container">

      <div class="about__majors jong">
        <div class="major">
          <div class="major__icon netfilx"></div>
          <h2 class="major__title">Netfilx</h2>
        </div>

        <div class="major">
          <div class="major__icon watcha"></div>
          <h2 class="major__title">Watcha</h2>
        </div>

        <div class="major">
          <div class="major__icon wavve"></div>
          <h2 class="major__title">Wavve</h2>
        </div>

        <div class="major">
          <div class="major__icon disney"></div>
          <h2 class="major__title">Disney +</h2>
        </div>
        <div class="major">
          <div class="major__icon appleTv"></div>
          <h2 class="major__title">Apple TV</h2>
        </div>
      </div>

      
      </div>
    </section>

    <br><br><br><br>

    <!-- 포인트 방식 자랑 -->
    <section id="point" class="section">
      <div class="section__container jong2">
        <div class="point__left-box">
          <h1>포인트 충전 방식을 통해 <br> 믿을 수 있는 안전한 거래!</h1>
          <br><br>
          <h3>
            월 단위 에스크로 시스템을 통해 금전 거래를 안전하게 보장하고, <br>
            매달 링키드 정산일에 파티 요금을 자동으로 정산해요.
          </h3>
        </div>
        
        <div class="point__right-box">
          <img src="resources/images/notebook-removebg-preview.png">
          <img src="resources/images/1532003027_QYUSBylXvQAnQe8G2Bwn7alMJyI5jmR9aXZLm5dt.jpeg">
        </div>

        
        
      </div>
    </section>

    <br>

    <!-- 세번째 설명할곳 -->
    <section id="info-protection" class="section">
      <div class="section__container jong3">

        <div class="protect__left-box">
          <img src="resources/images/notebook-removebg-preview.png">
          <img src="resources/images/ott.jpg">
        </div>

        <div class="protect__right-box">
          <h1>정보 보호, <br> ICU의 기본.</h1> 
          <br><br>
          <h3>
            ICU에서는 닉네임을 사용해서 개인정보 노출을 최소화 하고, <br>
            공유 로그인 정보는 안전하게 보호하고 있어요. <br>
            프라이버시 침해, ICU에서는 걱정 마세요.
          </h3>
        </div>
        
      </div>
    </section>    
    
	<!-- Contact  -->
    <jsp:include page="common/footer.jsp"/>
    
    <!-- javascript -->
    <!-- defer : html 파일이 파싱 되는동안 js 파일을 동시에 다운받아서 html 파싱이 다 되면 js를 실행함 -->
    <script src="resources/js/01_startPage.js" defer></script>
    <script src="resources/js/main.js" defer></script>
  </body>
</html>
