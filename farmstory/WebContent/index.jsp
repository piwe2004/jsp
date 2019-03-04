<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./_header.jsp" %>
<script>
	var la_title = document.getElementsByClassName("la_title").innerHTML
	console.log(la_title);
	var la_title_val  = la_title.substring(1, 10);
</script>
<main>
  <div class="slider">
    <ul>
      <li><img src="./img/main_slide_img1.jpg" alt="슬라이드 이미지1"></li>
      <li><img src="./img/main_slide_img2.jpg" alt="슬라이드 이미지2"></li>
      <li><img src="./img/main_slide_img3.jpg" alt="슬라이드 이미지3"></li>
    </ul>
    <img src="./img/main_slide_img_tit.png" alt="사람과 자연을 사랑하는 팜스토리">
    <div class="grandOpen">
      <img src="./img/main_banner_txt.png" alt="gradnopen">
      <img src="./img/main_banner_tit.png" alt="팜스토리 오픈기념 30%할인 이벤트">
      <img src="./img/main_banner_img.png" alt="과일이미지">
    </div>
  </div>
  <div class="banner">
    <a href="#">
      <img src="./img/main_banner_sub1_tit.png" alt="팜스토리 오늘의 식단">
    </a>
    <a href="#">
      <img src="./img/main_banner_sub2_tit.png" alt="팜스토리 나도 요리사">
    </a>
  </div>
  <div class="latest">
    <div>
      <img src="./img/main_latest1_tit.png" alt="텃밭가꾸기">
      <div>
        <img src="./img/main_latest1_img.jpg" alt="">
        <ul>
          <c:forEach var="vo"  items="${latest1}">
	          <li>
		          	<span class="late_arrow">
		          		<img src="./img/main_latest_icon.gif" >
		          		<a class="la_title" href="#">${vo.title }</a>
		          		<span class="late_date">${vo.rdate }</span>
		          	</span>
	          	</li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <div>
      <img src="./img/main_latest2_tit.png" alt="귀농학교">
      <div>
        <img src="./img/main_latest2_img.jpg" alt="">
        <ul>
          <c:forEach var="vo"  items="${latest2}">
	          <li>
		          	<span class="late_arrow">
		          		<img src="./img/main_latest_icon.gif" >
		          		<a class="la_title" href="#">${vo.title }</a>
		          		<span class="late_date">${vo.rdate }</span>
		          	</span>
	          	</li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <div>
      <img src="./img/main_latest3_tit.png" alt="농작물이야기">
      <div>
        <img src="./img/main_latest3_img.jpg" alt="">
        <ul>
          <c:forEach var="vo"  items="${latest3}">
	          <li>
		          	<span class="late_arrow">
		          		<img src="./img/main_latest_icon.gif" >
		          		<a class="la_title"  href="#">${vo.title }</a>
		          		<span class="late_date">${vo.rdate }</span>
		          	</span>
	          	</li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
  <div class="info">
    <div>
      <img src="./img/main_sub2_cs_tit.png" alt="">
      <ul class="ul_fir">
        <li>
          <img src="./img/main_sub2_cs_img.png" alt="">
        </li>
        <li>
          <img src="./img/main_sub2_cs_txt.png" alt="">
        </li>
        <li>
          <p>평일: AM 09:00 ~ PM 06:00</p>
          <p>점심: PM 12:00 ~ PM 01:00</p>
          <p> 토, 일요일, 공휴일 휴무</p>
        </li>
      </ul>
      <ul class="ul_sec">
        <li><a href="#"><img src="./img/main_sub2_cs_bt1.png"></a></li>
        <li><a href="#"><img src="./img/main_sub2_cs_bt2.png"></a></li>
        <li><a href="#"><img src="./img/main_sub2_cs_bt3.png"></a></li>
      </ul>
    </div>
    <div>
      <img src="./img/main_sub2_account_tit.png" alt="">
      <div>
        <p>기업은행 123-456789-01-01-012</p>
        <p>국민은행 01-1234-56789</p>
        <p>우리은행 123-456789-01-01-012</p>
        <p>하나은행 123-456789-01-01</p>
        <p>예 금 주 (주)팜스토리</p>
      </div>
    </div>
    <div>
      <ul>
        <li class="lat_nav lat_nav_hover">공지사항</li>
        <li class="lat_nav">1:1고객문의</li>
        <li class="lat_nav">자주묻는 질문</li>
      </ul>
      <div class="lat_cont_area">
        <ul id="lat_notice" class="lat_conts">
          <li>
            <span>·</span>
            <a href="#" class="lat_cont">홈페이지 오픈 기념 이벤트를 진행합니다.</a>
            <a href="#" class="lat_com">(1)</a>
          </li>
          <li>
            <span>·</span>
            <a href="#" class="lat_cont">홈페이지 이용 관련 불편사항을 들려주세요</a>
            <a href="#" class="lat_com">(1)</a>
          </li>
          <li>
            <span>·</span>
            <a href="#" class="lat_cont">홈페이지를 오픈하였습니다.</a>
          </li>
        </ul>
        <ul id="lat_qna" class="lat_conts">
          <li>
            <span>·</span>
            <a href="#" class="lat_cont">아아</a>
          </li>
          <li>
            <span>·</span>
            <a href="#" class="lat_cont">asldkfjsalkdfj</a>
          </li>
          <li>
            <span>·</span>
            <a href="#" class="lat_cont">나ㅣ니나나</a>
          </li>
        </ul>
        <ul id="lat_qu" class="lat_conts lat_ep">
          <li>게시물이 없습니다.</li>
        </ul>
      </div>
    </div>
  </div>
</main>
<%@include file="./_footer.jsp" %>