<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
<style>
   table * {margin:5px;}
   table {
      width:100%;
   }
   /* div{
      border: 1px solid black;
   } */
</style>

    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/06_findId.css?2" />

    
</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
   <!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>
   <br>
   <div class="content">
      <br><br>
      <div class="innerOuter">
         <h2>${b.boardTitle }</h2>
         <div style="float:left;">
            <span id="writer" class="form-control" name="memNickname">${b.boardWriter}</span>
            <input type="hidden" name="boardWriter" value="${loginUser.memNo}">
         </div>
         <div style="float:right;">
            <c:if test="${not empty loginUser && loginUser.memNickname eq b.boardWriter }">
               <a class="btn btn-primary" href="${contextPath}/enrollForm.bo?mode=update&bno=${b.boardNo}">수정하기</a>
               <a class="btn btn-danger" href="${contextPath}/delete.bo?bno=${b.boardNo }">삭제하기</a>
            </c:if>
         </div>
         <br><br>
         
         <table id="contentArea" class="table">
            
            <tr>
               <td colspan="3">
               
               </td>
            </tr>
            <tr>
               <td colspan="4"><p style="height:150px;">${b.boardContent }</p></td>
            </tr>
         </table>
         <br>
         
         <div align="center">
            <a class="btn btn-primary" href="${contextPath }/list.bo">목록으로</a>
         </div>
         <br><br>
         
         
           
</body>
</html>