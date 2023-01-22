<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${map.list }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티찾기</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/08_findParty.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

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
        <div class="carousel-inner"> <!-- 8*3개 -->
          <div class="carousel-item active" data-bs-interval="100000"> <!-- 8개 -->
            <div class="partyCard"> <!-- 4개 -->
            
<%-- 	          <c:if test="${empty list }">
				 <tr id="tableEmpty">
					<td colspan="5">파티방이 없습니다. 원하는 파티를 만들어보세요. </td>
				 </tr>
			  </c:if>
				
		      <c:forEach var="p" items="${list }" begin=i end=5 step=4 >
			  <div class="cardBox">
                  <h4>${p.ottNo}</h4>
                  <span>${p.paTitle}</span> <br />
                  <span>${p.endDate}</span> <span>까지(</span> <span>100</span> <span>일)</span> <br /><br />
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-regular fa-user fa-lg"></i></span>
                  <!-- 인원이 없으면 <i class="fa-light fa-user"></i> 쓰면됨. -->
                  <button class="joinBtn">참여하기</button>
              </div>
		      </c:forEach> --%>
            
            
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