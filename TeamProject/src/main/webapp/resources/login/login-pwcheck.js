$(document).ready(function() {
	// 비밀번호 규칙 정규식 : 영문, 숫자 혼용해서 8~20자 이내
	var getPw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	
	//시작하면 아이디에 포커스
	$('#checkpassword').focus();
	
	//비밀번호
	$('#checkpassword').bind('input', function() {
		if($('#checkpassword').val() == ''){
			$('#errMsg_004').text('비밀번호를 입력해주세요.');
			$('#checkpassword').css('border', '1px solid red');
			$('#errMsg_004').css('color', 'red');
			$('#errMsg_004').css('font-size', '12px');
			$('#checkpassword').focus();
		}else if(!getPw.test($('#checkpassword').val())){
			$('#errMsg_004').text('숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.');
			$('#checkpassword').css('border', '1px solid red');
			$('#errMsg_004').css('color', 'red');
			$('#errMsg_004').css('font-size', '12px');
			$('#checkpassword').focus();
		}else {
			$('#errMsg_004').text('');
			$('#checkpassword').css('border', '1px solid #ebebeb');
			$('#checkpassword').focus();
		}
	});
	
	//비밀번호 확인
	$('#check_re_password').bind('input', function() {
		if($('#check_re_password').val() == ''){
			$('#errMsg_005').text('비밀번호를 입력해주세요.');
			$('#check_re_password').css('border', '1px solid red');
			$('#errMsg_005').css('color', 'red');
			$('#errMsg_005').css('font-size', '12px');
			$('#check_re_password').focus();
		}else if($('#check_re_password').val() != $('#checkpassword').val()){
			$('#errMsg_005').text('비밀번호가 일치하지 않습니다.');
			$('#check_re_password').css('border', '1px solid red');
			$('#errMsg_005').css('color', 'red');
			$('#errMsg_005').css('font-size', '12px');
			$('#check_re_password').focus();
		}else {
			$('#errMsg_005').text('');
			$('#check_re_password').css('border', '1px solid #ebebeb');
			$('#check_re_password').focus();
		}
	});
	
	//회원가입 버튼을 눌렀을 때
	$('#checksubmit').click(function(event) {
		//** 비밀번호 체크 **//
		var userPw = $('#checkpassword').val();
		var pwLen = userPw.length;
		
		if(pwLen < 1) {
			$("#errMsg_004").show();
			$("#errMsg_004").text("비밀번호를 입력해주세요.");
			$('#checkpassword').css('border', '1px solid red');
			$('#errMsg_004').css('color', 'red');
			$('#errMsg_004').css('font-size', '12px');
			event.preventDefault();	
		}else if(!getPw.test($('#checkpassword').val())){
			$("#errMsg_004").show();
			$('#errMsg_004').text('숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.');
			$('#checkpassword').css('border', '1px solid red');
			$('#errMsg_004').css('color', 'red');
			$('#errMsg_004').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_004").hide();
		}
		
		//** 비밀번호 확인 체크 **//
		var userPw2 = $('#check_re_password').val();
		var pw2Len = userPw2.length;
		
		if(pw2Len < 1) {
			$("#errMsg_005").show();
			$("#errMsg_005").text("비밀번호를 입력해주세요.");
			$('#check_re_password').css('border', '1px solid red');
			$('#errMsg_005').css('color', 'red');
			$('#errMsg_005').css('font-size', '12px');
			event.preventDefault();
		}else if($('#check_re_password').val() != $('#checkpassword').val()){
			$("#errMsg_005").show();
			$('#errMsg_005').text('비밀번호가 일치하지 않습니다.');
			$('#check_re_password').css('border', '1px solid red');
			$('#errMsg_005').css('color', 'red');
			$('#errMsg_005').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_005").hide();
		}
		
	});
});