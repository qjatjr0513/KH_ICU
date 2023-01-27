<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>

<style>
    .title:hover{
        cursor: pointer;
    }
    .content {
        display:  none;
    }
    #collapse-container{
        width:60%;
        margin:auto;
        /* background-color: antiquewhite; */
    }
    
    .btn__account, .btn__party, .btn__pay {
		 background-color: var(--color-purple) !important;
		  padding: 10px !important;
		  width: 200px !important;
		  border-radius: 10px !important;
		  font-size: 20px !important;
		  font-weight: bold !important;
		}
		
	.faq > button:hover {
		  background-color: var(--color-purple);
		}
	.faq > button:active {
		  background-color: var(--color-purple) !important;
		}
    #FAQ > h1 {
	  margin-top: 180px;
	  /* background-color: aquamarine; */
	}
</style>
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
	<!-- Logo -->
    <div id="FAQ">
      <h1 style="text-align: center;">FAQ</h1>
    </div>
	
	<br>
	<div style="text-align: center;">
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
    const cardDisplay1 = document.querySelector('.card__display1');
    const cardDisplay2 = document.querySelector('.card__display2');
    const cardDisplay3 = document.querySelector('.card__display3');
    
    let btnAccount = document.querySelector('.btn__account');
    let btnParty = document.querySelector('.btn__party');
    let btnPay = document.querySelector('.btn__pay');

    btnParty.addEventListener('click', () => {
        cardDisplay1.style.display = 'none';
        cardDisplay3.style.display = 'none';
        cardDisplay2.style.display = 'block';
        // cardDisplay2.style.transition = 'all 1s ease-in-out';
    })
    btnAccount.addEventListener('click', () => {
        cardDisplay2.style.display = 'none';
        cardDisplay3.style.display = 'none';
        cardDisplay1.style.display = 'block';
        // cardDisplay1.style.transition = 'all 1s ease-in-out';
    })
    btnPay.addEventListener('click', () => {
        cardDisplay1.style.display = 'none';
        cardDisplay2.style.display = 'none';
        cardDisplay3.style.display = 'block';
        // cardDisplay3.style.transition = 'all 1s ease-in-out';
    })


</script>
</body>
</html>