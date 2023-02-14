<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 아이디 / 비밀번호 찾기</title>
	 <!-- css -->
    <link rel="stylesheet" href="${contextPath }/resources/css/06_findId.css" />
</head>
<body>
     <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <div class="logoBox">
      <img class="imgLogo" src="resources/images/navbarLogo.png" />
    </div>

    <!-- id찾기 화면 -->
    <section id="idPwdSection ">
      <div class="idPwdBtn">
        <button class="findIdBtn">아이디 찾기</button>
        <button class="findPwdBtn">비밀번호 찾기</button>
      </div>
      <br />
      <div id="findIdBox">
        <div class="input__info">
          <table>
            <tr>
              <td>이름</td>
              <td><input type="text" placeholder="이름을 입력해주세요." id="memName" required/></td>
            </tr>

            <tr>
              <td>휴대폰 번호</td>
              <td><input type="text" placeholder="010-0000-0000" id="phone" required/></td>
              <td>
                <button
                  type="button"
                  class="btn btn-primary tableBtn"
                  data-bs-toggle="modal"
                  data-bs-target="#phoneModal"
                  onclick="sendMessage();"
                >
                  인증번호 전송
                </button>
              </td>
            </tr>
            <tr>
	          <td><label>인증번호</label></td>
	          <td><input type="text" placeholder="인증번호 확인" id="authNum"/></td>
	          <td><font id="chkAuth" size="3"></font></td>
	          <td></td>
	        </tr>
          </table>

          <div class="btn__group">
            <button onclick="location.href='${contextPath}/loginForm.me'">이전</button>
            <!-- <button data-bs-toggle="modal" data-bs-target="#idModal" id="findId" name="findId" onclick="findId();">
              확인
            </button> -->
            <button id="findId" name="findId" onclick="findId(); " disabled>
              확인
            </button>
          </div>
        </div>
      </div>

      <!-- 비밀번호 -->
      <div id="findPwdBox">
        <div class="input__info">

          <table>
            <tr>
              <td>아이디</td>
              <td>
                <input type="text" placeholder="아이디를 입력해주세요." id="id" />
              </td>
            </tr>
			
            <tr>
              <td>이메일</td>
              <td><input type="text" placeholder="가입된 이메일을 입력해주세요"  id="email" required/></td>
              <td>
                <!-- <button
                  type="button"
                  class="btn btn-primary tableBtn"
                  data-bs-toggle="modal"
                  data-bs-target="#phoneModal"
                  onclick="sendMessage();"
                >
                  인증번호 전송
                </button> -->
              </td>
            </tr>
            <!-- <tr>
	          <td><label>인증번호</label></td>
	          <td><input type="text" placeholder="인증번호 확인" id="authNum" required/></td>
	          <td><font id="chkAuth" size="3"></font></td>
	          <td></td>
	        </tr> -->
          </table>
		  <div style="text-align:center; margin:auto;">
		  	<h5 style="font-size:15px; color:red; font-weight:bold;">* 가입된 이메일로 임시비밀번호가 발송됩니다!</h5>
		  </div>
          <div class="btn__group">
            <button onclick="location.href='${contextPath}/loginForm.me'">이전</button>
            <button data-bs-toggle="modal" data-bs-target="#pwdModal" id="findBtn">
              확인
            </button>
          </div>
        </div>
      </div>
    </section>

	<script>
	 function sendMessage(){
	    	let $sms = $("#phone");
	    	
	    	$.ajax({
	    		url : "${contextPath }/sendMessage.do",
	    		data : {phoneNum : $sms.val()},
	            success : function(result){	
	            	if(result > 0){
		            	Swal.fire({
		                    icon: 'success',
		                    title: '인증번호 전송완료!'                  
		                });	
	            	}else{
	            		Swal.fire({
	                        icon: 'error',
	                        title: '인증번호 전송실패!'                  
	                    });
	            	}
	            	
	            	
	            	$(function(){
	             	$('#authNum').keyup(function(){
	                    $('#chkAuth').html('');
	                  });

	                  $('#authNum').keyup(function(){

	                      if($('#authNum').val() != result ){
	                        $('#chkAuth').html('인증번호 일치하지 않음');
	                        $('#chkAuth').attr('color', '#FF0000');
	                      } else{
	                        $('#chkAuth').html('인증번호 일치함');
	                        $('#chkAuth').attr('color', '#01DF01');
	                        $("button:button[name=findId]").attr("disabled",false);
	                        $("button:button[name=findPwd]").attr("disabled",false);
	                      }

	                  });	
	                });
	            },
	            error : function(){
	            	Swal.fire({
                        icon: 'error',
                        title: '인증번호 전송실패!'                  
                    });
	             }
	        });
	     }
	 
	 function findId(){
	        // 아이디 입력하는 input 요소 객체
	        let $memberName = $("#memName");
	        let $phone = $("#phone");
	        
	        $.ajax({
	           url : "${contextPath}/findId",
	           data : {memName : $memberName.val(),
	        	   	   phone : $phone.val()},
	           success : function(result){
	        	   if(result == ""){
	        		   Swal.fire({
	        		   		icon:'error',
		        	   		title: "존재하지 않는 회원 입니다."
		        	   });	
	        	   }else{
	        		   Swal.fire({
	        			    icon : 'info', 
	        		   		title:'회원 아이디',
		        	   		text: result
		        	   });	
	        	   }     
	           },
	           error : function(){
	              alert("아이디 중복체크용 ajax 통신 실패");
	           }
	        });
	     }
	 
	 
	 $(function(){
			$("#findBtn").click(function(){
				$.ajax({
					url : "${contextPath}/findPwd",
					type : "POST",
					data : {
						id : $("#id").val(),
						email : $("#email").val()
					},
					success : function(result) {
						if(result == 2){
							Swal.fire({
		        		   		icon:'success',
			        	   		title: "임시비밀번호 발송완료!."
			        	   });
							
						}else if(result == 1){
							Swal.fire({
		        		   		icon:'error',
			        	   		title: "등록되지 않은 이메일 입니다."
			        	   });
						}else if(result == 0){
							Swal.fire({
		        		   		icon:'error',
			        	   		title: "등록되지 않은 아이디 입니다."
			        	   });
						}
					}
				})
			});
		})
	</script>
    <script src="${contextPath }/resources/js/06_findId.js" defer></script>
  </body>
</html>