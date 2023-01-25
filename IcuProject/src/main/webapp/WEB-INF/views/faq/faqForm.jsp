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
	      <div class="collapse" id="collapseExample" >
	        <div class="card card-body card__display1">
	            <h1 style="text-align:left;">계정 문의</h1>
	            <div class="accordion" id="accordionExample">
	                <div class="accordion-item">
	                  <h2 class="accordion-header" id="headingOne">
	                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accountOne" aria-expanded="true" aria-controls="accountOne">
	                        <div class="accordion-body">
	                            <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                          </div>
	                    </button>
	                  </h2>
	                  <div id="accountOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	                    <div class="accordion-body">
	                      <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                    </div>
	                  </div>
	                </div>
	                <div class="accordion-item">
	                  <h2 class="accordion-header" id="headingTwo">
	                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accountTwo" aria-expanded="false" aria-controls="accountTwo">
	                      Accordion Item #2
	                    </button>
	                  </h2>
	                  <div id="accountTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	                    <div class="accordion-body">
	                      <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                    </div>
	                  </div>
	                </div>
	                <div class="accordion-item">
	                  <h2 class="accordion-header" id="headingThree">
	                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accountThree" aria-expanded="false" aria-controls="accountThree">
	                      Accordion Item #3
	                    </button>
	                  </h2>
	                  <div id="accountThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	                    <div class="accordion-body">
	                      <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                    </div>
	                  </div>
	                </div>
	              </div>
	        </div> 
	      </div>
	    
	      
	      
	   
	    <div class="collapse" id="collapseExample2" >
	      <div class="card card-body card__display2">
	      	<h1 style="text-align:left;">파티 문의</h1>
	          <div class="accordion" id="accordionExample">
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingOne">
	                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#partyOne" aria-expanded="true" aria-controls="partyOne">
	                    파티문의
	                  </button>
	                </h2>
	                <div id="partyOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                    <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                  </div>
	                </div>
	              </div>
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingTwo">
	                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#partyTwo" aria-expanded="false" aria-controls="partyTwo">
	                    Accordion Item #2
	                  </button>
	                </h2>
	                <div id="partyTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                    <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                  </div>
	                </div>
	              </div>
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingThree">
	                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#partyThree" aria-expanded="false" aria-controls="partyThree">
	                    Accordion Item #3
	                  </button>
	                </h2>
	                <div id="partyThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                    <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                  </div>
	                </div>
	              </div>
	            </div>
	      </div> 
	    </div>
	
	    
	   
	    <div class="collapse" id="collapseExample3" >
	      <div class="card card-body card__display3">
	      <h1 style="text-align:left;">결제 문의</h1>
	          <div class="accordion" id="accordionExample">
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingOne">
	                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#payOne" aria-expanded="true" aria-controls="payOne">
	                    결제 문의
	                  </button>
	                </h2>
	                <div id="payOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                    <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                  </div>
	                </div>
	              </div>
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingTwo">
	                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#payTwo" aria-expanded="false" aria-controls="payTwo">
	                    Accordion Item #2
	                  </button>
	                </h2>
	                <div id="payTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                    <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                  </div>
	                </div>
	              </div>
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingThree">
	                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#payThree" aria-expanded="false" aria-controls="payThree">
	                    Accordion Item #3
	                  </button>
	                </h2>
	                <div id="payThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                    <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	                  </div>
	                </div>
	              </div>
	            </div>
	      </div> 
	    </div>
	</div>
	</section>
<!-- <script>
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


</script> -->
</body>
</html>