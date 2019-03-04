<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<section id="sub">
  <div><img src="../img/sub_top_tit4.png"></div>
  <div>
    <aside>
      <img src="../img/sub_aside_cate4_tit.png" alt="">
      <ul class="side_menu">
        <li class=" ${cate == 'event'?'on':''}"><a href="/farmstory/board/list.do?event&cate=event"><img src="../img/sub_cate4_lnb1${cate == 'event'?'_ov':''}.png" alt=""></a></li>
      </ul>
    </aside>
    <article>
      <div class="sub_tit_area">
        <img src="../img/sub_nav_tit_cate4_${cate}.png" alt="이벤트">
        <div class="sub_tit_nav">
          <img src="../img/sub_page_nav_ico.gif" alt="">
          <p>
            HOME > <span>이벤트</span>
          </p>
        </div>
      </div>
      <!-- 내용 시작 -->