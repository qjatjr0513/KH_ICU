<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU (I See You)</title>


    <!-- css -->
    <link rel="stylesheet" href="resources/css/02_mainPage.css" />

    
</head>
<body>
<div>
    <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

     <!-- mainForm -->
     <!-- input, carousel -->

     <section id="home">
       <div class="input-group mb-3 sizing">
         <input
           type="text"
           class="formControl"
           placeholder="내용을 입력해주세요."
           aria-label="Recipient's username"
           aria-describedby="button-addon2"
         />
         <button
           class="btn btn-outline-secondary btn3"
           type="button"
           id="button-addon2"
         >
           <i class="fa-solid fa-magnifying-glass fa-lg"></i>
         </button>
       </div>

       <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel" >
         <div class="carousel-indicators">
           <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
           <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="1" aria-label="Slide 2"></button>
           <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="2" aria-label="Slide 3"></button>
         </div>

         <div class="carousel-inner">
           <div class="carousel-item active">
             <div class="first-box">
               <div class="head__left-box">
                 <h2>
                   더 안전하고<br />
                   안정적인 구독 생활. <br />
                   공동 구독 플랫폼 ICU에서.
                 </h2>
                 <br />
                 <h3>
                   넷플릭스부터 애플TV까지. <br />
                   생활 속 모든 구독, ICU에서 만나보세요.
                 </h3>
               </div>

               <div class="head__right-box">
                 <div class="our-story-card-animation-container">
                   <img
                     class="our-story-card-img"
                     src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/device-pile.png"
                     data-uia="our-story-card-img"
                   />
                   <div
                     class="our-story-card-animation"
                     data-uia="our-story-card-animation"
                   >
                     <img class="img-popcorn" src="resources/images/popcorn.jpg" />
                   </div>
                 </div>
               </div>
             </div>
           </div>

	           <div class="carousel-item">
             <div class="second-box">
               <div class="head__left-box2">
                 <h2>
                   원하는 컨텐츠를 편하게. <br />
                   다양한 플랫폼으로 부터.
                 </h2>
                 <br /><br />
                 <h3>
                   요즘 이런거 안쓰는 사람있어요? 없다니까요. <br />
                   ICU에서 책임지는 당신의 간편한 <br />영화 & 드라마 보기.
                 </h3>
               </div>
               <div class="head__right-box2">
                 <img src="resources/images/ipad-removebg-preview.png" />
               </div>
             </div>
           </div>

           <div class="carousel-item">
             <div class="third-box">
               <div class="head__left-box3">
                 <h2>
                   파티장이 되어보세요! <br />
                   지금 파티원은 매칭 대기중 😊
                 </h2>
                 <br /><br />
                 <h3>
                   사장, 회장, 반장보다 ICU 파티장이 백만 배 쉽다구요. <br />
                   파티만 만들면 귀찮은 건 ICU가 다 하니까요.
                 </h3>
               </div>
               <div class="head__right-box3">
                 <div class="imgBox">
                   <img class="party-img1" src="resources/images/party.jpg" />
                   <img class="party-img2" src="resources/images/party.jpg" />
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
     </section>

     <!-- 파티찾기, 파티만들기 -->
     <section id="party">
      <h2>나의 파티</h2>
       <div class="party__box">
         <div class="party__box-left" onclick="location.href='${contextPath}/partyEnroll.py'">
           <div class="plus-icon">
             <i
               class="fa-regular fa-square-plus fa-2x"
               style="color: var(--color-purple)"
             ></i>
           </div>
           <div class="party__text">
             <h3>파티 만들기</h3>
             <span><b>팀을 위한 파티장이 되어보세요!</b></span>
           </div>
           <div class="party__makeParty">
             <span
               >파티 만들기&nbsp;<i class="fa-regular fa-circle-right"></i
             ></span>
           </div>
         </div>
         <div class="party__box-right" onclick="location.href='${contextPath}/findParty.py'">
           <div class="plus-icon">
             <i
               class="fa-regular fa-square-plus fa-2x"
               style="color: var(--color-orange)"
             ></i>
           </div>
           <div class="party__text">
             <h3>파티 찾기</h3>
             <span><b>나에게 딱 맞는 파티를 찾아보세요!</b>	</span>
           </div>
           <div class="party__makeParty">
             <span style="color: var(--color-orange)"
               >파티 찾기&nbsp;<i class="fa-regular fa-circle-right"></i
             ></span>
           </div>
         </div>
       </div>
     </section>

     <!-- icu가 궁금하셈? -->
     <section id="wondering">
       <div class="wonder__box">
         <a class='wonder__a'
           target="_blank"
           href="https://tame-suggestion-7b3.notion.site/baf766587b9f4b9fa26834ab04a33463"
         >
           <img class='wonder-img' src="resources/images/navbarLogo.png" style="width: 180px" />
           <span class="wonder-text"
             >가&nbsp;&nbsp;&nbsp;
             <span class="wonder-text" style="color: var(--color-purple)"
               >궁금</span class="wonder-text"
             >하신가요?</span
           >
           <img
             class="about-img"
             src="resources/images/aboutUs-removebg-preview.png"
           />
         </a>
       </div>
     </section>

     <!-- 추천콘텐츠 -->
     <section id="recommend">
       <div class="recommend-container">
         <div class="recommend__text">
           <h2>추천컨텐츠</h2>
         </div>
         <div class="recommend__box">
           <div class="recommend__box-first movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/302149335/s592/deo-geulrori"
             />
           </div>
           <div class="recommend__box-second movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/301084087/s592/ceinso-maen"
             />
           </div>
           <div class="recommend__box-third movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/282734134/s592/hwanhon"
             />
           </div>
           <div class="recommend__box-fourth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/302060373/s592/keonegteu"
             />
           </div>
           <div class="recommend__box-fifth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/302111369/s592/kajino"
             />
           </div>
         </div>
       </div>
       <div class="recommend-container">
         <div class="recommend__box">
           <div class="recommend__box-first movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/176267183/s592/avatar"
             />
           </div>
           <div class="recommend__box-second movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/292757027/s592/the-roundup"
             />
           </div>
           <div class="recommend__box-third movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
             />
           </div>
           <div class="recommend__box-fourth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/255482634/s592/roki"
             />
           </div>
           <div class="recommend__box-fifth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="https://images.justwatch.com/poster/301110682/s592/heonteu-2022"
             />
           </div>
         </div>
       </div>
     </section>
     
     <br><br>
     
     <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
    <jsp:include page="../common/footer.jsp"/>
    
     <script src="resources/js/main.js" defer></script>
   </div>
</body>
</html>