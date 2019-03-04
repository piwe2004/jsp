<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<section id="sub">
  <div><img src="../img/sub_top_tit2.png"></div>
  <div>
    <aside>
      <img src="../img/sub_aside_cate2_tit.png" alt="">
      <ul class="side_menu">
        <li class=" ${cate == 'market'?'on':''}"><a href="/farmstory/board/list.do?event&cate=event"><img src="../img/sub_cate2_lnb1${cate == 'market'?'_ov':''}.png" alt=""></a></li>
      </ul>
    </aside>
    <article>
      <div class="sub_tit_area">
        <img src="../img/sub_nav_tit_cate2_${cate}.png" alt="이벤트">
        <div class="sub_tit_nav">
          <img src="../img/sub_page_nav_ico.gif" alt="">
          <p>
            HOME > <span>장보기</span>
          </p>
        </div>
      </div>
      <!-- 내용 시작 -->