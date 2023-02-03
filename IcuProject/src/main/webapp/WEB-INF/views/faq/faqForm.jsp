<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - FAQ</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/faqForm.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <div class='titleImg' style='width:1898px; height:523px; margin-top:50px;'></div>
    
	<!-- Logo -->
    <div id="FAQ">
      <h1 class='titleText' style="text-align: center;">FAQ</h1>
    </div>
	
	<br>
	<div style="text-align: center; height:500px;">
	    <p class="faq">
	        <button class="btn btn-primary btn__account"  type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	            계정 문의
	        </button>
	        <button class="btn btn-primary btn__party" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
	            파티 문의
	        </button>
	        <button class="btn btn-primary btn__pay" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">
	            결제 문의
	        </button>
	      </p>
	
	    <section id="collapse-container">
	      <div class="collapse show" id="collapseExample" >
	        <div class="card card-body card__display1">
	            <h1 style="text-align:left;">계정 문의</h1>
	            <div class="accordion" id="accordionExample">
	            
	            <c:forEach var="f" items="${list}" varStatus="i">
	            	<c:if test="${f.faqType == 'AC' }">
	                <div class="accordion-item">
	                  <h2 class="accordion-header" id="heading${i.count}">
	                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#account${i.count}" aria-expanded="false" aria-controls="account${i.count}">
	                        ${f.faqTitle}
	                    </button>
	                  </h2>
	                  <div id="account${i.count}" class="accordion-collapse collapse" aria-labelledby="heading${i.count}" data-bs-parent="#accordionExample">
	                    <div class="accordion-body">
	                     ${f.faqContent }
	                    </div>
	                  </div>
	                </div>
	                </c:if>
	             </c:forEach>         
	             </div>
	        </div> 
	      </div>
	    </section>
	      
	      
	   <section id="collapse-container">
	      <div class="collapse" id="collapseExample2" >
	        <div class="card card-body card__display2">
	            <h1 style="text-align:left;">파티 문의</h1>
	            <div class="accordion" id="accordionExample">
	            
	            <c:forEach var="f" items="${list}" varStatus="i">
	            	<c:if test="${f.faqType == 'PY' }">
	                <div class="accordion-item">
	                  <h2 class="accordion-header" id="heading${i.count}">
	                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#account${i.count}" aria-expanded="false" aria-controls="account${i.count}">
	                        ${f.faqTitle}
	                    </button>
	                  </h2>
	                  <div id="account${i.count}" class="accordion-collapse collapse" aria-labelledby="heading${i.count}" data-bs-parent="#accordionExample">
	                    <div class="accordion-body">
	                     ${f.faqContent }
	                    </div>
	                  </div>
	                </div>
	                </c:if>
	             </c:forEach>         
	             </div>
	        </div> 
	      </div>
	    </section>
	
	    
	   
	    <section id="collapse-container">
	      <div class="collapse" id="collapseExample3" >
	        <div class="card card-body card__display3">
	            <h1 style="text-align:left;">결제 문의</h1>
	            <div class="accordion" id="accordionExample">
	            
	            <c:forEach var="f" items="${list}" varStatus="i">
	            	<c:if test="${f.faqType == 'PA' }">
	                <div class="accordion-item">
	                  <h2 class="accordion-header" id="heading${i.count}">
	                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#account${i.count}" aria-expanded="false" aria-controls="account${i.count}">
	                        ${f.faqTitle}
	                    </button>
	                  </h2>
	                  <div id="account${i.count}" class="accordion-collapse collapse" aria-labelledby="heading${i.count}" data-bs-parent="#accordionExample">
	                    <div class="accordion-body">
	                     ${f.faqContent }
	                    </div>
	                  </div>
	                </div>
	                </c:if>
	             </c:forEach>         
	             </div>
	        </div> 
	      </div>
	    </section>
	</div>
<script>
    const cardDisplay1 = document.querySelector('#collapseExample');
    const cardDisplay2 = document.querySelector('#collapseExample2');
    const cardDisplay3 = document.querySelector('#collapseExample3');
    
    let btnAccount = document.querySelector('.btn__account');
    let btnParty = document.querySelector('.btn__party');
    let btnPay = document.querySelector('.btn__pay');

    btnParty.addEventListener('click', () => {
        cardDisplay1.classList.remove('show'); 
  	    cardDisplay2.classList.add('show');
        cardDisplay3.classList.remove('show');
  })
    
    btnPay.addEventListener('click', () => {
    	  cardDisplay3.classList.add('show');
          cardDisplay1.classList.remove('show');
          cardDisplay2.classList.remove('show');
    })
   

    btnAccount.addEventListener('click', () => {
        cardDisplay1.classList.add('show');
        cardDisplay2.classList.remove('show');
        cardDisplay3.classList.remove('show');
      
    })

</script>
</body>
</html>