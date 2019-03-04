<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<section id="sub">
  <div><img src="../img/sub_top_tit1.png"></div>
  <div>
    <aside>
      <img src="../img/sub_aside_cate1_tit.png" alt="">
      <ul class="side_menu">
        <li class=" ${cate == 'story'?'on':''}"><a href="/farmstory/board/list.do?gr=croptalk&cate=story"><img src="../img/sub_cate3_lnb1${cate == 'story'?'_ov':''}.png" alt=""></a></li>
        <li class=" ${cate == 'grow'?'on':''}"><a href="/farmstory/board/list.do?gr=croptalk&cate=grow"><img src="../img/sub_cate3_lnb2${cate == 'grow'?'_ov':''}.png" alt=""></a></li>
        <li class=" ${cate == 'school'?'on':''}"><a href="/farmstory/board/list.do?gr=croptalk&cate=school"><img src="../img/sub_cate3_lnb3${cate == 'school'?'_ov':''}.png" alt=""></a></li>
      </ul>
    </aside>
    <article>
      <div class="sub_tit_area">
        <img src="../img/sub_nav_tit_cate3_${cate}.png" alt=농작물이야기>
        <div class="sub_tit_nav">
          <img src="../img/sub_page_nav_ico.gif" alt="">
          <p>
            HOME > 농작물이야기 > 
            <c:if test="${cate=='story'}">
						<span>농작물이야기</span>
					</c:if>
					<c:if test="${cate=='grow'}">
						<span>텃밭가꾸기</span>
					</c:if>
					<c:if test="${cate=='school'}">
						<span>귀농학교</span>
					</c:if>
          </p>
        </div>
      </div>
      <!-- 내용 시작 -->