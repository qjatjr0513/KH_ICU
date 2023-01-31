<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="p" value="${p}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/10_application.css" />
    <script src="http://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 파티신청 div -->
    <section id="application">
      <div class="app-container">
        <h2>파티 신청</h2>
      </div>
      <hr />
      <div class="table-container">
        <table class="first-table">
          <tr>
            <td>서비스</td>
            <td><span>${p.ottName}</span></td>
          </tr>
          <tr>
            <td>제목</td>
            <td><span>${p.paTitle}</span></td>
          </tr>
          <tr>
            <td>아이디</td>
            <td><span>${loginUser.memId}</span></td>
          </tr>
          <tr>
            <td>닉네임</td>
            <td><span>${loginUser.memNickname}</span></td>
          </tr>
        </table>
        <hr />
      </div>
      <div class="table-container">
        <table class="second-table">
          <tr>
            <td>결제 금액</td>
            <td><span name="payment">${p.totalPrice} 원</span></td>
          </tr>
          <tr>
            <td>종료 일자</td>
            <td><span>${p.endDate} (${p.leftDate}일)</span></td>
          </tr>
        </table>
      </div>
      <br />
      <div class="btn-group2">
        <button>이전</button>
        <button type="button" id="payBtn" onclick="requestPay();">결제</button>
      </div>
    </section>

    <script>
      let paNo = "${p.paNo}";
      let totalPrice = "${p.totalPrice}";
      let endDate = "${p.endDate}";
      let startDate = "${p.startDate}";
      let paTitle = "${p.paTitle}";
      let memName = "${loginUser.memName}";
      let email = "${loginUser.email}";
      let phone = "${loginUser.phone}";

      function requestPay() {
        var IMP = window.IMP;
        var code = "imp20075413";
        IMP.init(code);
        $.ajax({
          url: "${contextPath}/accountOfPayment.pe",
          data:{
            paNo : paNo,
            payment : "card",
            price : totalPrice
          },
          type: "post",
          success: function (data) {
            
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: paNo +"번 파티"+totalPrice+"원 결제",
                name: paTitle ,
                amount: totalPrice,
                buyer_email: email,
                buyer_name: memName,
                buyer_tel: phone
                // m_redirect_url: '${contextPath}/payManageListForm.pe' // 결제내역 페이지로 (url변동가능)
            }, function (rsp) { // callback
                if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                  // jQuery로 HTTP 요청
                  jQuery.ajax({
                      url: "${contextPath}/paymentVerify.pe",
                      method: "POST",
                      headers: { "Content-Type": "application/json" },
                      data: {
                          imp_uid: rsp.imp_uid,
                          merchant_uid: rsp.merchant_uid
                      }
                  }).done(function (data) {
                    // 가맹점 서버 결제 API 성공시 로직
                    alertInfo();
                  })
                } else {
                  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                }
              });
              
            }
        });
          
        }
        
        function alertInfo() {
          alert(totalPrice + "원 결제되었습니다.");
          location.href = '${contextPath}/partyDetail.py/paNo';
        }
    </script>
</body>
</html>