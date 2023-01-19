<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="list" value="${list}"/>
<c:set var="size" value="${fn:length(list)}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    <link rel="icon" type="image/png" href="../image/navbarLogo.png" />

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
    <link rel="stylesheet" href="resources/css/12_findContents.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- sweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
	#searchContent{
		margin: auto;
		margin-top: 100px;
		width: 800px;
		height: 500px;
		font-size: 20px;
		font-weight: bold;
  	}
  	#whole{
	  	margin: auto;
		margin-top: 20px;
		width: 810px;
		height: 700px;
		border: 1px solid black;
  	}
  	#card{
  		margin: auto;
  		width: 200px;
		height: 350px;
		float: left;
  	}
  	tr, td{
  		padding: 15px;
  		margin: auto;
  	}
  	#poster{
  		width: 180px;
  		height: 230px;
  	}
  	.btn_netflix{
  		width: 100px;
  		height: 100px;
  	}
  	.btn_netflix>img{
  		width: 100%;
  		height: 100%;
  		border-radius: 50%;
  	}
  	#movie, #drama{
  		background-color: mediumorchid;
  		color: white;
  		border: none;
  	}
  	#info>h4, h5{
  		margin:auto;
  	}
</style>
</head>
<body>

    
	<jsp:include page="../common/header.jsp"/>
	
	<section id="click__movie-drama">
      <div class="movie_drama_Btn">
        <button class="movieBtn">영화</button>
        <button class="dramaBtn">드라마</button>
      </div>
      <br>
    </section>
    
    <div class="about__majors">
        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon netfilx"></div>
          </button>
          <h2 class="major__title">Netflix</h2>
        </div>

        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon watcha"></div>
          </button>
          <h2 class="major__title">Watcha</h2>
        </div>

        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon wavve"></div>
          </button>
          <h2 class="major__title">Wavve</h2>
        </div>

        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon disney"></div>
          </button>
          <h2 class="major__title">Disney +</h2>
        </div>
        <div class="major">
          <button onclick="show(this)">
            <div class="major__icon appleTv"></div>
          </button>
          <h2 class="major__title">Apple TV</h2>
        </div>
    </div>
    
    <div class="checkbox__select">
        <table>
          <tr>
            <td>장르</td>
            <td>
              	<input id="action" type="checkbox" name="genre" value="action" />
              	<label for="action">액션</label>
            </td>
            <td>
              	<input id="drama" type="checkbox" name="genre" value="drama" />
              	<label for="drama">드라마</label>
            </td>
            <td>
            	<input type="checkbox" id="sf" name="genre" value="sf">
            	<label for="sf">SF</label>
            </td>
            <td>
            	<input type="checkbox" id="fantasy" name="genre" value="fantasy">
            	<label for="fantasy">판타지</label>
            </td>
            <td>
            	<input type="checkbox" id="romance" name="genre" value="romance">
            	<label for="romance">로맨스</label>
            </td>
            <td>
              <input id="horror" type="checkbox" name="genre" value="horror" />
              <label for="horror">공포</label>
            </td>
            <td>
            	<input type="checkbox" id="thriller" name="genre" value="thriller">
            	<label for="thriller">스릴러</label>
            </td>
            <td>
            	<input type="checkbox" id="family" name="genre" value="family">
            	<label for="family">가족</label>
            </td>
            <td>
            	<input type="checkbox" id="animation" name="genre" value="animation">
            	<label for="animation">애니메이션</label>
            </td>
            <td>
              <input id="comedy" type="checkbox" name="genre" value="comedy" />
              <label for="comedy">코메디</label>
            </td>
            <td>
            	<input type="checkbox" id="romance" name="genre" value="romance">
            	<label for="romance">다큐</label>
            </td>
          </tr>
          <tr>
            <td>연령 제한</td>
            <td>
              <input id="allage" type="checkbox" value="allage" name="age"/>
              <label for="allage">모든 연령</label>
            </td>
            <td>
              <input id="twelve" type="checkbox" value="twelve" name="age"/>
              <label for="twelve">12세</label>
            </td>
            <td>
              <input id="fifteen" type="checkbox" value="fifteen" name="age"/>
              <label for="fifteen">15세</label>
            </td>
            <td>
              <input id="nineteen" type="checkbox" value="nineteen" name="age"/>
              <label for="nineteen">19세 이상</label>
            </td>
          </tr>
        </table>
      </div>
      
      <div class="btn__group">
        <button>검색</button>
      </div>
      <br /><br />	
      
	<section id="party__container">
        <div
          id="carouselExampleControls"
          class="carousel slide"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="100000">
            <c:forEach var="cnt" begin="0" end="${size }" step="4">
              <div id="moiveBox">
                <c:forEach var="c" items="${list }" begin="${ cnt}" end="${ cnt + 3}">
	                <div class="movieContainer">
	                  <div class="movie__info">
	                    <img
	                      id="poster"
	                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
	                      onclick="movePage(${c.conNo });"
	                    />
	                    <br /><br />
	                    <h4 onclick="movePage(${c.conNo });">${c.conKTitle }</h4>
	                    <span onclick="movePage(${c.conNo });">(${ c.conDate})</span><br />
	                    <i class="fa-solid fa-star">4.0</i>
	                  </div>
	    			</div>
    			</c:forEach>
    			</div>
    		</c:forEach>
    		</div>
    		</div>
    	</div>
    	<button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleControls"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleControls"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
    	</div>
    </section>

	<script>		
		$(function() {
			let mvClicked = false;
			let drClicked = false;
			
			$('#movie').click(function(){
				console.log(mvClicked)
				if(mvClicked == false){
		    		$(this).css('background', 'plum');
		    		$('#drama').css('background', 'mediumorchid');
		    		mvClicked = true;
		    		drClicked = false;
				}
				else{
					$(this).css('background', 'mediumorchid');
					mvClicked = false;
				}		    	
		  	});
			
			$('#drama').click(function(){				
				if(drClicked == false){
		    		$(this).css('background', 'plum');
		    		$('#movie').css('background', 'mediumorchid');
		    		drClicked = true;
		    		mvClicked = false;
				}
				else{
					$(this).css('background', 'mediumorchid');
					drClicked = false;
				}
		  	});
		});
		
		function movePage(cno){
	 		location.href = '${contextPath}/detail?conNo='+cno;
	 	}
		
		let categorys = document.getElementsByName("genre");
		categorys.forEach( (item) => {
			return item.addEventListener("click", searchContent) 
		})
		
		let ages = document.getElementsByName("age");
		ages.forEach( (item) => {
			return item.addEventListener("click", searchContent) 
		})
		
		function searchContent(e){
			//console.log(e.target)
			if(!e.target.checked){
				return
			}
			var genreList = ['all'];
            var ageList = ['all'];
            
            $('input[name="genre"]:checked').each(function(i){
            	genreList.push($(this).val());
            });
            
            $('input[name="age"]:checked').each(function(i){
            	ageList.push($(this).val());
            });
// 			let genre = document.querySelectorAll("input[name=genre]:checked");		
// 			genre = [].map.call(genre, function(item){
// 			    return item.value
// 			});
			console.log(genreList);
			console.log(ageList);
			$.ajax({
				url : '${contextPath}/searchContent.co',
				data : {
					genre : genreList,
					age : ageList	
				},
				success: function(result){
					//console.log(genre);
				}
			})
		}
	</script>
</body>
</html>