<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="p" value="${p}"/>
<c:set var="pj" value="${pj}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티 상세조회</title>

    <!-- css -->
    <link rel="stylesheet" href="../resources/css/09_partyDetail.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 

</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <!-- header -->
    <section id="service-title">
      <div class="netfilx">
        <h2>${p.ottName}</h2>
        <h4>${p.paTitle}</h4>
      </div>
      <div class="info__partyOwner">
        <i class="fa-solid fa-user fa-lg">&nbsp;${p.memNickname}</i>
        <span>파티번호 : ${p.paNo}</span>
      </div>
      <hr />
      <div class="info__date">
        <span>종료일자 : ${p.endDate} (${p.leftDate}일)</span> <br />
        <span>금액 : ${p.totalPrice}원</span>
        <button id="joinMem">참여 신청</button>
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
              <h4>(파티장) ${p.memNickname}</h4>
              <span>${p.startDate} 생성</span>
            </div>
          </div>
          
          <c:forEach var="pj" items="${pj}" begin="0" end="${fn:length(pj)}" step="1">
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4>${pj.memNickname}</h4>
              <span>${pj.joinDate} 참여</span>
            </div>
          </div>
          </c:forEach>
          
          <c:forEach begin="1" end="${3-fn:length(pj)}" step="1">
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4></h4>
              <span></span>
            </div>
          </div>
          </c:forEach>
          
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
    
    <script>
    	document.getElementById("joinMem").addEventListener('click', joinPartyMember());
    	
		function joinPartyMember(){
 		    console.log("실행!!");
 		    console.log("${loginUser} : " +${loginUser.memNo});
		    console.log("${p.paNo} : " + ${p.paNo});
			
		    $.ajax({
	           url : '${contextPath}/joinPartyMember',
	           data : {memNo : ${loginUser.memNo},
	        	       paNo : ${p.paNo}},
	           success : function(result){
                   //좋아요 등
                   if(result == 1){
                      alert("파티에 참여합니다.");
                      location.reload();
                   }else{
                      alert("파티 참여에 실패했습니다. ");
                   }
 				}
			});
		}
    </script>
  </body>
</html>