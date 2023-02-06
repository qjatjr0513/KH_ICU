<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/admin_05-1_contentsEnroll.css" />	
    
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>

    <form id="contentEnroll" action="${contextPath }/contentEnroll" encType="multipart/form-data" method="post">
	<!-- 컨텐츠 등록 -->
    <section id="contentsEnroll">
      <h2>컨텐츠 등록</h2>
      <hr />
      <div class="header-box">
        <div class="leftBox">
          <div class="left-box1">
            <select name="conCategory" id="category" class="form-select" aria-label="Default select example">
              <option value="1" selected>영화</option>
              <option value="2">드라마</option>
            </select>
            <br>
            <span>플랫폼 : </span><br>
            <input id="netflix" type="checkbox" name="ott" value="1" />
            <label for="netflix">넷플릭스</label>
            <input id="watcha" type="checkbox" name="ott" value="4" />
            <label for="watcha">왓챠</label>
			<input id="wavve" type="checkbox" name="ott" value="2" />	
            <label for="wavve">웨이브</label>
            <input id="disney" type="checkbox" name="ott" value="3" />
            <label for="disney">디즈니 +</label>
            <input id="apple" type="checkbox" name="ott" value="5" />
            <label for="apple">애플 TV</label>
            
            <div class="input__title">
              <input id="conKTitle" name="conKTitle" type="text" placeholder="제목을 입력하세요." required/>
              <br />
              <input id="conETitle" name="conETitle" type="text" placeholder="제목(영어)를 입력하세요." required/>
            </div>
          </div>
          <!-- 영화 left-box2 -->
          <div class="left-box-movie">
            <span>개봉 날짜 : </span
            ><input type="date" name="conDate"/><br><br>
            <span>관람 연령 : </span
            ><select name="conAge" class="form-select" aria-label="Default select example">
              <option selected>연령 제한 선택</option>
              <option value="0">전체이용가</option>
              <option value="12">12세 미만 관람불가</option>
              <option value="15">15세 미만 관람불가</option>
              <option value="19">19세 미만 관람불가</option>
            </select>
            <br>
            <span>장르 : </span><br>
            <input id="action" type="checkbox" name="genre" value="1" />
            <label for="action">액션</label>
            <input id="drama" type="checkbox" name="genre" value="2" />
            <label for="drama">드라마</label>
            <input type="checkbox" id="sf" name="genre" value="3">
            <label for="sf">SF</label>
            <input type="checkbox" id="fantasy" name="genre" value="4">
            <label for="fantasy">판타지</label>
            <input type="checkbox" id="romance" name="genre" value="5">
            <label for="romance">로맨스</label>
            <input id="horror" type="checkbox" name="genre" value="6" />
            <label for="horror">공포</label>
            <input type="checkbox" id="thriller" name="genre" value="7">
            <label for="thriller">스릴러</label>
            <input type="checkbox" id="family" name="genre" value="8">
            <label for="family">가족</label>
            <input type="checkbox" id="animation" name="genre" value="9">
           	<label for="animation">애니메이션</label>
            <input id="comedy" type="checkbox" name="genre" value="10" />
            <label for="comedy">코메디</label>
            <input type="checkbox" id="romance" name="genre" value="11">
            <label for="romance">다큐</label>
            <br>         
            
            <span id="info">상영시간 : <input type="text" size="4"/> min</span><br />
          </div>

          <br />
        </div>
        <div class="right-box">
          <input type="file" id="imgInput" name="poster"/><br />
          <img id="image_section" src='' />
        </div>
      </div>
      <hr />
      <!-- 예고편 url -->
      <div class="trailer-container">
        <input type="text" name="conPreview" class="formControl" placeholder="예고편 url주소 입력." aria-label="Recipient's username" required/>
        <button class="btn btn-outline-secondary" type="button" id="button-addon2">
          <i class="fa-solid fa-magnifying-glass fa-lg"></i>
        </button>
      </div>
      <hr />
      <!-- 감독, 배우, 줄거리 -->
      <div class="contents-info">
        <span>감독 : <input type="text" name="conDirector" placeholder="감독 이름 입력" required/></span>
        <br />
        <span>배우 : #갓대웅 <input type="text" name="conActor" required/></span>
        <br />
        <span>줄거리 <br /><textarea name="conSynop" id="" cols="50" rows="7" required></textarea></span>
      </div>
      
      <br />
      <div class="btnGroup">
        <button class="contents-btn">취소</button>
        <button type="submit" class="contents-btn">저장</button>
      </div>
    </section>
    </form>
    
    
    <script>
    	$(function(){

    		$("[name=conAge]").attr("required", true);
    		
    		$("#category").change(function(){
    			if($("#category option:selected").val() == 1){
    				$('#image_section').attr('src', '');
    				$("#info").html('상영 시간 : <input type="text" name="conInfo" size="4" required/> min');
    				$("#contentEnroll")[0].reset();
    				$("#category").val("1").prop("selected", true);
    			}
    			else{
    				$('#image_section').attr('src', '');
    				$("#info").html('시즌/부작 : <input type="text" name="conInfo" size="4" required/> 부작');
    				$("#contentEnroll")[0].reset();
	    			$("#category").val("2").prop("selected", true);
    			}
    		});
    	})
    	
    	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
			  
				reader.onload = function (e) {
					$('#image_section').attr('src', e.target.result);  
				}
			  
				reader.readAsDataURL(input.files[0]);
			}
		}
			 
			
		$("#imgInput").change(function(){
			if($("#imgInput").val() == ''){
				$('#image_section').attr('src', '');
			}
			readURL(this);
		});
    </script>
  </body>
</html>