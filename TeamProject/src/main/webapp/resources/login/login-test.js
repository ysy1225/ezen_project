$(document).ready(function() {
	//이름 검사 정규식
	var getName= RegExp(/^[가-힣]{2,4}$/);
	//휴대폰 번호 검사 정규식
	var getPhone =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
	
	//시작하면 아이디에 포커스
	$('#username').focus();
	
	//이름
	$('#username').bind('input', function() {
		if($('#username').val() == ''){
			// 오류 문자열을 errMsg_01의 text를 셋팅
			$('#errMsg_001').text('이름을 입력해주세요.');
			$('#username').css('border', '1px solid red');
			$('#errMsg_001').css('color', 'red');
			$('#errMsg_001').css('font-size', '12px');
			//이름에 포커스
			$('#username').focus();
		}else if(!getName.test($('#username').val())){
			$('#errMsg_001').text('올바른 이름이 아닙니다.');
			$('#username').css('border', '1px solid red');
			$('#errMsg_001').css('color', 'red');
			$('#errMsg_001').css('font-size', '12px');
			$('#username').focus();
		}else {
			//전부맞으면 오류문자열 초기화
			$('#errMsg_001').text('');
			$('#username').css('border', '1px solid #ebebeb');
			$('#username').focus();
		}
	});
	
	//핸드폰번호
	$('#userphone').bind('input', function() {
		if($('#userphone').val() == ''){
			$('#errMsg_002').text('휴대폰 번호를 입력해주세요.');
			$('#userphone').css('border', '1px solid red');
			$('#errMsg_002').css('color', 'red');
			$('#errMsg_002').css('font-size', '12px');
			$('#userphone').focus();
		}else if(!getPhone.test($('#userphone').val())){
			$('#errMsg_002').text('올바른 휴대폰 번호가 아닙니다.');
			$('#userphone').css('border', '1px solid red');
			$('#errMsg_002').css('color', 'red');
			$('#errMsg_002').css('font-size', '12px');
			$('#userphone').focus();
		}else {
			$('#errMsg_002').text('');
			$('#userphone').css('border', '1px solid #ebebeb');
			$('#userphone').focus();
		}
	});
	
	//회원가입 버튼을 눌렀을 때
	$('#usersubmit').click(function(event) {
		//** 이름 체크 **//
		var userName = $('#username').val();
		var nameLen = userName.length;
		
		if(nameLen < 1) {
			$("#errMsg_001").show();
			$("#errMsg_001").text("이름을 입력해주세요.");
			$('#username').css('border', '1px solid red');
			$('#errMsg_001').css('color', 'red');
			$('#errMsg_001').css('font-size', '12px');
			event.preventDefault();
		}else if(!getName.test($('#username').val())){
			$("#errMsg_001").show();
			$('#errMsg_001').text('올바른 이름이 아닙니다.');
			$('#username').css('border', '1px solid red');
			$('#errMsg_001').css('color', 'red');
			$('#errMsg_001').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_001").hide();
		}
		
		//** 휴대폰 번호 체크 **//
		var userPhone = $('#userphone').val();
		var phoneLen = userPhone.length;
		
		if(phoneLen < 1) {
			$("#errMsg_002").show();
			$("#errMsg_002").text("휴대폰 번호를 입력해주세요.");
			$('#userphone').css('border', '1px solid red');
			$('#errMsg_002').css('color', 'red');
			$('#errMsg_002').css('font-size', '12px');
			event.preventDefault();
		}else if(!getPhone.test($('#userphone').val())){
			$("#errMsg_002").show();
			$('#errMsg_002').text('올바른 휴대폰 번호가 아닙니다.');
			$('#userphone').css('border', '1px solid red');
			$('#errMsg_002').css('color', 'red');
			$('#errMsg_002').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_002").hide();
		}
		
	});
});