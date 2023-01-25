<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #enrollForm>div{width:100%;}


</style>
</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
   <!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>
   <br><br>
   <div class="content">
      <br><br>
      <div class="innerOuter" >
         <c:choose>
            <c:when test="${b.boardNo eq null}">
               <h2>FAQ 작성하기</h2>
            </c:when>
            <c:otherwise>
               <h2>FAQ 수정하기</h2>
            </c:otherwise>
         </c:choose>
         <br>
         <form id="enrollForm" action="${contextPath }/enrollForm.fq">
            <div >
               <div>
                  <label for="title">제목 : </label>
                  <input type="text" id="title" class="form-control" name="faqTitle" value="${b.boardTitle } " required>
               </div>
               <hr>
               <div>
               	  <label for="type">분류 : </label>
                  <select name="faqType" id="faqType">
		            <option> 선택 </option>
		            <option value="AC">계정 문의</option>
		            <option value="PY">파티 문의</option>
		            <option value="PA">결제 문의</option>
		          </select>
               </div>
               <br>
               <div>
                  <textarea id="content" style="resize:none;" cols="50" rows="20" class="form-control" name="faqContent" placeholder="내용을 입력해주세요." required></textarea>
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
</body>
</html>
</body>
</html>