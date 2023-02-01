<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 참여중인 파티</title>



    <!-- css -->
    <link rel="stylesheet" href="resources/css/memberCurrentParty.css" />
</head>
<body>

	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../member/myNavbar.jsp"/>
    
        <!-- id찾기 화면 -->
    <section id="idPwdSection">
    
      <div class="PartyBtnGroup">
        <button class="makeParty">내가 만든 파티</button>
        <button class="lastParty">내가 참여한 파티</button>
      </div>
      <br />

      <div id="makePartyBox">
       
       <section id="party__container" class="party-container-first">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
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
                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal">ID / PWD 보기</button>
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
                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal">ID / PWD 보기</button>
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
                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal">ID / PWD 보기</button>
                </div>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </section>
       
      </div>

      <!-- 비밀번호 -->
      <div id="lastPartyBox">
      
        <!-- 파티 카드 -->
      <section id="party__container" class="party-container-first">
        <div id="carouselExampleControls2" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="100000">
              <div class="partyCard">
                <div class="cardBox">
                  <h4>넷플릭스2</h4>
                  <span>있으며 인생을 풍부하게</span> <br />
                  <span>2023.10.10까지 (100일)</span> <br /><br />
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-regular fa-user fa-lg"></i></span>
                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal">ID / PWD 보기</button>
                </div>
              </div>
            </div>
            <div class="carousel-item" data-bs-interval="100000">
              <div class="partyCard">
                <div class="cardBox">
                  <h4>넷플릭스22</h4>
                  <span>있으며 인생을 풍부하게</span> <br />
                  <span>2023.10.10까지 (100일)</span> <br /><br />
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-regular fa-user fa-lg"></i></span>
                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal">ID / PWD 보기</button>
                </div>
              </div>
            </div>
            <div class="carousel-item" data-bs-interval="100000">
              <div class="partyCard">
                <div class="cardBox">
                  <h4>${casdfasdf}</h4>
                  <span>있으며 인생을 풍부하게</span> <br />
                  <span>2023.10.10까지 (100일)</span> <br /><br />
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
                  <span><i class="fa-regular fa-user fa-lg"></i></span>
                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal">ID / PWD 보기</button>
                </div>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </section>
        
      </div>
      
    </section>
    
    <!-- 파티장 평가 모달창 -->
    <div class="modal fade" id="idModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">계정 정보</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h2>계정 아이디 : </h2>
            <h2>계정 비밀번호 : </h2>     
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary">확인</button>
          </div>
        </div>
      </div>
    </div>
    
    <script src="resources/js/memberCurrentParty.js" defer></script>
</body>
</html>