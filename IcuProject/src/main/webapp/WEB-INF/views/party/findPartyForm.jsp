<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="list" value="${list}"/>
    
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

<img src='resources/images/faqImg.png' style="width:1898px; margin-top:50px;">

<div class="header__title titleText sl-in2"  style=' padding:10px; margin-top:20px;'>
      <h2>< 파티 찾기 ></h2>
</div>
<br>
	<section id='body-container' class='sl-in2'>
	<form action="${contextPath}/findParty.py">
    <section id="about" class="section section__container ">
      <div class="about__majors">
      

       	<div class="major">
          <button type='button' class="major_btn" value="1" id="netflix" name="netflix">
            <div class="major__icon netfilx"></div>
          </button>
          <input class='input__check' id="netflix" type="checkbox" name="ottList" value="1"/>
          <h2 class="major__title" id='netflix'>Netflix</h2>
        </div>
        
        <div class="major">
          <button type='button' class="major_btn" value="2" id="wavve" name="wavve">
            <div class="major__icon wavve"></div>
          </button>
          <input class='input__check' id="wavve" type="checkbox" name="ottList" value="2" />
          <h2 class="major__title" id='wavve'>Wavve</h2>
        </div>
        
        
        <div class="major">
          <button type='button' class="major_btn" value="3" id="disney" name="disney">
            <div class="major__icon disney"></div>
          </button>
          <input class='input__check' id="disney" type="checkbox" name="ottList" value="3" />
          <h2 class="major__title" id='disney'>Disney +</h2>
        </div>

        <div class="major">
          <button type='button' class="major_btn" value="4" id="watcha" name="watcha">
            <div class="major__icon watcha"></div>
          </button>
          <input class='input__check' id="watcha" type="checkbox" name="ottList" value="4" />
          <h2 class="major__title" id='watcha'>Watcha</h2>
        </div>
        
        <div class="major">
          <button type='button' class="major_btn" value="5" id="appleTV" name="appleTV">
            <div class="major__icon appleTv"></div>
          </button>
          <input class='input__check' id="appleTV" type="checkbox" name="ottList" value="5" />
          <h2 class="major__title" id='appleTV'>Apple TV</h2>
        </div>
      </div>
      <div class="textbox">
      	<span > * 원하는 아이콘을 클릭 후 이용기간을 설정해주세요.</span>
      </div>
    </section> 

    <!-- 이용기간 -->
    <section id="periodOfUse">
      <div class="periodOfUse-container">
        <span class='use-period'>이용기간 &nbsp;:  &nbsp;</span>
        <input type="range" id="month" name="month" min="1" max="12" step="1" value="12" oninput="document.getElementById('value1').innerHTML=this.value + '개월';">
        <Br>
        <span id="value1">12개월</span>
        <br><br><br>
        <button>검색</button>
      </div>
    </section>
    </form>
    
    <!-- 파티 카드 -->
    <section id="party__container">
   	  <c:if test="${empty list }">
		 <tr id="tableEmpty">
			<td colspan="5">파티방이 없습니다. 원하는 파티를 만들어보세요. </td>
		 </tr>
	  </c:if>
		
		<c:set var="doneLoop" value="false"/>
		<c:set var="count" value="0"/>
        <div
        id="carouselExampleControls"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-inner">
         <!-- 8*3개 -->
          <c:forEach begin="0" end="${fn:length(list)/8 * 1.0}" step="1" varStatus="x">
          <c:choose>
         	 <c:when test="${count == 0}">
            	<div class="carousel-item active" data-bs-interval="100000"> <!-- 8개 -->
         	 </c:when>
         	 <c:otherwise>
            	<div class="carousel-item" data-bs-interval="100000"> <!-- 8개 -->
         	 </c:otherwise>
          </c:choose>
          
          <c:forEach begin="${x.begin * 2}" end="${x.begin *2+1}" step="1" varStatus="j">
          <c:if test="${not doneLoop}">
            <div class="partyCard"> <!-- 4개 -->
		      
		      <c:forEach var="p" items="${list}" begin="${j.begin *4}" end="${j.begin * 4 +3}" step="1" varStatus="i" >
			  <c:if test="${not doneLoop}">
				  <div class="cardBox"> <!-- 1개 -->
	                  <h4><b>${list[count].ottName}</b></h4>
	                  <span>${list[count].paTitle}</span> <br />
	                  <span id="endDate">${list[count].endDate}까지 (${list[count].leftDate}일)</span><br/><br/>
	                  
		              <c:forEach begin="1" end="${list[count].joinNum+1}" step="1">
		              <span><i class="fa-solid fa-user fa-lg"></i></span>&nbsp;&nbsp;
		              </c:forEach>

	                  <c:forEach begin="1" end="${3-list[count].joinNum}" step="1">
	                  <span><i class="fa-regular fa-user fa-lg"></i></span>&nbsp;&nbsp;
	                  </c:forEach>
	                    
	                  <button class="joinBtn" onclick="movePage(${list[count].paNo});">참여하기</button>
	              </div>
				  <c:set var="count" value="${count+1 }"/>
			      
				  <c:if test="${count > fn:length(list)-1}">	 
					<c:set var="doneLoop" value="true"/>
				  </c:if> 
			  </c:if>
		      </c:forEach> 
		    </div>  
		    <c:if test="${count > fn:length(list)-1}">	 
			    <c:set var="doneLoop" value="true"/>
			</c:if> 
		  </c:if>
		  <br>
		  </c:forEach>
		  
		  <br>
		  </div>
		  </c:forEach>
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
    
    </section>

    <script>
    
    document.querySelector('#month').addEventListener('input',function(event){
      	var gradient_value = 100 / event.target.attributes.max.value;
        event.target.style.background = 'linear-gradient(to right, #FFE283 0%, #FFE283 '+gradient_value * event.target.value +'%, rgb(236, 236, 236) ' +gradient_value *  event.target.value + '%, rgb(236, 236, 236) 100%)';
      });
    
		function movePage(paNo){
	 		location.href = "${contextPath}/partyDetail.py/"+paNo;
	 	};
	 	
	
		$("#netflix, #watcha, #wavve, #disney, #appleTV").click(function(){
			console.log("실행");
			
			if($('input[id=' + $(this).attr('name') + ']').is(':checked') == true){
				
               $('input[id= '+ $(this).attr('name') + ']').prop("checked", false); 
               $('h2[id= '+ $(this).attr('name') + ']').removeClass('colorOrange');
               
            }
            else{
               $('input[id='+$(this).attr('name')+']').prop("checked", true);
               $('h2[id= '+ $(this).attr('name') + ']').addClass('colorOrange');
               
            }
		});
		
		
 		function searchParty(){
 			
			var ottList = [];
			
			  $(".input__check:checked").each(function(i){
				 ottList.push($(this).val());
			  });
			  

	 		console.log("! : " +ottList);
			
			$.ajax({
		           url : '${contextPath}/findParty.py',
		           data : {ottList : ottList,
		        	   	   month : $("#month").val()}
			})
		};
    </script>
  </body>
</html>