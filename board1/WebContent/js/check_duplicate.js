// 중복여부 상태변수
var isUidOk = false;
var isNickOk = false;
var isEmailOk = false;
var isHpOk = false;

$(function(){
				//아이디 중복체크
				 //$("input[name=uid]").keyup(function(){
				 $("input[name=uid]").focusout(function(){
					var tag = $(this);
					 var uid = $(this).val();
/* 					var url  =  "./proc/checkUid.jsp?uid="+uid; */
					
					$.ajax({
						url :	"./proc/checkUid.jsp?uid="+uid,
						type :	"get",
						dataType :	'json',
						success :	function(data){
							if(data.result ==1){
								$(".resultId").css("color","red").text("이미사용중인 아이디입니다.");
								isUidOk = false;
								//tag.focus();
							}else{
								$(".resultId").css("color","blue").text("사용가능한 아이디입니다.");
								isUidOk = true;
							}
						}
					});
				});
				 
				 //닉네임중복체크
				 $("input[name=nick]").focusout(function(){
					var tag = $(this);
					 var nick = $(this).val();
					
					$.ajax({
						url :	"./proc/checkNick.jsp?nick="+nick,
						type :	"get",
						dataType :	'json',
						success :	function(nick){
							if(nick.result ==1){
								$(".resultNick").css("color","red").text("이미사용중인 닉네임입니다.");
								isNickOk = false;
								//tag.focus();
							}else{
								$(".resultNick").css("color","blue").text("사용가능한 닉네임입니다.");
								isNickOk = true;
							}
						}
					});
				});
 				 //이메일중복체크
 				  $("input[name=email]").focusout(function(){
					var tag = $(this);
					 var email = $(this).val();
					
					$.ajax({
						url :	"./proc/checkEmail.jsp?email="+email,
						type :	"get",
						dataType :	'json',
						success :	function(email){
							if(email.result ==1){
								$(".resultEmail").css("color","red").text("이미사용중인 이메일입니다.");
								isEmailOk = false;
								//tag.focus();
							}else{
								$(".resultEmail").css("color","blue").text("사용가능한 이메일입니다.");
								isEmailOk = true;
							}
						}
					});
				});
				 //휴대폰중복체크
 				$("input[name=hp]").focusout(function(){
					var tag = $(this);
					var hp = $(this).val();
 						
					$.ajax({
 						url : "./proc/checkHp.jsp?hp="+hp,
						type : "get",
						dataType: "json",
						success : function(hp){
							if(hp.result == 1){
								$(".resultHp").css("color","red").text("이미사용중인 번호입니다.");
								isHpOk = false;
								//tag.focus();
							}else{
								$(".resultHp").css("color","blue").text("사용가능한 번호입니다.");
								isHpOk = true;
							}
						}
					});
				});
			});