<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="listI" value="${listI}"/>
<c:set var="listO" value="${listO}"/>
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
    
    <!-- 파티 섹션 -->
    <section id="partySection">
    
      <div class="PartyBtnGroup">
        <button class="makeParty">내가 만든 파티</button>
        <button class="lastParty">내가 참여한 파티</button>
      </div>
      <br />

	  <!-- 내가 만든 파티  -->
      <div id="makePartyBox">
       <!-- 파티 카드 -->
	    <section id="party__container">
	   	  <c:if test="${empty listI }">
			 <tr id="tableEmpty">
				<td colspan="5"> 파티가 없습니다. </td>
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
	          <c:forEach begin="0" end="${fn:length(listI)/12 * 1.0}" step="1" varStatus="x">
	          <c:choose>
	         	 <c:when test="${count == 0}">
	            	<div class="carousel-item active" data-bs-interval="100000"> <!-- 8개 -->
	         	 </c:when>
	         	 <c:otherwise>
	            	<div class="carousel-item" data-bs-interval="100000"> <!-- 8개 -->
	         	 </c:otherwise>
	          </c:choose>
	          
	          <c:forEach begin="${x.begin * 3}" end="${x.begin *3+2}" step="1" varStatus="j">
	          <c:if test="${not doneLoop}">
	            <div class="partyCard"> <!-- 4개 -->
			      
			      <c:forEach var="p" items="${listI}" begin="${j.begin *4}" end="${j.begin * 4 +3}" step="1" varStatus="i" >
				  <c:if test="${not doneLoop}">
					  <div class="cardBox">
					  	  <div onclick="movePageI(${listI[count].paNo})">
		                  <h4><b>${listI[count].ottName}</b></h4>
		                  <span>${listI[count].paTitle}</span> <br />
		                  <span id="endDate">${listI[count].endDate}까지 (${listI[count].leftDate}일)</span><br/><br/>
		                  <br>
		                  </div>
		                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal__${count}">ID / PWD 보기</button>
		              </div>
		              
		                <!-- 모달창 -->
					    <div class="modal fade" id="idModal__${count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					      <div class="modal-dialog modal-dialog-centered">
					        <div class="modal-content">
					          <div class="modal-header">
					            <h1 class="modal-title fs-5" id="exampleModalLabel">계정 정보</h1>
					            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					          </div>
					          <div class="modal-body">
					            <h2>계정 아이디 : ${listI[count].ottId}</h2>
					            <h2>계정 비밀번호 : ${listI[count].ottPwd}</h2>     
					          </div>
					          <div class="modal-footer">
					            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					          </div>
					        </div>
					      </div>
					    </div>
		              
					  <c:set var="count" value="${count+1 }"/>
				      
					  <c:if test="${count > fn:length(listI)-1}">	 
						<c:set var="doneLoop" value="true"/>
					  </c:if> 
				  </c:if>
			      </c:forEach> 
			    </div>  
			    <c:if test="${count > fn:length(listI)-1}">	 
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
       
      </div>

      <!-- 내가 참여한 파티 -->
      <div id="lastPartyBox">
      <!-- 파티 카드 -->
	    <section id="party__container">
	   	  <c:if test="${empty listO }">
			 <tr id="tableEmpty">
				<td colspan="5"> 파티가 없습니다. </td>
			 </tr>
		  </c:if>
			
			<c:set var="doneLoopO" value="false"/>
			<c:set var="countO" value="0"/>
	        <div
	        id="carouselExampleControls"
	        class="carousel slide"
	        data-bs-ride="carousel"
	      >
	        <div class="carousel-inner">
	         <!-- 8*3개 -->
	          <c:forEach begin="0" end="${fn:length(listO)/12 * 1.0}" step="1" varStatus="x">
	          <c:choose>
	         	 <c:when test="${countO == 0}">
	            	<div class="carousel-item active" data-bs-interval="100000"> <!-- 8개 -->
	         	 </c:when>
	         	 <c:otherwise>
	            	<div class="carousel-item" data-bs-interval="100000"> <!-- 8개 -->
	         	 </c:otherwise>
	          </c:choose>
	          
	          <c:forEach begin="${x.begin * 3}" end="${x.begin *3+2}" step="1" varStatus="j">
	          <c:if test="${not doneLoopO}">
	            <div class="partyCard"> <!-- 4개 -->
			      
			      <c:forEach var="p" items="${listO}" begin="${j.begin *4}" end="${j.begin * 4 +3}" step="1" varStatus="i" >
				  <c:if test="${not doneLoopO}">
				  	 
					  <div class="cardBox">
					  	  <div onclick="movePageO(${listO[countO].paNo})">
		                  <h4><b>${listO[countO].ottName}</b></h4>
		                  <span>${listO[countO].paTitle}</span> <br />
		                  <span id="endDate">${listO[countO].endDate}까지 (${listO[countO].leftDate}일)</span><br/><br/>
		                  <br>
		                  </div>
						  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal__${count}">ID / PWD 보기</button>
		              </div>
					
					  <!-- 모달창 -->
					  <div class="modal fade" id="idModal__${count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
						  <div class="modal-content">
							<div class="modal-header">
							  <h1 class="modal-title fs-5" id="exampleModalLabel">계정 정보</h1>
							  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
							  <h2>계정 아이디 : ${listO[countO].ottId}</h2>
							  <h2>계정 비밀번호 : ${listO[countO].ottPwd}</h2>     
							</div>
							<div class="modal-footer">
							  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							</div>
						  </div>
						</div>
					  </div>
		                
		              
					  <c:set var="countO" value="${countO+1 }"/>
				      
					  <c:if test="${countO > fn:length(listO)-1}">	 
						<c:set var="doneLoopO" value="true"/>
					  </c:if> 
				  </c:if>
			      </c:forEach> 
			    </div>  
			    <c:if test="${countO > fn:length(listO)-1}">	 
				    <c:set var="doneLoopO" value="true"/>
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
        
      </div>
      
    </section>
    
    <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
    <script src="resources/js/memberCurrentParty.js" defer> </script>
    
    <script>
    function movePageI(paNo){
    	location.href = "${contextPath}/partyDetail.py/"+paNo;
    };

    function movePageO(paNo){
    	location.href = "${contextPath}/partyDetail.py/"+paNo;
    };
       
    </script>

</body>
</html>