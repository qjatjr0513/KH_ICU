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
<title>Insert title here</title>
	<!-- css -->
    <link rel="stylesheet" href="resources/css/admin_03_currentParty.css" />
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
    
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
          <c:forEach begin="0" end="${fn:length(list)/12 * 1.0}" step="1" varStatus="x">
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
		      
		      <c:forEach var="p" items="${list}" begin="${j.begin *4}" end="${j.begin * 4 +3}" step="1" varStatus="i" >
			  <c:if test="${not doneLoop}">
				  <div class="cardBox"> <!-- 1개 -->
	                  <h4><b>${list[count].ottName}</b></h4>
	                  <span>${list[count].paTitle}</span> <br />
	                  <span id="endDate">${list[count].endDate}까지 (${list[count].leftDate}일)</span><br/><br/>
	                  <br>
	                  <button class="joinBtn" data-bs-toggle="modal" data-bs-target="#idModal" id="${count}"}>파티장평가</button>
	              </div>
	              
	              
	                <!-- 파티장 평가 모달창 -->
				    <div class="modal fade" id="idModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				      <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				          <div class="modal-header">
				            <h1 class="modal-title fs-5" id="exampleModalLabel">파티장 평가</h1>
				            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				          </div>
				          <div class="modal-body">
				            <h2>파티장 닉네임 : ${list[count].memNickname}</h2>
				            <br /><br />
				            <button class="firstBtn"><i class="fa-regular fa-thumbs-up fa-2x"></i>${list[count].likeCount}</button>
				            <button class="secondBtn"><i class="fa-regular fa-thumbs-down fa-2x"></i>${list[count].badCount}</button>
				          </div>
				          <div class="modal-footer">
				            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
				          </div>
				        </div>
				      </div>
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


  </body>
</html>