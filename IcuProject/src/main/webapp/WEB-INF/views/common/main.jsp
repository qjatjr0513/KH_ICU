<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="r" value="${recommend}"/>
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
     <form id="contentSearch" action="${contextPath }/searchByKeyword.co" method="post">
       <div class="input-group mb-3 sizing">
        <select name="searchNo" id="search">
		     	<option value="0" selected><span>전체</span></option>
		     	<option value="1">제목</option>
		     	<option value="2">감독/배우</option>
		     </select>
	         <input
	           type="text"
	           id="keyword"
	           class="formControl"
	           placeholder="내용을 입력해주세요."
	           name="keyword"
	           aria-label="Recipient's username"
	           aria-describedby="button-addon2"
	           required
	         />
	         <button
	           class="btn btn-outline-secondary btn3"
	           type="submit"
	           id="button-addon2"
	         >
	           <i class="fa-solid fa-magnifying-glass fa-lg"></i>
	         </button>
       </div>
       </form>

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
             <span><b>나에게 딱 맞는 파티를 찾아보세요!</b>   </span>
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
             >가&nbsp;&nbsp;&nbsp;&nbsp;
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
               <div class="overlay-black" onclick="movePage(${r.get(0).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(0).getChangeName()} "
             />
           </div>
           <div class="recommend__box-second movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(1).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(1).getChangeName()} "
             />
           </div>
           <div class="recommend__box-third movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(2).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(2).getChangeName()}"
             />
           </div>
           <div class="recommend__box-fourth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(3).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(3).getChangeName()}"
             />
           </div>
           <div class="recommend__box-fifth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(4).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(4).getChangeName()}"
             />
           </div>
         </div>
       </div>
       <div class="recommend-container">
         <div class="recommend__box">
           <div class="recommend__box-first movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black"  onclick="movePage(${r.get(5).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(5).getChangeName()}"
             />
           </div>
           <div class="recommend__box-second movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(6).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(6).getChangeName()}"
             />
           </div>
           <div class="recommend__box-third movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(7).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(7).getChangeName()}"
             />
           </div>
           <div class="recommend__box-fourth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(8).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(8).getChangeName()}"
             />
           </div>
           <div class="recommend__box-fifth movie-poster">
             <div class="overlay-wrap">
               <div class="overlay-black" onclick="movePage(${r.get(9).getConNo() });">
                 <span class="overlay-text">보러가기</span>
               </div>
             </div>
             <img
               src="${r.get(9).getChangeName()}"
             />
           </div>
         </div>
       </div>
     </section>
     
     <br><br>
     
     <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
    <jsp:include page="../common/footer.jsp"/>
    
     
   </div>
   
   <script>
   function movePage(cno){
       location.href = '${contextPath}/detail?conNo='+cno;
    }
	$(document).ready(function() {
		$("#keyword").autocomplete({
			source : function(request, response){
				$.ajax({
					url : '${contextPath}/autoSearch.co',
					dataType : 'json',
					data : {
						keyword : request.term,
						selectOption : $('select[name="searchNo"] option:selected').val()
					},
					success : function(data){	
						console.log(data);
						response($.map(data, function (item) {
			                return {
			                    value: item.conKTitle,
			                    label: item.conKTitle,
			                    idx: item.conNo
			                };
			            }));
					},error : function(){
			             console.log("오류가 발생했습니다.");
			        }
				})
			},
			focus : function(event, ui) {
				return false;
			}
			,minLength: 1
			,autoFocus : true
			,delay: 100
			,select : function(evt, ui) { 
				location.href = '${contextPath}/detail?conNo='+ui.item.idx;
				console.log(ui.item.label);
				console.log(ui.item.value);
			 }
		});
	});
   </script>
</body>
</html>