<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="list" value="${list}"/>
<c:set var="size" value="${fn:length(list)}" />
<c:set var="cCount" value="2"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/12_findContents.css" />

</head>
<body>

    
	<jsp:include page="../common/header.jsp"/>
	
	<img src='resources/images/findContents.png' style="width:1898px; height:500px;">

	
	<div class='sl-in2' style=' padding:10px; margin-top:10px;'>
	<h2 class='titleText' style='font-size:3rem;'>< 컨텐츠 찾기 ></h2>
	</div>
	
	<br>
	
	<section id='body-container' class='sl-in2'>
	
	<section id="click__movie-drama">
      <div class="movie_drama_Btn">
        <button class="movieBtn" id="movie" name="mv">영화</button>
        <input id="mv" type="checkbox" name="category" value="1" />
       </div>
       <div class="movie_drama_Btn"> 
        <button class="dramaBtn" id="drama" name="dr">드라마</button>
        <input id="dr" type="checkbox" name="category" value="2" />
      </div>
      <br>
    </section>
    
    <div class='second-container'>
    <div class="about__majors">
        <div class="major">
          <button class="major_btn" value="1" id="ott" name="netflix">
            <div class="major__icon netfilx"></div>
          </button>
          <input id="netflix" type="checkbox" name="ott" value="1" />
          <h2 class="major__title" id="netflix">Netflix</h2>
        </div>

        <div class="major">
          <button class="major_btn" value="4" id="ott" name="watcha">
            <div class="major__icon watcha"></div>
          </button>
          <input id="watcha" type="checkbox" name="ott" value="4" />
          <h2 class="major__title" id="watcha">Watcha</h2>
        </div>

        <div class="major">
          <button class="major_btn" value="2" id="ott" name="wavve">
            <div class="major__icon wavve"></div>
          </button>
          <input id="wavve" type="checkbox" name="ott" value="2" />
          <h2 class="major__title" id="wavve">Wavve</h2>
        </div>

        <div class="major">
          <button class="major_btn" value="3" id="ott" name="disney">
            <div class="major__icon disney"></div>
          </button>
          <input id="disney" type="checkbox" name="ott" value="3" />
          <h2 class="major__title" id="disney">Disney +</h2>
        </div>
        
        <div class="major">
          <button class="major_btn" value="5" id="ott" name="apple">
            <div class="major__icon appleTv"></div>
          </button>
          <input id="apple" type="checkbox" name="ott" value="5" />
          <h2 class="major__title" id="apple">Apple TV</h2>
        </div>
    </div>
    <div style='text-align:right; padding:5px;'>
   	 <span class='span'>* 원하는 서비스를 클릭 후 장르와 연령 제한을 선택해주세요.</span>
    </div>
    
    <br>
    
    <div class="checkbox__select">
        <table>
          <tr>
            <td class='table-title'>장르</td>
            <td>
              	<input id='action' type='checkbox' name='genre' value='1' />
              	<label id='genre' for='action'>액션</label>
            </td>
            <td>
              	<!-- <input id="dramaCh" type="checkbox" name="genre" value="2" />
              	<label for="dramaCh">드라마</label> -->
              	<input id='dramaCh' type='checkbox' name='genre' value='2' />
              	<label id='genre' for='dramaCh'>드라마</label>
            </td>
            <td>
            	<input type="checkbox" id="sf" name="genre" value="3">
            	<label id='genre' for="sf">SF</label>
            </td>
            <td>
            	<input type="checkbox" id="fantasy" name="genre" value="4">
            	<label id='genre' for="fantasy">판타지</label>
            </td>
            <td>
            	<input type="checkbox" id="romance" name="genre" value="5">
            	<label  for="romance">로맨스</label>
            </td>
            <td>
              <input id="entertain" type="checkbox" name="genre" value="6" />
              <label id='genre' for="entertain">예능</label>
            </td>
            <td>
            	<input type="checkbox" id="thriller" name="genre" value="7">
            	<label id='genre' for="thriller">스릴러</label>
            </td>
            <td>
            	<input type="checkbox" id="family" name="genre" value="8">
            	<label id='genre' for="family">가족</label>
            </td>
            <td>
            	<input type="checkbox" id="animation" name="genre" value="9">
            	<label id='genre' for="animation">애니메이션</label>
            </td>
            <td>
              <input id='comedy' type='checkbox' name='genre' value='10'/>
              <label id='genre' for='comedy'>코메디</label>
            </td>
            <td>
            	<input type="checkbox" id="docu" name="genre" value="11">
            	<label for="docu">다큐</label>
            </td>
          </tr>
          <tr>
            <td class='table-title'>연령 제한</td>
            <td>
              <input id='allage' type='checkbox' value='0' name='age' />
              <label id='age' for='allage'>모든 연령</label>
            </td>
            <td>
              <input id="twelve" type="checkbox" value="12" name="age"/>
              <label id='age' for="twelve">12세</label>
            </td>
            <td>
              <input id="fifteen" type="checkbox" value="15" name="age"/>
              <label id='age' for="fifteen">15세</label>
            </td>
            <td>
              <input id="nineteen" type="checkbox" value="19" name="age"/>
              <label id='age' for="nineteen">19세 이상</label>
            </td>
          </tr>
        </table>
      </div>
      
   
	<section id="party__container">
        <div
          id="carouselExampleControls"
          class="carousel slide"
          data-bs-ride="carousel"
        >
	          <div class="carousel-inner">
	          	<c:if test="${size ge 8}">
		          	<c:forEach var="cnt" begin="1" end="${size }" step="8">
		          		<c:if test="${cnt eq 1 }">
				            <div class="carousel-item active" data-bs-interval="100000">
				        </c:if>
				        <c:if test="${cnt ne 1 }">
				            <div class="carousel-item" data-bs-interval="100000">
				        </c:if>
				        	<c:if test="${cnt eq 1 }">				    
						    	<c:forEach var="cnt2" begin="0" end="1">
						        	<div id="movieBox" class="movieBox">					        		
							            <c:forEach var="c" items="${list }" begin="${cnt2 * 4}" end="${(cnt2 * 4) + 3}">
								        	<div class="movieContainer">
									            <div class="movie__info">
										            <c:if test="${c.filePath eq '' }">
											        	<img
											             id="poster"
											             src="${c.filePath}${c.changeName}"
											             onclick="movePage(${c.conNo });"
											            />
										            </c:if>
										            <c:if test="${c.filePath ne '' }">
											        	<img
											             id="poster"
											             src="${contextPath}/${c.filePath}${c.changeName}"
											             onclick="movePage(${c.conNo });"
											        	/>
										            </c:if>
										            <br>
										            <h4 onclick="movePage(${c.conNo });">${c.conKTitle }</h4>
										            <span onclick="movePage(${c.conNo });">(${fn:substring(c.conDate,0,4)})</span><br />
										            <i class="fa-solid fa-star">${c.cmtStar }</i>
									            </div>
								    		</div>
							    		</c:forEach>
					    			</div>	    			
					    			</c:forEach>  
				    			</c:if>
				    			<c:if test="${cnt ne 1 }">				    
						    		<c:forEach var="cnt2" begin="1" end="2">
							        	<div id="movieBox" class="movieBox">						        							        		
								            <c:forEach var="c" items="${list }" begin="${cCount * 4}" end="${(cCount * 4) + 3}">
									        	<div class="movieContainer">
										            <div class="movie__info">
											            <c:if test="${c.filePath eq '' }">
												        	<img
												             id="poster"
												             src="${c.filePath}${c.changeName}"
												             onclick="movePage(${c.conNo });"
												            />
											            </c:if>
											            <c:if test="${c.filePath ne '' }">
												        	<img
												             id="poster"
												             src="${contextPath}/${c.filePath}${c.changeName}"
												             onclick="movePage(${c.conNo });"
												        	/>
											            </c:if>
											            <br>
											            <h4 onclick="movePage(${c.conNo });">${c.conKTitle }</h4>
											            <span onclick="movePage(${c.conNo });">(${fn:substring(c.conDate,0,4)})</span><br />
											            <i class="fa-solid fa-star">${c.cmtStar }</i>
										            </div>
									    		</div>
								    		</c:forEach>
								    		<c:set var="cCount" value="${cCount + 1}"></c:set>
						    			</div>	    			
					    			</c:forEach>  
				    			</c:if> 		 		
				    		</div>
		    		</c:forEach>
	    		</c:if>
	    		
	    		<c:if test="${size lt 8}">
					<div class="carousel-item active" data-bs-interval="100000">
						<c:forEach var="cnt2" begin="0" end="1">
							<div id="movieBox" class="movieBox">					        		
								<c:forEach var="c" items="${list }" begin="${cnt2 * 4}" end="${(cnt2 * 4) + 3}">
									<div class="movieContainer">
										<div class="movie__info">
											<c:if test="${c.filePath eq '' }">
												<img
												id="poster"
												src="${c.filePath}${c.changeName}"
												onclick="movePage(${c.conNo });"
												/>
											</c:if>
											<c:if test="${c.filePath ne '' }">
												<img
												id="poster"
												src="${contextPath}/${c.filePath}${c.changeName}"
												onclick="movePage(${c.conNo });"
												/>
											</c:if>
											<br>
											<h4 onclick="movePage(${c.conNo });">${c.conKTitle }</h4>
											<span onclick="movePage(${c.conNo });">(${fn:substring(c.conDate,0,4)})</span><br />
											<i class="fa-solid fa-star">${c.cmtStar }</i>
										</div>
									</div>
								</c:forEach>
							</div>	    			
						</c:forEach>
					</div>  
				</c:if> 		 		
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
    </div>
    
    </section>

	<script>
	 

	
	
		$(function() {
			let mvClicked = false;
			let drClicked = false;
			
			$('#movie').click(function(){
				console.log(mvClicked)
				if(mvClicked == false){
		    		$(this).css('background', 'white');
		    		$(this).css('opacity', '1');
		    		$('#drama').css('background', 'white');
		    		$('#drama').css('opacity', '0.3');
		    		
		    		mvClicked = true;
		    		drClicked = false;
				}
				else{
					$(this).css('background', 'white');
		    		$(this).css('opacity', '1');
		    		
					mvClicked = false;
				}		    	
		  	});
			
			$('#drama').click(function(){				
				if(drClicked == false){
					$(this).css('background', 'white');
		    		$(this).css('opacity', '1');
		    		$('#movie').css('background', 'white');
		    		$('#movie').css('opacity', '0.3');
		    		
		    		drClicked = true;
		    		mvClicked = false;
				}
				else{
					$(this).css('background', 'var(--color-orange)');
		    		$(this).css('opacity', '1');
					drClicked = false;
				}
		  	});
		});
		
		function movePage(cno){
	 		location.href = '${contextPath}/detail?conNo='+cno;
	 	}
		
		let categorys = document.getElementsByName("genre");
		
		categorys.forEach( (item) => {
			return item.addEventListener("click", searchContent);
		});
		
		let ages = document.getElementsByName("age");
		ages.forEach( (item) => {
			return item.addEventListener("click", searchContent);
		});
		
		let platforms = document.getElementsByClassName("major_btn");
		
		for(var i = 0; i < platforms.length; i++){
			platforms[i].addEventListener("click", searchContent);
		}
		
		let movieBtn = document.getElementById("movie");
		let dramaBtn = document.getElementById("drama");
		
		movieBtn.addEventListener("click", searchContent);
		dramaBtn.addEventListener("click", searchContent);
		
		function searchContent(e){
			//console.log($(this).attr('id'));

			var genreList = ['all'];
            var ageList = ['all'];
            var ottList = ['all'];
            var categoryList = ['all'];
            
            if($(this).attr('id') == 'movie'){
            	if($('input[id='+$(this).attr('name')+']').is(':checked') == true){
            		$('input[id='+$(this).attr('name')+']').prop("checked", false);
            	}
            	else if($('input[id='+$(this).attr('name')+']').is(':checked') == false
            			&& $('input[id="dr"]').is(':checked') == true){
            		$('input[id='+$(this).attr('name')+']').prop("checked", true);
            		$('input[id="dr"]').prop("checked", false);
            	}
            	else{
            		$('input[id='+$(this).attr('name')+']').prop("checked", true);
            	}
            }
            
            else if($(this).attr('id') == 'drama'){
            	if($('input[id='+$(this).attr('name')+']').is(':checked') == true){
            		$('input[id='+$(this).attr('name')+']').prop("checked", false);
            	}
            	else if($('input[id='+$(this).attr('name')+']').is(':checked') == false
            			&& $('input[id="mv"]').is(':checked') == true){
            		$('input[id='+$(this).attr('name')+']').prop("checked", true);
            		$('input[id="mv"]').prop("checked", false);
            	}
            	else{
            		$('input[id='+$(this).attr('name')+']').prop("checked", true);
            	}
            }
            
         
            
            if($(this).attr('id') == 'ott'){
            	//ottList.push($(this).val());
            	if($('input[id='+$(this).attr('name')+']').is(':checked') == true){
            		$('input[id='+$(this).attr('name')+']').prop("checked", false);
            		console.log('안녕');
            		$('h2[id='+$(this).attr('name')+']').removeClass('colorOrange');
            		
            		console.log('안녕2');
            	}
            	else{
            		$('input[id='+$(this).attr('name')+']').prop("checked", true);
            		console.log('안녕3');
            		$('h2[id='+$(this).attr('name')+']').addClass('colorOrange');
            		console.log('안녕4');
            	}
            }
            
            $('input[name="genre"]:checked').each(function(i){
            	genreList.push($(this).val());
            });
            
            $('input[name="age"]:checked').each(function(i){
            	ageList.push($(this).val());
            });
            
            $('input[name="ott"]:checked').each(function(i){
            	ottList.push($(this).val());
            });
            
            $('input[name="category"]:checked').each(function(i){
            	categoryList.push($(this).val());
            });
// 			let genre = document.querySelectorAll("input[name=genre]:checked");		
// 			genre = [].map.call(genre, function(item){
// 			    return item.value
// 			});

			console.log(genreList);
			console.log(ageList);
			console.log(ottList);
			console.log(categoryList);
			
			var cnt = 0;
			$.ajax({
				url : '${contextPath}/searchContent.co',
				data : {
					genre : genreList,
					age : ageList,
					ott : ottList,
					category : categoryList
				},
				dataType : 'json',
				success: function(result){
					let htmlUpside = "";
					let htmlMid = "";
					let htmlInfo = "";
					let html = "";
					//$('.carousel-inner').remove();
					var carouselCnt = parseInt(result.length/8);
					var movieBoxCnt = parseInt(result.length/4);
					var movieContainerCnt = parseInt(result.length/2) + 1;
					var cnt2 = 1;
					console.log(carouselCnt);
					if(result.length >= 8){
						$('.carousel-item').remove();
						for(var i = 1; i <= carouselCnt; i++){
							if(i > 1){
								html += "<div class='carousel-item' data-bs-interval='100000'>";
							}
							else{
								html += "<div class='carousel-item active' data-bs-interval='100000'>";
							}
							for(var j = 0; j < 2; j++){
								html += "<div id='movieBox"+ cnt2 +"' class='movieBox'></div>";
								cnt2 += 1;
							}
							html += "</div>";
						}						
						$(".carousel-inner").html(html);
						for(var j = 1; j <= movieBoxCnt; j++){
							while(cnt < j * 4){
								htmlInfo += "<div class='movieContainer'>" +
												"<div class='movie__info'>" +
													"<img id='poster' src="+ result[cnt].changeName +" onclick='movePage("+ result[cnt].conNo +");'>" +
													"<br>" +
													"<h4 onclick='movePage("+ result[cnt].conNo +");'>"+result[cnt].conKTitle+"</h4>" +
													"<span onclick='movePage("+ result[cnt].conNo +");'>("+result[cnt].conDate.substr(0, 4)+")</span>" +
													"<br>" +
													"<i class='fa-solid fa-star'>"+ result[cnt].cmtStar +"</i>"+
												"</div>"+
											"</div>";
								$('#movieBox'+j).html(htmlInfo);									

								cnt += 1;
							}
							htmlInfo = "";
						}
						cnt = 0;
						cnt2 = 0;
					}
					else if(result.length >= 4){
						$('.carousel-item').remove();
						html += "<div class='carousel-item active' data-bs-interval='100000'>";
						console.log(carouselCnt);
						html += "<div id='movieBox1' class='movieBox'></div>";
						html += "<div id='movieBox2' class='movieBox'></div>";
						html += "</div>";
						
						$(".carousel-inner").html(html);
						for(var j = 1; j <= 2; j++){
							while(cnt < j * 4){
								htmlInfo += "<div class='movieContainer'>" +
												"<div class='movie__info'>" +
													"<img id='poster' src="+ result[cnt].changeName +" onclick='movePage("+ result[cnt].conNo +");'>" +
													"<br>" +
													"<h4 onclick='movePage("+ result[cnt].conNo +");'>"+result[cnt].conKTitle+"</h4>" +
													"<span onclick='movePage("+ result[cnt].conNo +");'>("+result[cnt].conDate.substr(0, 4)+")</span>" +
													"<br>" +
													"<i class='fa-solid fa-star'>"+ result[cnt].cmtStar +"</i>"+
												"</div>"+
											"</div>";
								$('#movieBox'+j).html(htmlInfo);									

								cnt += 1;
							}
							htmlInfo = "";
						}
						cnt = 0;
						cnt2 = 0;
					}
					else{
						$('.carousel-inner').remove();
						htmlMid += "<div class='carousel-inner'>" +
									"<div class='carousel-item active' data-bs-interval='100000'>" +
										"<div id='movieBox' class='movieBox'>";
						htmlMid += 		"</div>"+
									"</div>"+
								"</div>";
						$("#carouselExampleControls").html(htmlMid);
						
						for(var i = 0 in result){
							htmlInfo += "<div class='movieContainer'>" +
											"<div class='movie__info'>" +
												"<img id='poster' src="+ result[i].changeName +" onclick='movePage("+ result[i].conNo +");'>" +
												"<br>" +
												"<h4 onclick='movePage("+ result[i].conNo +");'>"+result[i].conKTitle+"</h4>" +
												"<span onclick='movePage("+ result[i].conNo +");'>("+result[i].conDate.substr(0, 4)+")</span>" +
												"<br>" +
												"<i class='fa-solid fa-star'>"+ result[i].cmtStar +"</i>"+
											"</div>"+
										"</div>";
							$("#movieBox").html(htmlInfo);
						}
					}
					//console.log(genre);
				}
			})
		}
	</script>
	
	<script src="resources/js/main.js" defer></script>
</body>
</html>