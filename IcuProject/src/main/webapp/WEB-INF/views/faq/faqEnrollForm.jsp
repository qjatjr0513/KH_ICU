<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - FAQ 등록</title>
<style>
   #enrollForm>div{width:100%;}

   .titleImg{
  	 margin-top:-50px;
	z-index: -1;
	position:absolute;
	width:1900px;
	height:1100px;
}	

	 #body-container{
	   	background-color:#fff;
	   	width:70%;
	   	height:900px;
	   	margin:auto;
	   	padding:30px;
	   	border:none;
	   	box-shadow:0 0 5px 1px lightgray;
	   	border-radius:12px;
	   	margin-top:120px;
      }
	.form-control:focus{
		outline:none !important;
		border:none !important;
		box-shadow:0 !important;
	}
	.pl {
	width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
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
   <div class="content">
      <br><br>
      <div class="innerOuter" >
         <c:choose>
            <c:when test="${f.faqNo eq null}">
               <h2>FAQ 작성하기</h2>
            </c:when>
            <c:otherwise>
               <h2>FAQ 수정하기</h2>
            </c:otherwise>
         </c:choose>
         <br>
         <form id="enrollForm" action="${contextPath }/admin/insert.ad">
            <div>
               <div>
                  <label for="title">제목 : </label>
                  <input type="text" id="title" class="form-control" name="faqTitle" value="${f.faqTitle } " required>
               </div>
               <hr>
               <div>
               	  <label for="type">분류 : </label>
                  <select name="faqType" id="faqType" class='pl'>
		            <option> 선택 </option>
		            <option value="AC"<c:if test="${f.faqType eq 'AC' }">selected</c:if>>계정 문의</option>
		            <option value="PY"<c:if test="${f.faqType eq 'PY' }">selected</c:if>>파티 문의</option>
		            <option value="PA"<c:if test="${f.faqType eq 'PA' }">selected</c:if>>결제 문의</option>
		          </select>
               </div>
               <br>
               <div>
                  <textarea id="content" style="resize:none;" cols="50" rows="20" class="form-control" name="faqContent"  placeholder="내용을 입력해주세요." required>${f.faqContent }</textarea>
               </div>
               <br>
            <input type="hidden" name="mode" value="${param.mode }"/>
            <input type="hidden" name="faqNo" value="${empty f.faqNo ? 0 : f.faqNo}"/>
            
            
            <div align="center">
               <a href="${contextPath }/admin/faqList.ad" class="btn btn-danger">취소하기</a>
               <c:choose>
                  <c:when test="${f.faqNo eq null}">
                     <button type="submit" class="btn btn-primary">등록하기</button>
                  </c:when>
                  <c:otherwise>
                     <button type="submit" class="btn btn-primary">수정하기</button>
                  </c:otherwise>
               </c:choose>   
            </div>
            </div>
         </form>
         
         
      </div>
   
   </div>
   </section>
   <br><br>
</body>
</html>
</body>
</html>