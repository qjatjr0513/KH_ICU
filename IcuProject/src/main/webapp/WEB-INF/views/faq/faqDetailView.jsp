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
         <h2>${f.faqTitle }</h2>
         <div style="float:left;">
         	<c:choose>
				<c:when test="${f.faqType == 'AC' }">
				<span>계정문의</span>
				</c:when>
				<c:when test="${f.faqType == 'PY' }">
				<span>파티문의</span>
				</c:when>
				<c:otherwise>
				<span>결제문의</span>
				</c:otherwise>
			</c:choose>
            <input type="hidden" name="faqNo" value="${f.faqNo}">
         </div>
         <div style="float:right;">
               <a class="btn btn-primary" href="${contextPath}/admin/enrollForm.fq?mode=update&fno=${f.faqNo}">수정하기</a>
               <a class="btn btn-danger" href="${contextPath}/admin/delete.fq?fno=${f.faqNo}">삭제하기</a>
         </div>
         <br><br>
      </div>
    </div>
         <table id="contentArea" class="table">
            
            <tr>
               <td colspan="3">
               
               </td>
            </tr>
            <tr>
               <td colspan="4"><p style="height:150px;">${f.faqContent }</p></td>
            </tr>
         </table>
         <br>
         
         <div align="center">
            <a class="btn btn-primary" href="${contextPath }/admin/faqList.fq">목록으로</a>
         </div>
         <br><br>
         
         
           
</body>
</html>