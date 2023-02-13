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
    <section id="application" style="position:relative">
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
        <button type="button" onclick="location.href='${contextPath }/findPartyForm.py'">취소</button>
        <button type="button" id="payBtn">결제</button>
      </div>
    </section>

	<!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
    <script>
      const paNo = "${p.paNo}";
      const totalPrice = "${p.totalPrice}";
      const endDate = "${p.endDate}";
      const startDate = "${p.startDate}";
      const paTitle = "${p.paTitle}";
      const memName = "${loginUser.memName}";
      const email = "${loginUser.email}";
      const phone = "${loginUser.phone}";
      const rand_0_10000 = Math.floor(Math.random() * 10001);


      var height = $(document).height();
      var width  = window.document.body.clientWidth;
      
      var layer = "<div id='icon-box' style='display:absolute; height: 100%; min-width: 100%; position:fixed; background-color: rgba( 255, 255, 255, 0.5 ); z-index:99; left:0; top:0;'></div>";
      var image = '';
      image += "<div id='loadingImg'>";
      image += "<img src='resources/images/spinner.gif' style='display:block; vertical-align: middle; postion:relative; margin: 0px auto; margin-top:400px;'/>";
      image += "</div>";
      
      $(document).ready(function(){
   	   	  
    	var IMP = window.IMP;
        var code = "imp20075413";
   		IMP.init(code);
   		
   		$("#payBtn").click(function(e){
   			//결제요청
   			
   			IMP.request_pay({ // param
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: paNo +"번 파티 "+totalPrice+"원 결제 "+ rand_0_10000,
                name: paTitle ,
                amount: totalPrice,
                buyer_email: email,
                buyer_name: memName,
                buyer_tel: phone
                // m_redirect_url: '${contextPath}/payManageListForm.pe' // 결제내역 페이지로 (url변동가능)
            }, function(rsp){
   				if(rsp.success){//결제 성공시
   					var msg = '결제가 완료되었습니다';
   					console.log("결제성공 " + msg);
   					$.ajax({
   						  url : '${contextPath}/accountOfPayment.pe', 
   				        type :'POST',
	   				     data:{
	   			            paNo : paNo,
	   			            payment : "card",
	   			            price : totalPrice
	   			          },
   				        success: function(res){
   				        			        	
   				          if(res == 1){
                      console.log("추가성공");
                      Swal.fire({
                            icon:'success',
                            title: totalPrice + "원이 결제되었습니다.",
                            confirmButtonColor: '#3085d6',
                        }).then((result) => {
                          if (result.isConfirmed){
                            location.href = '${contextPath}/partyDetail.py/'+paNo;
                          }
                        });
   				          }else{
   				             console.log("Insert Fail!!!");
   				          }
   				        },beforeSend:function(){
   				        	$('body').append(layer);
   				   			$('#icon-box').append(image);
   				   			$('#icon-box').show();
   				   			$('#loadingImg').show();
   				        },complete:function(){
   				        	$('#icon-box, #loadingImg').hide();
   				        	$('#icon-box, #loadingImg').empty();  
   				        }
   				        ,error:function(){
   				          console.log("Insert ajax 통신 실패!!!");
   				        }
   					}) //ajax
   					
   				}
   				else{//결제 실패시
   					var msg = '결제에 실패했습니다';
   					msg += '에러 : ' + rsp.error_msg
   				}
   				console.log(msg);
   			});//pay
   		}); //check1 클릭 이벤트
   	}); //doc.ready
    </script>
</body>
</html>