<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/farmstory/css/style.css">
    <link rel="stylesheet" href="/farmstory/css/board.css">
    <style>
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/farmstory/js/slider.js" charset="utf-8"></script>
    <script>
      $(document).ready(function(){
        $(".lat_nav").mouseover(function(){
          var lt_idx = $(this).index();
          $(".lat_nav").removeClass("lat_nav_hover");
          $(this).addClass("lat_nav_hover");
          $(".lat_conts").css("display","none").eq(lt_idx).show();
        });
      });
    </script>
  </head>
  <body>
    <div id="wrapper">
      <header>
        <a href="/farmstory/index.do" class="logo"><img src="/farmstory/img/logo.png"></a>
        <p>
          <a href="/farmstory/index.do">Home | </a>
          <c:if test="${sessionScope.member == null}">
          	<a href="/farmstory/member/login.do">Login |</a>
          	<a href="/farmstory/member/terms.do">Join |</a>
          </c:if>
          <c:if test="${sessionScope.member != null}">
          	<a href="/farmstory/member/logout.do">Logout |</a>
          </c:if>
          <a href="/farmstory/community/qna.do">Contact us</a>
        </p>
        <img src="/farmstory/img/head_txt_img.png" alt="">
        <nav>
          <ul class="gnb">
            <li><a href="/farmstory/intro/hello.do"><img src="/farmstory/img/head_menu1.png" onmouseover="this.src='/farmstory/img/head_menu1_ov.png';" onmouseout="this.src='/farmstory/img/head_menu1.png';" alt="설명" title="팜스토리소개메뉴" /></a></li>
            <li><a href="/farmstory/board/list.do?gr=market&cate=market"><img src="/farmstory/img/head_menu2.png" onmouseover="this.src='/farmstory/img/head_menu2_ov.png';" onmouseout="this.src='/farmstory/img/head_menu2.png';" alt="설명" title="장보기메뉴" /></a></li>
            <!-- <li><a href="/farmstory/board/story.do"><img src="/farmstory/img/head_menu3.png" onmouseover="this.src='/farmstory/img/head_menu3_ov.png';" onmouseout="this.src='/farmstory/img/head_menu3.png';" alt="설명" title="농작물이야기메뉴" /></a></li> -->
            <li><a href="/farmstory/board/list.do?gr=croptalk&cate=story"><img src="/farmstory/img/head_menu3.png" onmouseover="this.src='/farmstory/img/head_menu3_ov.png';" onmouseout="this.src='/farmstory/img/head_menu3.png';" alt="설명" title="농작물이야기메뉴" /></a></li>
            <li><a href="/farmstory/board/list.do?gr=event&cate=event""><img src="/farmstory/img/head_menu4.png" onmouseover="this.src='/farmstory/img/head_menu4_ov.png';" onmouseout="this.src='/farmstory/img/head_menu4.png';" alt="설명" title="이벤트메뉴" /></a></li>
            <li><a href="/farmstory/board/list.do?gr=community&cate=notice"><img src="/farmstory/img/head_menu5.png" onmouseover="this.src='/farmstory/img/head_menu5_ov.png';" onmouseout="this.src='/farmstory/img/head_menu5.png';" alt="설명" title="커뮤니티메뉴" /></a></li>
          </ul>
        </nav>
      </header>