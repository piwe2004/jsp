<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<section id="sub">
  <div><img src="../img/sub_top_tit5.png"></div>
  <div>
    <aside>
      <img src="../img/sub_aside_cate5_tit.png" alt="">
      <ul class="side_menu">
        <li class=" ${cate == 'notice'?'on':''}"><a href="/farmstory/board/list.do?gr=community&cate=notice"><img src="../img/sub_cate5_lnb1${cate == 'notice'?'_ov':''}.png" alt=""></a></li>
        <li class=" ${cate == 'menu'?'on':''}"><a href="/farmstory/board/list.do?gr=community&cate=menu"><img src="../img/sub_cate5_lnb2${cate == 'menu'?'_ov':''}.png" alt=""></a></li>
        <li class=" ${cate == 'chef'?'on':''}"><a href="/farmstory/board/list.do?gr=community&cate=chef"><img src="../img/sub_cate5_lnb3${cate == 'chef'?'_ov':''}.png" alt=""></a></li>
        <li class=" ${cate == 'faq'?'on':''}"><a href="/farmstory/board/list.do?gr=community&cate=faq"><img src="../img/sub_cate5_lnb4${cate == 'faq'?'_ov':''}.png" alt=""></a></li>
        <li class=" ${cate == 'qna'?'on':''}"><a href="/farmstory/board/list.do?gr=community&cate=qna"><img src="../img/sub_cate5_lnb5${cate == 'qna'?'_ov':''}.png" alt=""></a></li>
      </ul>
    </aside>
    <article>
      <div class="sub_tit_area">
        <img src="../img/sub_nav_tit_cate5_${cate}.png" alt=농작물이야기>
        <div class="sub_tit_nav">
          <img src="../img/sub_page_nav_ico.gif" alt="">
          <p>
            HOME > 농작물이야기 > 
            <c:if test="${cate=='notice'}">
						<span>공지사항</span>
					</c:if>
					<c:if test="${cate=='menu'}">
						<span>오늘의 식단</span>
					</c:if>
					<c:if test="${cate=='chef'}">
						<span>나도 요리사</span>
					</c:if>
					<c:if test="${cate=='faq'}">
						<span>1:1고객문의</span>
					</c:if>
					<c:if test="${cate=='qna'}">
						<span>자주묻는질문</span>
					</c:if>
          </p>
        </div>
      </div>
      <!-- 내용 시작 -->