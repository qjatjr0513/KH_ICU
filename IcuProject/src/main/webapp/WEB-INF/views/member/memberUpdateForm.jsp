<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 회원정보수정</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/24_memberUpdateForm.css" />

   
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <div id="main__logo">
      <h2>회원정보수정</h2>
      <hr><br>
    </div>

    <!-- 회원정보 입력 -->
    <form id="memberUpdate" action="${contextPath }/memUpdate.me" method="post">
      <table>
        <tr>
          <td><label>이름</label></td>
          <td><input type="text" name="memName" value="${loginUser.memName}" readonly/></td>
          <td><label>&nbsp;&nbsp;이메일</label></td>
          <td><input type="email" name="email" value="${loginUser.email}"/></td>
        </tr>
        <tr>
          <td><label for="">아이디</label></td>
          <td><input type="text" name="memId" value="${loginUser.memId}" readonly/></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><label>닉네임</label></td>
          <td><input type="text" name="memNickname" value="${loginUser.memNickname}" required/></td>
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
          <td><input type="text" value="${loginUser.phone}" name="phone" required/></td>
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
        <button type="button" onclick="location.href='${contextPath }/myPage.me'">뒤로가기</button>
        <button type="button" onclick="btnUpdate();" disabled name="update">회원정보 저장</button>
      </div>
    </form>
       
    <!-- 회원정보 입력 -->
    <form id="memberEnroll" action="${contextPath }/insert" method="post">
      <table>
        <tr>
          <td><label>이름</label></td>
          <td><input type="text"  name="memName" value="${loginUser.memName}" readonly/></td>
        </tr>
        <tr>
          <td><label>이메일</label></td>
          <td><input type="email" name="email" /></td>
        </tr>
        <tr>
          <td><label for="">아이디</label></td>
          <td><input type="text"  name="memId" required/></td>
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
          <td><input type="text"  name="memNickname" required/></td>
          <td>
            <button
              type="button"
              class="btn btn-primary tableBtn"
              onclick="nickCheck();"
            >
              중복확인
            </button>
          </td>
          
        </tr>
        <tr>
          <td><label>비밀번호</label></td>
          <td><input type="password" id="memPwd" name="memPwd" placeholder="특수문자,영문,숫자 조합 8자리 이상" required/></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><label></label>비밀번호 확인</td>
          <td><input type="password" id="memPwdCheck" /></td>
          <td><font id="chkNotice" size="3" style="font-size:14px;"></font></td>
          <td></td>
        </tr>
        <tr>
          <td><label>휴대폰 번호</label></td>
          <td><input type="text" placeholder="전화번호 입력" name="phone" required/></td>
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
          <td><font id="chkAuth" size="2" style="font-size:14px;"></font></td>
          <td></td>
        </tr>
      </table>

      <div class="btn__group">
        <button type="button" onclick="location.href='${contextPath }/loginForm.me'">취소</button>
        <button type="reset" >초기화</button>
        <button type="button" onclick="btnEnroll();" disabled name="enroll">회원가입</button>
      </div>
    </form>
    
	<!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
  </body>
    <script>
    function sendMessage(){
    	let $sms = $("#memberUpdate input[name=phone]");
    	
    	$.ajax({
    		url : "${contextPath }/sendMessage.do",
    		data : {phoneNum : $sms.val()},
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
                        $("button:button[name=update]").attr("disabled",false);
                      }

                  });	
                });
            },
            error : function(){
                alert("인증번호 전송 실패");
             }
        });
     }

    function nickCheck(){
        // 아이디 입력하는 input 요소 객체
        let $memberNick = $("#memberUpdate input[name=memNickname]");
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
    
    function btnUpdate(){
        
   	 let regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*]).{8,15}$/i;
   	 
   		if($('input[name=memName]').val() == ""){
  		 Swal.fire({
               icon: 'error',
               title: '이름을 입력해주세요.'                  
           });
  		 
  		} else if(!regExp.test($('input[name=memPwd]').val())){
            Swal.fire({
                icon: 'error',
                title: '유효한 비밀번호를 입력해주세요.'                  
            });
            $('input[name=memPwd]').val()="";
            $('input[name=memPwd]').focus();
        } else if($('input[name=memPwd]').val() == ""){
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
                title: '회원정보를 수정 하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '수정',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                          title: '수정이 완료되었습니다.',
                          text: '로그인 화면으로 이동합니다.',
                          icon:'success',
                          customClass: {
                              confirmButton: 'swal2-confirm swal2-styled swal2-jong',
                              cancelButton: 'btn btn-danger'
                            },    
                    }).then((result) => {
                   	 
                       if(result.isConfirmed){
                       	
                        $("#memberUpdate").submit();
                       }                                   
                    });
                }
            });
   	 }
     }
    
    </script>
     
</html>