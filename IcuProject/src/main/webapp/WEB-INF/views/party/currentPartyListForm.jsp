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
			<td colspan="5">진행중인 파티방이 없습니다. </td>
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