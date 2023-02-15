<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - FAQ 상세</title>
   
<style>
   .titleImg{
  	 margin-top:-50px;
	z-index: -1;
	position:absolute;
	width:1900px;
	height:1100px;
}	

   table * {margin:5px;}
   table {
      width:100%;
   }
   
   #body-container{
   	background-color:#fff;
   	width:70%;
   	height:700px;
   	margin:auto;
   	padding:30px;
   	border:none;
   	box-shadow:0 0 5px 1px lightgray;
   	border-radius:12px;
   	margin-top:120px;
   }
   .btn:first-child, .btn:nth-child(2){
   	border:none;
   }
   
   .btn:first-child{
   	background-color:var(--color-blue);
   }
   .btn:nth-child(2){
   	background-color:var(--color-orange);
   }
   .btn:first-child:hover{
   	background-color:var(--color-blue);
   }
   .btn:nth-child(2):hover{
   	background-color:var(--color-orange);
   }

   
</style>

   
    
</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
   <img class='titleImg' src='${contextPath }/resources/images/board3.jpg' >
   
   <section id='body-container'>
   
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
               <a class="btn btn-primary" href="${contextPath}/admin/enrollForm.ad?mode=update&fno=${f.faqNo}">수정하기</a>
               <a class="btn btn-danger" href="${contextPath}/admin/delete.ad?fno=${f.faqNo}">삭제하기</a>
         </div>
         <br><br>
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
         </section>
         <br>
         
         <div align="center">
            <a class="btn btn-primary" href="${contextPath }/admin/faqList.ad">목록으로</a>
         </div>
         <br><br>
         
         
           
</body>
</html>