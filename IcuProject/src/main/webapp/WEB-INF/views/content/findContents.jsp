<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ICU - 컨텐츠 찾기</title>
    
    <!-- css -->
    <link rel="stylesheet" href="resources/css/12_findContents.css" />


  <body>
	<jsp:include page="../common/header.jsp"/>
	
    <section id="click__movie-drama">
      <div class="movie_drama_Btn">
        <button class="movieBtn">영화</button>
        <button class="dramaBtn">드라마</button>
      </div>
      <br />

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
              <input id="action" type="checkbox" value="action" />
              <label for="action">액션</label>
            </td>
            <td>
              <input id="drama" type="checkbox" value="drama" />
              <label for="drama">드라마</label>
            </td>
            <td>
              <input id="comedy" type="checkbox" value="comedy" />
              <label for="comedy">코메디</label>
            </td>
            <td>
              <input id="horror" type="checkbox" value="horror" />
              <label for="horror">공포</label>
            </td>
          </tr>
          <tr>
            <td>연령 제한</td>
            <td>
              <input id="allage" type="checkbox" value="allage" />
              <label for="allage">모든 연령</label>
            </td>
            <td>
              <input id="twelve" type="checkbox" value="twelve" />
              <label for="twelve">12세</label>
            </td>
            <td>
              <input id="fifteen" type="checkbox" value="fifteen" />
              <label for="fifteen">15세</label>
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
              <div id="moiveBox">
                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>

                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item" data-bs-interval="100000">
              <div id="moiveBox">
                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>

                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item" data-bs-interval="100000">
              <!-- ìí í´ë¦­ì ë³´ì´ë div -->
              <div id="moiveBox">
                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>

                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/176267183/s592/avatar"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>
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

      <!-- ëë¼ë§ í´ë¦­ì ë³´ì´ë div -->
      <section id="party__container2">
        <div
          id="carouselExampleControls2"
          class="carousel slide"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="100000">
              <!-- ëë¼ë§ í´ë¦­ì ë³´ì´ë div -->
              <div id="moiveBox">
                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>

                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item" data-bs-interval="100000">
              <!-- ëë¼ë§ í´ë¦­ì ë³´ì´ë div -->
              <div id="moiveBox">
                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>

                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item" data-bs-interval="100000">
              <!-- ëë¼ë§ í´ë¦­ì ë³´ì´ë div -->
              <div id="moiveBox">
                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>

                <div class="movieContainer">
                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>

                  <div class="movie__info">
                    <img
                      src="https://images.justwatch.com/poster/281440055/s592/jongiyi-jib-gongdonggyeongjeguyeog"
                    />
                    <br /><br />
                    <h4>아바타</h4>
                    <span>avatar 2009</span><br />
                    <i class="fa-solid fa-star">4.0</i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleControls2"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleControls2"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </section>
    </section>

    <script src="resources/js/12_findContents.js"></script>
  </body>
</html>
