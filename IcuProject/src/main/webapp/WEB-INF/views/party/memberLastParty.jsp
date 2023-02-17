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
<title>ICU - 참여했던 파티</title>

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
          <div class='noParty'>
             <span style='font-weight:bold;'>파티가 존재하지 않습니다😒</span>
          </div>
        </c:if>
         
         <c:if test="${!empty listI }">
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
                 <div class="cardBox divBox"> <!-- 1개 -->
                        <h4><b>${listI[count].ottName}</b></h4>
                        <span>${listI[count].paTitle}</span> <br />
                        <span id="endDate">파티 종료일 : ${listI[count].endDate}</span><br/><br/>
                        <br>
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
         </c:if>
       </section>
      </div>


      <!-- 내가 참여한 파티 -->
      <div id="lastPartyBox">

       <!-- 파티 카드 -->
       <section id="party__container">
           <c:if test="${empty listO }">
          <div class='noParty'>
             <span style='font-weight:bold;'>파티가 존재하지 않습니다😒</span>
          </div>
        </c:if>
         
         <c:if test="${!empty listO }">
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
                        <div class="cardBox divBox"> <!-- 1개 -->
                        
                           <h4><b>${listO[countO].ottName}</b></h4>
                           <span>${listO[countO].paTitle}</span> <br />
                           <span id="endDate">파티 종료일 : ${listO[countO].endDate}</span><br/><br/>
                           
                           
                        <br>
                          <button class="joinBtn2" data-bs-toggle="modal" data-bs-target="#idModal${countO}">파티장평가</button>
                    </div>
                 <input type="hidden" id="paNo${countO}" value="${listO[countO].paNo}"/>
                      <!-- 파티장 평가 모달창 -->
                   <div class="modal fade" id="idModal${countO}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                     <div class="modal-dialog modal-dialog-centered">
                       <div class="modal-content">
                         <div class="modal-header">
                           <h1 class="modal-title fs-5" id="exampleModalLabel">파티장 평가</h1>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                         </div>
                         <div class="modal-body">
                        
                           <h2>파티장 닉네임 : ${listO[countO].memNickname}</h2>
                           <br /><br />
                        <c:set var="paNo" value="${listO[countO].paNo}"/>
                        
                        <button type="button" class="firstBtn" onclick="likeBtn(${paNo});"><i class="fa-regular fa-thumbs-up fa-2x"></i></button>
                        <button type="button" class="secondBtn" onclick="badBtn(${paNo});"><i class="fa-regular fa-thumbs-down fa-2x"></i></button>
                        
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
         </c:if>
       </section>
      </div>
    </section>
    
    <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
   <script>
      function likeBtn(paNo){
         console.log(paNo+"번방 실행됨");
         location.href = "${contextPath}/partyLikeEvaluate.py?paNo="+paNo;         
      }

      function badBtn(paNo){
         console.log(paNo+"번방 실행됨");
         location.href = "${contextPath}/partyBadEvaluate.py?paNo="+paNo;
      }

      $(function(){
         if('${flag}' == 'showAlert'){
            Swal.fire({
               icon:'error',
               title: "이미 평가하셨습니다."
            });
         } else if ('${flag2}' == 'showAlert2'){
            Swal.fire({
               icon:'success',
               title: "좋아요 등록 완료."
            });
         } else if ('${flag3}' == 'showAlert3'){
            Swal.fire({
                  icon:'error',
                  title: "좋아요 등록 실패."
            });
         } else if ('${flag4}' == 'showAlert4'){
            Swal.fire({
               icon:'success',
               title: "싫어요 등록 완료."
            });
         } else if ('${flag5}' == 'showAlert5') { 
            Swal.fire({
                  icon:'error',
                  title: "싫어요 등록 실패."
            });
         }
         });

   </script>
   
    
    <script src="resources/js/memberCurrentParty.js" defer></script>
   
</body>
</html>