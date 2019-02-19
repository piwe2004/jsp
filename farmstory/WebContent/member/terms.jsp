<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../_header.jsp" %>
<script>
			$(document).ready(function(){
						$(".btnNext").click(function(e){
							/* if($("input:checkbox[name='chk1']").is(":checked") == true ){
								if($("input:checkbox[name='chk2']").is(":checked") == true ){
								}else{
									e.preventDefault();
									alert("개인정보 취급방침에 동의하지 않으셨습니다.");
									console.log("aaa");
								}
							}else{
								console.log("aaaaaaa");
								e.preventDefault();
								alert("사이트 이용약관에 동의하지 않으셨습니다.");
							}	*/					
							var rs1 = $("input[name='chk1']").is(":checked");
							var rs2 = $("input[name='chk2']").is(":checked");
							
							if(!rs1){
								alert("사이트 이용약관에 동의하지 않으셨습니다.");
								return false;
							}else if( !rs2){
								alert("개인정보 취급방침에 동의하지 않으셨습니다.");
								return false;
							}else{
								return true;
							}

						}); 			
			});
		</script>
<div id="terms">
	<section>
		<table>
			<caption>사이트 이용약관</caption>
			<tr>
				<td>
					<textarea readonly>${vo.getTerms() }</textarea>
					<div>
						<label><input type="checkbox" name="chk1" />&nbsp;동의합니다.</label>        
					</div>
				</td>
			</tr>
		</table>
	</section>			
	<section>
		<table>
			<caption>개인정보 취급방침</caption>
			<tr>
				<td>
					<textarea readonly>${vo.privacy }</textarea>
					<div>
						<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
					</div>
				</td>
			</tr>
		</table>
	</section>
	
	<div>
		<a href="/farmstory/member/login.do" class="btnCancel">취소</a>
		<a href="/farmstory/member/register.do" class="btnNext">다음</a>
	</div>
	
</div>
<%@include file="../_footer.jsp" %>











