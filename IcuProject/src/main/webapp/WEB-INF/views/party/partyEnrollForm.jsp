<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티등록</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/07_enrollParty.css" />

</head>
<body>
    <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <div class="header__title">
      <h2>파티 등록</h2>
    </div>
    <!-- 등록 섹션 -->
    <form id="enrollForm" action="${contextPath }/insert.py">
	    <%-- <input type="hidden" id="paName" value="${loginUser.memNo}"> --%>
	    <table class="enroll__party-table">
	      <tr>
	        <td>서비스</td>
	        <td>
	          <select name="ottNo" id="ottNo">
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
	            <option value="5">5명</option>
	          </select>
	        </td>
	      </tr>
	      <tr>
	        <td>계정</td>
	        <td>
	          <input type="text" name="ottId" placeholder="계정 아이디(이메일)" />
	          <input type="text" name="ottPwd" placeholder="비밀번호" />
	        </td>
	      </tr>
	      <tr>
	        <td>계좌번호</td>
	        <td>
	          <input type="text" name="account" />
	        </td>
	      </tr>
	      <tr>
	        <td>진행 기간</td>
	        <td>
	          <span id="sysdate"></span> ~ <input type="date" placeholder="종료일" id="endDate" name="endDate" onchange="remainedSpan()" pattern="\d{4}-\d{2}-\d{2}" />&nbsp; 예상기간
	          : <span id="period"></span>
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
	
	    <div class="btnGroup">
	      <button type="reset">초기화</button>
	      <button type="submit">등록</button>
	    </div>
	</form>
    
   <script>
     
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

	 </script>
		
    
    
    
    
  </body>
</html>