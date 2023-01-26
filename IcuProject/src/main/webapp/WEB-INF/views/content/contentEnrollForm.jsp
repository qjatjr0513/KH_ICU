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

	<!-- 컨텐츠 등록 -->
    <section id="contentsEnroll">
      <h2>컨텐츠 등록</h2>
      <hr />
      <div class="header-box">
        <div class="leftBox">
          <div class="left-box1">
            <select class="form-select" aria-label="Default select example">
              <option value="1" selected>영화</option>
              <option value="2">드라마</option>
            </select>
            <div class="input__title">
              <input type="text" placeholder="제목을 입력하세요." />
              <br />
              <input type="text" placeholder="제목(영어)를 입력하세요." />
            </div>
          </div>

          <!-- 영화 left-box2 -->
          <div class="left-box-movie">
            <span>개봉 연도 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>연도 선택</option>
              <option value="1">액션</option>
              <option value="2">드라마</option>
            </select>
            <span>관람 연령 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>연령 제한 선택</option>
              <option value="0">전체이용가</option>
              <option value="12">12세 미만 관람불가</option>
              <option value="15">15세 미만 관람불가</option>
              <option value="19">19세 미만 관람불가</option>
            </select>
            <span>장르</span>
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
            <label for="thriller">스릴러</label><br>
            <input type="checkbox" id="family" name="genre" value="8">
            <label for="family">가족</label>
            <input type="checkbox" id="animation" name="genre" value="9">
           	<label for="animation">애니메이션</label>
            <input id="comedy" type="checkbox" name="genre" value="10" />
            <label for="comedy">코메디</label>
            <input type="checkbox" id="romance" name="genre" value="11">
            <label for="romance">다큐</label>
            <br />
            <span>상영시간 : <input type="text" /></span><br />
            <span>개봉날짜 : <input type="text" /></span>
          </div>

          <br />

          <!-- 드라마 left-box2 -->
          <div class="left-box-drama">
            <span>방영 연도 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>장르 선택</option>
              <option value="1">영화</option>
              <option value="2">드라마</option>
            </select>
            <span>관람 연령 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>연령 제한 선택</option>
              <option value="0">전체이용가</option>
              <option value="12">12세 미만 관람불가</option>
              <option value="15">15세 미만 관람불가</option>
              <option value="19">19세 미만 관람불가</option>
            </select>
            <span>장르</span>
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
            <label for="thriller">스릴러</label><br>
            <input type="checkbox" id="family" name="genre" value="8">
            <label for="family">가족</label>
            <input type="checkbox" id="animation" name="genre" value="9">
           	<label for="animation">애니메이션</label>
            <input id="comedy" type="checkbox" name="genre" value="10" />
            <label for="comedy">코메디</label>
            <input type="checkbox" id="romance" name="genre" value="11">
            <label for="romance">다큐</label>
            <br />
            <span>상영시간 : <input type="text" /></span><br />
            <span>개봉날짜 : <input type="text" /></span>
          </div>
        </div>
        <div class="right-box">
          <input type="file" id="imgInput"/><br />
          <img id="image_section" src="https://images.justwatch.com/poster/176267183/s592/avatar" />
        </div>
      </div>
      <hr />
      <!-- 예고편 url -->
      <div class="trailer-container">
        <input type="text" class="formControl" placeholder="예고편 url주소 입력." aria-label="Recipient's username" />
        <button class="btn btn-outline-secondary" type="button" id="button-addon2">
          <i class="fa-solid fa-magnifying-glass fa-lg"></i>
        </button>
      </div>
      <hr />
      <!-- 감독, 배우, 줄거리 -->
      <div class="contents-info">
        <span>감독 : <input type="text" placeholder="감독 이름 입력" /></span>
        <br />
        <span>배우 : #갓대웅 <input type="text" /></span>
        <br />
        <span>줄거리 <br /><textarea name="" id="" cols="50" rows="7"></textarea></span>
      </div>
      <br />
      <div class="btnGroup">
        <button class="contents-btn">취소</button>
        <button class="contents-btn">저장</button>
      </div>
    </section>
    
    <script>
    	$(function(){
    		$(".left-box-drama").css('display', 'none');
    		
    		$(".form-select").change(function(){
    			if($(".form-select option:selected").val() == 1){
		    		$(".left-box-movie").css('display', 'block');	
		    		$(".left-box-drama").css('display', 'none');
    			}
    			else{
    				$(".left-box-movie").css('display', 'none');
    				$(".left-box-drama").css('display', 'block');
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
			readURL(this);
		});
    </script>
  </body>
</html>