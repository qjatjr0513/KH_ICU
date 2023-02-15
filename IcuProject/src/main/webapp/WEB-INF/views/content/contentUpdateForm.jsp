<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="c" value="${content}"/>
<c:set var="g" value="${genre }"/>
<c:set var="o" value="${ott }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 컨텐츠 수정</title>

	<!-- css -->
    <link rel="stylesheet" href="${contextPath }/resources/css/admin_05-1_contentsEnroll.css" />	
    
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>

    <form id="contentUpdate" action="${contextPath }/admin/contentUpdate.ad" encType="multipart/form-data" method="post">
	<!-- 컨텐츠 등록 -->
    <section id="contentsEnroll">
      <h2>컨텐츠 수정</h2>
      <hr />
      <div class="header-box">
        <div class="leftBox">
          <div class="left-box1">
          	<input type="hidden" name="conNo" id="conNo" class="conNo" value="${c.conNo }"/>
            <select name="conCategory" id="category" class="form-select" aria-label="Default select example">
              <option value="1" selected>영화</option>
              <option value="2">드라마</option>
            </select>
            <br>
            <span class='colorBlue'>플랫폼 : </span><br>
            <input id="netflix" type="checkbox" name="ott" value="4" />
            <label for="netflix">넷플릭스</label>
            <input id="watcha" type="checkbox" name="ott" value="4" />
            <label for="watcha">왓챠</label>
			<input id="wavve" type="checkbox" name="ott" value="2" />	
            <label for="wavve">웨이브</label>
            <input id="disney" type="checkbox" name="ott" value="3" />
            <label for="disney">디즈니 +</label>
            <input id="apple" type="checkbox" name="ott" value="5" />
            <label for="apple">애플 TV</label>
            
            <div class="input__title">
              <input id="conKTitle" name="conKTitle" type="text" placeholder="제목을 입력하세요." value="${c.conKTitle }" required/>
              <br />
              <input id="conETitle" name="conETitle" type="text" placeholder="제목(영어)를 입력하세요." value="${c.conETitle }" required/>
            </div>
          </div>
          <!-- 영화 left-box2 -->
          <div class="left-box-movie">
            <span class='colorBlue'>개봉 날짜 : </span
            ><input type="date" name="conDate" value="${c.conDate }"/><br><br>
            <span class='colorBlue'>관람 연령 : </span
            ><select id="age" name="conAge" class="form-select" aria-label="Default select example">
              <option selected>연령 제한 선택</option>
              <option value="0">전체이용가</option>
              <option value="12">12세 미만 관람불가</option>
              <option value="15">15세 미만 관람불가</option>
              <option value="19">19세 미만 관람불가</option>
            </select>
            <br>
            <span class='colorBlue'>장르 : </span><br>
			<input type="checkbox" id="action" name="genre" value="1">
            <label for="action">액션</label>
            <input type="checkbox" id="drama" name="genre" value="2">
            <label for="drama">드라마</label>
            <input type="checkbox" id="sf" name="genre" value="3">
            <label for="sf">SF</label>
            <input type="checkbox" id="fantasy" name="genre" value="4">
            <label for="fantasy">판타지</label>
            <input type="checkbox" id="romance" name="genre" value="5">
            <label for="romance">로맨스</label>
            <input id="entertain" type="checkbox" name="genre" value="6">
            <label for="entertain">예능</label>
            <input type="checkbox" id="thriller" name="genre" value="7">
            <label for="thriller">스릴러</label>
            <input type="checkbox" id="family" name="genre" value="8">
            <label for="family">가족</label>
            <input type="checkbox" id="animation" name="genre" value="9">
           	<label for="animation">애니메이션</label>
            <input type="checkbox" id="comedy" name="genre" value="10">
           	<label for="comdey">코미디</label>
            <input type="checkbox" id="documentary" name="genre" value="11">
            <label for="documentary">다큐</label>
            <input type="checkbox" id="horror" name="genre" value="12">
            <label for="horror">공포</label>
            <input type="checkbox" id="mystery" name="genre" value="13">
            <label for="mystery">미스터리</label>
            <input type="checkbox" id="crime" name="genre" value="14">
            <label for="crime">범죄</label>
            <input type="checkbox" id="music" name="genre" value="15">
            <label for="music">음악</label>
            <input type="checkbox" id="adventure" name="genre" value="16">
            <label for="adventure">모험</label>
            <input type="checkbox" id="war" name="genre" value="17">
            <label for="war">전쟁</label>
            <br>         
            
            <span class='colorBlue' id="info">상영시간 : <input type="text" size="4" value="${c.conInfo }"/> min</span><br />
          </div>

          <br />
        </div>
        <div class="right-box">
          	<input type="file" id="imgInput" name="poster" value="${c.changeName}"/><br />
          	<c:if test="${c.filePath eq '' or c.filePath eq null}">
				<img id="image_section" src="${c.filePath}${c.changeName}"/>
			</c:if>
			<c:if test="${c.filePath ne '' and c.filePath ne null}">
				<img id="image_section" src="${contextPath}/${c.filePath}${c.changeName}"/>
			</c:if>
        </div>
      </div>
      <hr />
      <!-- 예고편 url -->
      <div class="trailer-container">
        <input type="text" name="conPreview" class="formControl" placeholder="예고편 url주소 입력." aria-label="Recipient's username" value="${c.conPreview }" required/>
        <button class="btn btn-outline-secondary" type="button" id="button-addon2">
          <i class="fa-solid fa-magnifying-glass fa-lg"></i>
        </button>
      </div>
      <hr />
      <!-- 감독, 배우, 줄거리 -->
      <div class="contents-info">
        <span>감독 : <input type="text" name="conDirector" placeholder="감독 이름 입력" value="${c.conDirector }" required/></span>
        <br />
        <span>배우 : <input type="text" name="conActor" value="${c.conActor }" required/></span>
        <br />
        <span>줄거리 <br /><textarea name="conSynop" id="conSynop" cols="50" rows="7" required>${c.conSynop }</textarea></span>
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
    		
    		var conCategory = ${c.conCategory};
			var genre = new Array();
			var age = ${c.conAge};
			var ott = new Array();
			
			<c:forEach items="${g}" var="item">
				genre.push("${item}");
			</c:forEach>
			
			<c:forEach items="${o}" var="item">
				ott.push("${item}");
			</c:forEach>	
    		
    		if(conCategory == "1"){
    			$("#category").val("1").prop("selected", true);
    			$("#info").html('상영 시간 : <input type="text" name="conInfo" size="4" value="${c.conInfo }" required/> min');
    		}
    		else{
    			$("#category").val("2").prop("selected", true);
    			$("#info").html('시즌/부작 : <input type="text" name="conInfo" size="4" value="${c.conInfo }" required/> 부작');
    		}
    		
    		for(var i = 0; i < ott.length; i++){
	    		if(ott[i] == 1){
	    			$("#netflix").prop("checked", true);
	    		}  
	    		if(ott[i] == 2){
	    			$("#wavve").prop("checked", true);
	    		}
	    		if(ott[i] == 3){
	    			$("#disney").prop("checked", true);
	    		}
	    		if(ott[i] == 4){
	    			$("#watcha").prop("checked", true);
	    		}
	    		if(ott[i] == 5){
	    			$("#apple").prop("checked", true);
	    		}
    		}
    		
    		for(var i = 0; i < genre.length; i++){
    			if($("#action").next().text() == genre[i]){
    				$("#action").prop("checked", true);
    			}
    			if($("#drama").next().text() == genre[i]){
    				$("#drama").prop("checked", true);
    			}
    			if($("#sf").next().text() == genre[i]){
    				$("#sf").prop("checked", true);
    			}
    			if($("#fantasy").next().text() == genre[i]){
    				$("#fantasy").prop("checked", true);
    			}
    			if($("#romance").next().text() == genre[i]){
    				$("#romance").prop("checked", true);
    			}
    			if($("#entertain").next().text() == genre[i]){
    				$("#entertain").prop("checked", true);
    			}
    			if($("#thriller").next().text() == genre[i]){
    				$("#thriller").prop("checked", true);
    			}
    			if($("#family").next().text() == genre[i]){
    				$("#family").prop("checked", true);
    			}
    			if($("#animation").next().text() == genre[i]){
    				$("#animation").prop("checked", true);
    			}
    			if($("#comedy").next().text() == genre[i]){
    				$("#comedy").prop("checked", true);
    			}
    			if($("#documentary").next().text() == genre[i]){
    				$("#documentary").prop("checked", true);
    			}
    			if($("#horror").next().text() == genre[i]){
    				$("#horror").prop("checked", true);
    			}
    			if($("#mystery").next().text() == genre[i]){
    				$("#mystery").prop("checked", true);
    			}
    			if($("#crime").next().text() == genre[i]){
    				$("#crime").prop("checked", true);
    			}
    			if($("#music").next().text() == genre[i]){
    				$("#music").prop("checked", true);
    			}
    			if($("#adventure").next().text() == genre[i]){
    				$("#adventure").prop("checked", true);
    			}
    			if($("#war").next().text() == genre[i]){
    				$("#war").prop("checked", true);
    			}
    		}
    		
    		if(age == 0){
    			$("#age").val("1").prop("selected", true);
    		}
    		
			if(age == 12){
				$("#age").val("12").prop("selected", true); 			
			}
			    		
			if(age == 15){
				$("#age").val("15").prop("selected", true);
			}
			
			if(age == 19){
				$("#age").val("19").prop("selected", true);
			}
			
			$("input[type=date]").val('${c.conDate}');
			
    		$("#category").change(function(){
	    		if($("#category option:selected").val() == 1){
	    			$('#image_section').attr('src', '');
	    			$("#info").html('시즌/부작 : <input type="text" name="conInfo" size="4" value="${c.conInfo}" required/> min');
	    			$("#category").val("1").prop("selected", true);
	    		}
	    		else{
	    			$('#image_section').attr('src', '');
	    			$("#info").html('시즌/부작 : <input type="text" name="conInfo" size="4" value="${c.conInfo}" required/> 부작');
		    		$("#category").val("2").prop("selected", true);
	    		}
    		});
    	})
    	
    	function readURL(input) {
    		console.log(input);
			if (input.files && input.files[0]) {
				var reader = new FileReader();
			  
				reader.onload = function (e) {
					$('#image_section').attr('src', e.target.result);  
				}
			  	
				reader.readAsDataURL(input.files[0]);
			}
		}
			 
			
		$("#imgInput").change(function(){
			console.log($("#imgInput").val());
			if($("#imgInput").val() == ''){
				$('#image_section').attr('src', '');
			}
			readURL(this);
		});
    </script>
  </body>
</html>