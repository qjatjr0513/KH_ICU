<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 회원가입</title>
<!-- bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <!-- animate.css -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <!-- 웹사이트에 아이콘 추가 -->
    <link rel="icon" type="image/png" href="resources/images/navbarLogo.png" />

    <!-- Font Awesome cdn -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- css -->
    <link rel="stylesheet" href="resources/css/05_enrollForm2.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- Alert 창  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
	<!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>

    <!-- 회원정보 입력 -->
    <form id="memberEnroll" action="${contextPath }/insert.me" method="post">
      <table>
        <tr>
          <td><label>이름</label></td>
          <td><input type="text" placeholder="사용자 이름" name="memName" required/></td>
          <td><label>&nbsp;&nbsp;생년월일</label></td>
          <td><input type="date" name="birthDay"/></td>
        </tr>
        <tr>
          <td><label for="">아이디</label></td>
          <td><input type="text" placeholder="아이디" name="memId" required/></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              onclick="idCheck();"
            >
              중복확인
            </button>
          </td>
          <td></td>
        </tr>
        <tr>
          <td><label>닉네임</label></td>
          <td><input type="text" placeholder="닉네임" name="memNickname" required/></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              onclick="nickCheck();"
            >
              중복확인
            </button>
          </td>
          <td></td>
        </tr>
        <tr>
          <td><label>비밀번호</label></td>
          <td><input type="password" id="memPwd" placeholder="비밀번호" name="memPwd" required/></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><label></label>비밀번호 확인</td>
          <td><input type="password" id="memPwdCheck" placeholder="비밀번호 확인" /></td>
          <td><font id="chkNotice" size="3"></font></td>
          <td></td>
        </tr>
        <tr>
          <td><label>휴대폰 번호</label></td>
          <td><input type="text" placeholder="010-0000-0000" name="phone" required/></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              onclick="sendMessage();"
            >
              인증번호 전송
            </button>
          </td>
          <td></td>
        </tr>
        <tr>
          <td><label>인증번호</label></td>
          <td><input type="text" placeholder="인증번호 확인" id="authNum" required/></td>
          <td><font id="chkAuth" size="3"></font></td>
          <td></td>
        </tr>
      </table>

      <div class="btn__group">
        <button type="button" onclick="location.href='${contextPath }/loginForm.me'">취소</button>
        <button type="button" onclick="btnEnroll();" disabled name="enroll">회원가입</button>
      </div>
    </form>
   
  </body>
    <script>
    function sendMessage(){
    	let $sms = $("#memberEnroll input[name=phone]");
    	
    	$.ajax({
    		url : "${contextPath }/sendMessage.do",
    		data : {phoneNum : "+82"+$sms.val()},
            success : function(result){	
            	
            	Swal.fire({
                    icon: 'success',
                    title: '인증번호 전송완료!'                  
                });
            	
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
                        $("button:button[name=enroll]").attr("disabled",false);
                      }

                  });	
                });
            },
            error : function(){
                alert("인증번호 전송 실패");
             }
        });
     }
    
    
    function idCheck(){
        // 아이디 입력하는 input 요소 객체
        let $memberId = $("#memberEnroll input[name=memId]");
        let regExp = /^[a-z][a-z\d]{3,11}$/;
        
        $.ajax({
           url : "idCheck.me",
           data : {checkId : $memberId.val()},
           success : function(result){
        	   
        	   if($memberId.val() == "") {
        		   
        		   Swal.fire({
                       icon: 'error',
                       title: '아이디를 입력해주세요.'
                       
                   });

                   $memberId.focus();
                   
               }
        	   
        	   else if(!regExp.test($memberId.val())){
              	 Swal.fire({
                       icon: 'error',
                       title: '유효한 아이디를 입력해주세요.'                  
                   });
              	 
               }else if(result == 1){ // 사용불가능한 아이디
            	   
            	   Swal.fire({
                       icon: 'error',
                       title: '이미 존재하는 아이디입니다.'
                       
                   });
                 $memberId.focus();
                 
              }else{
                 
            	  Swal.fire({
                      title: '사용가능한 아이디입니다.',
                      text: '사용하시겠습니까?',
                      icon: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: '사용',
                      cancelButtonText: '취소'
                  }).then((result) => {
                	  if(result.isConfirmed){
                          $("input[name=memId]").attr("readonly", true);
                       }  
                	  
                  });
              }
           },
           error : function(){
              alert("아이디 중복체크용 ajax 통신 실패");
           }
        });
     }
    
    function nickCheck(){
        // 아이디 입력하는 input 요소 객체
        let $memberNick = $("#memberEnroll input[name=memNickname]");
        let regExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
        
        $.ajax({
           url : "nickCheck.me",
           data : {checkNick : $memberNick.val()},
           success : function(result){
        	   
        	   if($memberNick.val() == "") {
        		   
        		   Swal.fire({
                       icon: 'error',
                       title: '닉네임을 입력해주세요.'
                       
                   });

                   $memberNick.focus();
                   
               }
        	   
        	   else if(!regExp.test($memberNick.val())){
              	 Swal.fire({
                       icon: 'error',
                       title: '유효한 닉네임을 입력해주세요.'                  
                   });
              	 
               }else if(result == 1){ // 사용불가능한 닉네임
            	   
            	   Swal.fire({
                       icon: 'error',
                       title: '이미 존재하는 닉네임입니다.'
                       
                   });
                 $memberNick.focus();
                 
              }else{
                 
            	  Swal.fire({
                      title: '사용가능한 닉네임입니다.',
                      text: '사용하시겠습니까?',
                      icon: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: '사용',
                      cancelButtonText: '취소'
                  }).then((result) => {
                	  if(result.isConfirmed){
                          $("input[name=memNickname]").attr("readonly", true);
                       }  
                	  
                  });
              }
           },
           error : function(){
              alert("닉네임 중복체크용 ajax 통신 실패");
           }
        });
     }
   
    
    $(function(){
        $('#memPwd').keyup(function(){
          $('#chkNotice').html('');
        });

        $('#memPwdCheck').keyup(function(){

            if($('#memPwd').val() != $('#memPwdCheck').val()){
              $('#chkNotice').html('비밀번호 일치하지 않음');
              $('#chkNotice').attr('color', '#FF0000');
            } else{
              $('#chkNotice').html('비밀번호 일치함');
              $('#chkNotice').attr('color', '#01DF01');
            }

        });
    });
    
    function btnEnroll(){
        
   	 let regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*]).{8,15}$/i;
   	 
   		if($('input[name=memName]').val() == ""){
  		 Swal.fire({
               icon: 'error',
               title: '이름을 입력해주세요.'                  
           });
  		 
  		} else if($('input[name=birthDay]').val() == ""){
  	   		 Swal.fire({
                 icon: 'error',
                 title: '생년월일을 입력해주세요.'                  
             });
      	}else if($('input[name=memId]').val() == ""){
  	   		 Swal.fire({
                 icon: 'error',
                 title: '아이디를 입력해주세요.'                  
             });
      	}else if($('input[name=memNickname]').val() == ""){
  	   		 Swal.fire({
                 icon: 'error',
                 title: '닉네임을 입력해주세요.'                  
             });
      	} else if(!regExp.test($('input[name=memPwd]').val())){
            Swal.fire({
                icon: 'error',
                title: '유효한 비밀번호를 입력해주세요.'                  
            });
            $('input[name=memPwd]').val()="";
            $('input[name=memPwd]').focus();
        }   else if($('input[name=memPwd]').val() == ""){
   		 Swal.fire({
                icon: 'error',
                title: '비밀번호를 입력해주세요.'                  
            });
   	 } else if($('input[id=memPwdCheck]').val() == ""){
   		 Swal.fire({
                icon: 'error',
                title: '비밀번호확인을 입력해주세요.'                  
            });
   	 } else if($('input[name=phone]').val() == ""){
   		 Swal.fire({
                icon: 'error',
                title: '휴대폰번호를 입력해주세요.'                  
            });
   	 }else if($('input[id=authNum]').val() == ""){
      		 Swal.fire({
                 icon: 'error',
                 title: '인증번호를 입력해주세요.'                  
             });
         }else {
   		 Swal.fire({
                title: '회원가입 하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '가입',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                          title: '가입이 완료되었습니다.',
                          text: '로그인 화면으로 이동합니다.',
                          icon:'success',
                          customClass: {
                              confirmButton: 'swal2-confirm swal2-styled swal2-jong',
                              cancelButton: 'btn btn-danger'
                            },    
                    }).then((result) => {
                   	 
                       if(result.isConfirmed){
                       	
                        $("#memberEnroll").submit();
                       }                                   
                    });
                }
            });
   	 }
     }
    
    </script>
    
    
     
</html>