<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU (I See You)</title>
<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


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
    <link rel="stylesheet" href="resources/css/02_mainPage.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
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
           class="btn btn-outline-secondary"
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
                     <img class="img-popcorn" src="../image/popcorn.jpg" />
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
       <div class="party__box">
         <div class="party__box-left" onclick="location.href=''">
           <div class="plus-icon">
             <i
               class="fa-regular fa-square-plus fa-2x"
               style="color: var(--color-purple)"
             ></i>
           </div>
           <div class="party__text">
             <h3>파티 만들기</h3>
             <span>팀을 위한 파티장이 되어보세요!</span>
           </div>
           <div class="party__makeParty">
             <span
               >파티 만들기&nbsp;<i class="fa-regular fa-circle-right"></i
             ></span>
           </div>
         </div>
         <div class="party__box-right" onclick="location.href=''">
           <div class="plus-icon">
             <i
               class="fa-regular fa-square-plus fa-2x"
               style="color: var(--color-orange)"
             ></i>
           </div>
           <div class="party__text">
             <h3>파티 찾기</h3>
             <span>나에게 딱 맞는 파티를 찾아보세요!</span>
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
         <a
           target="_blank"
           href="https://tame-suggestion-7b3.notion.site/baf766587b9f4b9fa26834ab04a33463"
         >
           <img src="resources/images/navbarLogo.png" style="width: 180px" />
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
     
     <!-- chatBot -->
     <button class="chatBot">
       <i class="fa-solid fa-headset"></i>
     </button>

     <!-- 챗봇 누르면 나오는 div -->
     <section id="chatting">
       
       <div class="chat_wrap animate__animated animate__fadeInUp">
         <div class="chat_header">
           <h5>실시간 문의</h5>
           <button class="close__chatDiv">
             <i class="fa-solid fa-xmark fa-lg" style="color: white"></i>
           </button>
           <hr />
           <span><i class="fa-solid fa-user"></i>&nbsp;&nbsp;관리자</span
           ><br />
           <span>무엇을 도와드릴까요? 2020-02-02 17:00</span>
         </div>

         
         <div class="inner"></div>

         <input 
         type="text" 
         class="mymsg send-msg" 
         placeholder="내용 입력" 
         style="border: 0;
               width: 100%;
               background: #ddd;
               border-radius: 5px;
               height: 30px;
               padding-left: 5px;
               box-sizing: border-box;
               margin-top: 5px;"/>
         <input
           type="text"
           class="yourmsg send-msg"
           placeholder="내용 입력"
           style="border: 0;
                 width: 100%;
                 background: #ddd;
                 border-radius: 5px;
                 height: 30px;
                 padding-left: 5px;
                 box-sizing: border-box;
                 margin-top: 5px;"/>
       </div>
     </section>
     <script src="resources/js/02_mainPage.js" defer></script>
     <script src="resources/js/main.js" defer></script>
   </div>
</body>
</html>