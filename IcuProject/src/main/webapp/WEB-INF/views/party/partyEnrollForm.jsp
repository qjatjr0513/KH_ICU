<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티등록</title>

   <!-- css -->
    <link rel="stylesheet" href="resources/css/07_enrollParty.css?1" />


</head>
<body>
    <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
	
	<div class='imgBox1'>
		<img class='titleImg' src='resources/images/findParty.png'>
	</div>

    <div class="header__title titleText sl-in2">
      <h2>< 파티 등록 ></h2>
    </div>
    <!-- 등록 섹션 -->
    <form id="enrollForm" action="${contextPath }/insert.py">
	    <%-- <input type="hidden" id="paName" value="${loginUser.memNo}"> --%>
	    <div class='tableBox  sl-in2'>
	    <table class="enroll__party-table">
	      <tr>
	        <td>서비스</td>
	        <td>
	        
		     <select name="ottNo" id="ottNo" class="pl">
	            <option value="0" selected><span>선택</span></option>
	            <option value="1">넷플릭스</option>
	            <option value="2">왓챠</option>
	            <option value="3">웨이브</option>
	            <option value="4">디즈니 플러스</option>
	            <option value="5">애플TV</option>
	        </select>
	        
	        </td>
	      </tr>
	      <tr>
	        <td>서비스 가격</td>
	        <td id="ottPrice"></td>
	      </tr>
	      <tr>
	        <td>제목</td>
	        <td>
	          <input type="text" name="paTitle" placeholder="제목을 입력해주세요." />
	        </td>
	      </tr>
	      <tr>
	        <td>모집 인원</td>
	        <td>
	          <select name="crewNum" id="crewNum">
	            <option value="1">1명</option>
	            <option value="2">2명</option>
	            <option value="3">3명</option>
	            <option value="4">4명</option>
	          </select>
	        </td>
	      </tr>
	      <tr>
	        <td>계정</td>
	        <td>
	          <input type="text" name="ottId" placeholder="계정 아이디(이메일)" required/>
	          <input type="password" name="ottPwd" placeholder="비밀번호" required/>
	        </td>
	      </tr>
	      <tr>
	        <td>계좌번호</td>
	        <td>
	          <input type="text" name="account" required/>
	        </td>
	      </tr>
	      <tr>
	        <td>진행 기간</td>
	        <td>
	           <span id="sysdate"></span> ~ &nbsp;&nbsp; <input  class="datepicker"  placeholder="날짜 클릭" id="endDate" name="endDate" onchange="remainedSpan()" required/> &nbsp;&nbsp; 예상기간
	          : <span id="period" style="color:var(--color-orange)"></span> 
	        </td>
	      </tr>
	      <tr>
	        <td>참여 금액</td>
	        <td>1인당 1일 <span id="dayPrice"></span><span>원</span>
	        <input type="hidden" name="dayPrice" id="dayPrice2">
	        </td>
	      </tr>
	      <tr>
	        <td>예상 금액</td>
	        <td><span id="totalPrice"></span></td>
	      </tr>
	    </table>
	    </div>
	  
	
		
	    <div class="btnGroup">
			<button type="button" onclick="history_back();">이전</button>
		<c:if test="${loginUser.bkStatus eq 'N'}">
			<button type="submit">등록</button>
		</c:if>
		</div>
		
	</form>
	
    <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
   <script>
   
   $(document).ready(function () { 
       setTimeout(function() { 
    	   
			$(".titleImg").fadeIn(1000); 
       }); 
  }); 
  
   $(function () {
     $('.datepicker').datepicker();
   });

   $.datepicker.setDefaults({
     dateFormat: 'yy-mm-dd',
     prevText: '이전 달',
     nextText: '다음 달',
     monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
     monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
     dayNames: ['일', '월', '화', '수', '목', '금', '토'],
     dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
     showMonthAfterYear: true,
     yearSuffix: '년',
   });

   $(function () {
     $('.datepicker').datepicker();
   });

     var period = 0;
     var price1 = 0;
     
     const ottNo = document.querySelector("#ottNo");
     ottNo.addEventListener('change' , ottChoice);
  // ott 가격 
	 function ottChoice(){
		$.ajax({
           url : '${contextPath}/ottChoice',
           data : {ottNo : $("#ottNo option:selected").val()},
           success : function(price){
               
        	  var ppd = Math.round(price /4 /30, 1); 
        	   
              $("#ottPrice").html(price +"원");
              $("#dayPrice").html(ppd);
              $("#dayPrice2").val(ppd);
              console.log("ppd"+ppd);
              
              price1 = Math.round(price /4 /30, 1); 
              
           	  // 예상총금액
      		  if(period != 0){
    			//period = $("#period").val();
    			
    			console.log("price1" + price1);
    			console.log("period" + period);
    			
    			$("#totalPrice").html(price1 * period +"원");
    		  }
            }
         });

	  }
	 
	// 오늘 날짜 & 날짜 선택 (오늘 ~ )
	 $(function(){
         var now_utc = Date.now()
         var timeOff = new Date().getTimezoneOffset()*60000;
         var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
         // 오늘날짜 
         $("#sysdate").html(today);
         // 날짜선택
         document.getElementById("endDate").setAttribute("min", today);
      });
	
	// 남은기간 & 일일금액
     function remainedSpan(){
        var now_utc = Date.now();
        var timeOff = new Date().getTimezoneOffset()*60000;
        var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		
		const date1 = new Date($("#endDate").val());
  		const date2 = new Date(today);
		
		var diffDate = date1.getTime() - date2.getTime();
		
		period = diffDate/(1000 * 60 * 60 * 24)+1;
		
		$("#period").html(diffDate/(1000 * 60 * 60 * 24)+1 +"일");
		
		// 예상총금액
		if(price1 != 0){
  			$("#totalPrice").html(price1 * period +"원");
  		}
		
      };

      
     	function history_back(){
     		history.back();
     	}
	 </script>
		
    
    
    
    
  </body>
</html>