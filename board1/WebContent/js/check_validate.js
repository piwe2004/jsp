$(function(){
				$("#regForm").submit(function(){
								
					if(!isUidOk){
						alert("아이디가 이미 사용중입니다.");
						return false;
					}
					if(!isNickOk){
						alert("이미 등록된 닉네임입니다.");
						return false;
					}
					if(!isEmailOk){
						alert("이미 등록된 이메일입니다.");
						return false;
					}
					if(!isHpOk){
						alert("이미등록된 휴대폰번호 입니다.");
						return false;
					}
					
					//var regType1 = /^[A-Za-z0-9+]*$/;
					
					// 아이디 자리수 체크
					if($("input[name=uid]").val().length < 4 ){
						alert("아이디는 4자리 이상 입력하셔야합니다.");
						return false;
					}
					// 비번 일치여부 확인
					if($("input[name=pw1]").val() != $("input[name=pw2]").val() ){
						alert("비밀번호가 서로 일치하지 않습니다.");
						return false;
					}
					// 이름 영문 숫자 포함여부 체크
				/* 	if($("input[name=name]").val()){	
					} */
					
					
					
					return true;
				});
				
			});