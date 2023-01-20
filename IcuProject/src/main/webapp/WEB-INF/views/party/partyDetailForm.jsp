<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티 상세조회</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/09_partyDetail.css" />

</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

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