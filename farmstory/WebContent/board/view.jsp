<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../_header.jsp" %>
<jsp:include page="./_aside_${gr}.jsp" />
		<div id="board">
			<h3>글보기</h3>
			<div class="view">
				<form action="#" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="${vo.title}" readonly />
							</td>
						</tr>
						
						<tr>
							<td>첨부파일</td>
							<td>
								<a href="#">테스트.hwp</a>
								<span>3회 다운로드</span>
							</td>
						</tr>
						
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" readonly>${vo.content}</textarea>
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="#" class="cancel del">삭제</a>
						<a href="#" class="cancel mod">수정</a>
						<a href="javascript:history.back();" class="cancel">목록</a>
					</div>
				</form>
			</div><!-- view 끝 -->
			
			<!-- 댓글리스트 -->
			<section class="comments">
				<h3>댓글목록</h3>
				<div class="comment">
					<span>
						<span class="nick">홍길동</span>
						<span class="date">18-03-01</span>
					</span>
					<textarea>테스트 댓글입니다.</textarea>
					<div>
						<a href="#" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
			
				<p class="empty">
					등록된 댓글이 없습니다.
				</p>
				
			</section>
			
			<!-- 댓글쓰기 -->
			<section class="comment_write">
				<h3>댓글쓰기</h3>
				<div>
					<form action="#" method="post">
						<input type="text" name="parent" value="${vo.seq}" />
						<input type="text" name="uid" value="${member.uid}" />
						<input type="text" name="nick" value="${member.nick}" />
						
						<textarea name="comment" rows="5"></textarea>
						<div class="btns">
							<a href="#" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />
						</div>
					</form>
				</div>
			</section>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script>
			
				$(function(){
					
					var btnComment = $('.comment_write .submit');
					var comments = $('.comments');
					var comment  = $('.comments > .comment');
					var empty = $(".comments > .empty");
					var parent = $("#seq").val();
					
					btnComment.click(function(){
						
						var parent 	= $('.comment_write input[name=parent]').val();
						var uid 	= $('.comment_write input[name=uid]').val();
						var nick 	= $('.comment_write input[name=nick]').val();
						var content = $('.comment_write textarea').val();
						
						var json = {"parent":parent, "uid":uid, "nick":nick, "content":content};
						
						$.ajax({
							url: '/farmstory/board/comment.do',
							type: 'POST',
							dataType: 'json',
							data: json,
							success: function(result){
								
								if(result.length == 0){
									comment.remove();
								}else{
									empty.remove();
								}
								for(var i in result){
									if( i > 0){
										var commentCloned = comment.clone();
										commentCloned.find("span > .nick").text(result[i].nick);
										commentCloned.find("span > .date").text(result[i].rdate.substring(2,10));
										commentCloned.find("textarea").text(result[i].content);
										comments.append(commentCloned);
									}else{
										comment.find("span > .nick").text(result[i].nick);
										comment.find("span > .date").text(result[i].rdate.substring(2,10));
										comment.find("textarea").text(result[i].content);
									}
								}
							}
						});
						
						content.val('');
						
						return false;
						
					});
					
					
				});
			
			
			
			</script>
			
		</div><!-- board 끝 -->
      <!-- 내용 끝 -->
    </article>
  </div>
</section>
<%@include file="../_footer.jsp" %>
