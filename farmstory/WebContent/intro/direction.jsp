<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../_header.jsp" %>
<section id="sub">
  <div><img src="../img/sub_top_tit1.png"></div>
  <div>
    <aside>
      <img src="../img/sub_aside_cate1_tit.png" alt="">
      <ul class="side_menu">
        <li><a href="./hello.do"><img src="../img/sub_cate1_lnb1.png" onmouseover="this.src='../img/sub_cate1_lnb1_ov.png';" onmouseout="this.src='../img/sub_cate1_lnb1.png';"  alt=""></a></li>
        <li><a href="#"><img src="../img/sub_cate1_lnb2_ov.png" alt=""></a></li>
      </ul>
    </aside>
    <article>
      <div class="sub_tit_area">
        <img src="../img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는길">
        <div class="sub_tit_nav">
          <img src="../img/sub_page_nav_ico.gif" alt="">
          <p>
            HOME > 팜스토리소개 > <span>찾아오시는길</span>
          </p>
        </div>
      </div>
      <div class="location_area">
        <p>
          <span>▣&nbsp팜스토리</span><br/>
          &nbsp&nbsp&nbsp 주소: 경기도 이천시 잘한다구 신난다동 123<br/>
          &nbsp&nbsp&nbsp 전화: 01-234-5678
        </p>
        <p>
          <span>▣&nbsp찾아오시는길</span>
        </p>
        <!--
        	* Daum 지도 - 약도서비스
        	* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
        	* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
        -->
        <!-- 1. 약도 노드 -->
        <div id="daumRoughmapContainer1550106240826" class="root_daum_roughmap root_daum_roughmap_landing"></div>

        <!-- 2. 설치 스크립트 -->
        <script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

        <!-- 3. 실행 스크립트 -->
        <script charset="UTF-8">
        	new daum.roughmap.Lander({
        		"timestamp" : "1550106240826",
        		"key" : "s7iq",
        		"mapWidth" : "765",
        		"mapHeight" : "400"
        	}).render();
        </script>
      </div>
    </article>
  </div>
</section>
<%@include file="../_footer.jsp" %>
