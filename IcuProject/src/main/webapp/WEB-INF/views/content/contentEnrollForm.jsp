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
              <option selected>장르 선택</option>
              <option value="1">영화</option>
              <option value="2">드라마</option>
            </select>
            <div class="input__title">
              <input type="text" placeholder="제목을 입력하세요." />
              <br />
              <input type="text" placeholder="제목(영어)를 입력하세요." />
            </div>
          </div>

          <!-- 영화 left-box2 -->
          <div class="left-box2">
            <span>개봉 연도 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>장르 선택</option>
              <option value="1">영화</option>
              <option value="2">드라마</option>
            </select>
            <span>관람 연령 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>장르 선택</option>
              <option value="1">영화</option>
              <option value="2">드라마</option>
            </select>
            <span>장르</span>
            <input id="action" type="checkbox" />
            <label for="action">액션</label>
            <input id="action" type="checkbox" />
            <label for="action">드라마</label>
            <input id="action" type="checkbox" />
            <label for="action">코미디</label>
            <input id="action" type="checkbox" />
            <label for="action">공포</label>
            <br />
            <span>상영시간 : <input type="text" /></span><br />
            <span>개봉날짜 : <input type="text" /></span>
          </div>

          <br />

          <!-- 드라마 left-box2 -->
          <div class="left-box2">
            <span>방영 연도 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>장르 선택</option>
              <option value="1">영화</option>
              <option value="2">드라마</option>
            </select>
            <span>관람 연령 : </span
            ><select class="form-select" aria-label="Default select example">
              <option selected>장르 선택</option>
              <option value="1">영화</option>
              <option value="2">드라마</option>
            </select>
            <span>장르</span>
            <input id="action" type="checkbox" />
            <label for="action">액션</label>
            <input id="action" type="checkbox" />
            <label for="action">드라마</label>
            <input id="action" type="checkbox" />
            <label for="action">코미디</label>
            <input id="action" type="checkbox" />
            <label for="action">공포</label>
            <br />
            <span>상영시간 : <input type="text" /></span><br />
            <span>개봉날짜 : <input type="text" /></span>
          </div>
        </div>
        <div class="right-box">
          <input type="file" /><br />
          <img src="https://images.justwatch.com/poster/176267183/s592/avatar" />
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
  </body>
</html>