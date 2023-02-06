<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/06_findId.css" />

<style>
   #enrollForm>div{width:100%;}


</style>
</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
   <div class="content" style="margin-top: 50px;">
      <br><br>
      <div class="innerOuter" >
         <c:choose>
            <c:when test="${b.boardNo eq null}">
               <h2>게시글 작성하기</h2>
            </c:when>
            <c:otherwise>
               <h2>게시글 수정하기</h2>
            </c:otherwise>
         </c:choose>
         <br>
         <form id="enrollForm" action="${contextPath }/insert.bo">
            <div >
               <div>
                  <label for="title">제목 : </label>
                  <input type="text" id="title" class="form-control" name="boardTitle" value="${b.boardTitle } " required>
               </div>
               <hr>
               <div>
                  <label for="writer">작성자 : </label>
                  <input type="text" id="writer" class="form-control" value="${loginUser.memNickname}" name="memNickname" readonly>
                  <input type="hidden" name="boardWriter" value="${loginUser.memNo}">
               </div>
               <br>
               <div>
                  <textarea id="content" style="resize:none;" cols="50" rows="20" class="form-control" name="boardContent" placeholder="내용을 입력해주세요." required></textarea>
               </div>
               <br>
            <input type="hidden" name="mode" value="${param.mode }"/>
            <input type="hidden" name="boardNo" value="${empty b.boardNo ? 0 : b.boardNo}"/>
            
            <div align="center">
               <a href="${contextPath }/list.bo" class="btn btn-danger">취소하기</a>
               <c:choose>
                  <c:when test="${b.boardNo eq null}">
                     <button type="submit" class="btn btn-primary">등록하기</button>
                  </c:when>
                  <c:otherwise>
                     <button type="submit" class="btn btn-primary">수정하기</button>
                  </c:otherwise>
               </c:choose>   
            </div>
         </form>
         
         
      </div>
   
   </div>

	<!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>    
   
</body>
</html>