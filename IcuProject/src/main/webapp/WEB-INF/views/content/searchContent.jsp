<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="list" value="${list}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/11_searchContents.css" />
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

<!-- 검색 section -->
    <section id="search">
    <form id="memberEnroll" action="${contextPath }/searchByKeyword.co" method="post">
      	<select name="searchNo" id="search" style="width:70px;height:30px;">
			<option value="0" selected><span>전체</span></option>
			<option value="1">제목</option>
			<option value="2">감독/배우</option>
		</select>
      <div class="input-group mb-3 sizing">
        <input
          type="text"
          class="formControl"
          placeholder="내용을 입력해주세요."
          name="keyword"
          aria-label="Recipient's username"
          aria-describedby="button-addon2"
          required
        />
        <button
          class="btn btn-outline-secondary"
          type="submit"
          id="button-addon2"
        >
          <i class="fa-solid fa-magnifying-glass fa-lg"></i>
        </button>
      </div>
      </form>
      <br />
      <hr styl />
      <br />
    </section>

    <!-- 영화 section -->
    <c:if test="${empty list }">
    	검색된 컨텐츠가 없습니다
    </c:if>
    
    <c:if test="${!empty list }">
   		<section id="movie__section">
   			<c:forEach var="c" items="${list }">
   				<div class="movie-container" onclick="movePage(${c.conNo });">
			        <div class="movie__info">
			          <c:if test="${c.filePath eq '' }">
							<img
							id="poster"
							src="${c.filePath}${c.changeName}"
							/>
					  </c:if>
					  <c:if test="${c.filePath ne '' }">
							<img
							id="poster"
							src="${contextPath}/${c.filePath}${c.changeName}"
							/>
					  </c:if>
			          <br /><br />
			          <h4>${c.conKTitle }</h4>
			          <span>${c.conETitle } (${fn:substring(c.conDate,0,4)})</span><br />
			          <i class="fa-solid fa-star">${c.cmtStar }</i>
			        </div>
			        <div class="movie__text">
			          <p>${c.conSynop }</p>
			        </div>
			      </div>
			      <hr>	
   			</c:forEach>
   		</section>
    </c:if>
  <script>
		function movePage(cno){
	 		location.href = '${contextPath}/detail?conNo='+cno;
	 	}
  </script>
  </body>
</html>