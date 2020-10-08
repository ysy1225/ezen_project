$(document).ready(function() {
	//이름 검사 정규식
	var getName= RegExp(/^[가-힣]{2,4}$/);
	//이메일 검사 정규식
	var getEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	//휴대폰 번호 검사 정규식
	var getPhone =/(01[016789])([0-9]{4})([0-9]{4})$/;
	// 비밀번호 규칙 정규식 : 영문, 숫자 혼용해서 8~20자 이내
	var getPw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	
	//시작하면 아이디에 포커스
	$('#name').focus();
	
	//이름
	$('#name').bind('input', function() {
		if($('#name').val() == ''){
			// 오류 문자열을 errMsg_01의 text를 셋팅
			$('#errMsg_01').text('이름을 입력해주세요.');
			$('#name').css('border', '1px solid red');
			$('#errMsg_01').css('color', 'red');
			$('#errMsg_01').css('font-size', '12px');
			//이름에 포커스
			$('#name').focus();
		}else if(!getName.test($('#name').val())){
			$('#errMsg_01').text('올바른 이름이 아닙니다.');
			$('#name').css('border', '1px solid red');
			$('#errMsg_01').css('color', 'red');
			$('#errMsg_01').css('font-size', '12px');
			$('#name').focus();
		}else {
			//전부맞으면 오류문자열 초기화
			$('#errMsg_01').text('');
			$('#name').css('border', '1px solid #ebebeb');
			$('#name').focus();
		}
	});
	
	//이메일
	$('#email').bind('input', function() {
		if($('#email').val() == ''){
			$('#errMsg_02').text('이메일을 입력해주세요.');
			$('#email').css('border', '1px solid red');
			$('#errMsg_02').css('color', 'red');
			$('#errMsg_02').css('font-size', '12px');
			$('#email').focus();
		}else if(!getEmail.test($('#email').val())){
			$('#errMsg_02').text('올바른 이메일 형식이 아닙니다.');
			$('#email').css('border', '1px solid red');
			$('#errMsg_02').css('color', 'red');
			$('#errMsg_02').css('font-size', '12px');
			$('#email').focus();
		}else {
			$('#errMsg_02').text('');
			$('#email').css('border', '1px solid #ebebeb');
			$('#email').focus();
		}
	});
	
	//핸드폰번호
	$('#phone').bind('input', function() {
		if($('#phone').val() == ''){
			$('#errMsg_03').text('휴대폰 번호를 입력해주세요.');
			$('#phone').css('border', '1px solid red');
			$('#errMsg_03').css('color', 'red');
			$('#errMsg_03').css('font-size', '12px');
			$('#phone').focus();
		}else if(!getPhone.test($('#phone').val())){
			$('#errMsg_03').text('올바른 휴대폰 번호가 아닙니다.');
			$('#phone').css('border', '1px solid red');
			$('#errMsg_03').css('color', 'red');
			$('#errMsg_03').css('font-size', '12px');
			$('#phone').focus();
		}else {
			$('#errMsg_03').text('');
			$('#phone').css('border', '1px solid #ebebeb');
			$('#phone').focus();
		}
	});
	
	//비밀번호
	$('#password').bind('input', function() {
		if($('#password').val() == ''){
			$('#errMsg_04').text('비밀번호를 입력해주세요.');
			$('#password').css('border', '1px solid red');
			$('#errMsg_04').css('color', 'red');
			$('#errMsg_04').css('font-size', '12px');
			$('#password').focus();
		}else if(!getPw.test($('#password').val())){
			$('#errMsg_04').text('숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.');
			$('#password').css('border', '1px solid red');
			$('#errMsg_04').css('color', 'red');
			$('#errMsg_04').css('font-size', '12px');
			$('#password').focus();
		}else {
			$('#errMsg_04').text('');
			$('#password').css('border', '1px solid #ebebeb');
			$('#password').focus();
		}
	});
	
	//비밀번호 확인
	$('#re_password').bind('input', function() {
		if($('#re_password').val() == ''){
			$('#errMsg_05').text('비밀번호를 입력해주세요.');
			$('#re_password').css('border', '1px solid red');
			$('#errMsg_05').css('color', 'red');
			$('#errMsg_05').css('font-size', '12px');
			$('#re_password').focus();
		}else if($('#re_password').val() != $('#password').val()){
			$('#errMsg_05').text('비밀번호가 일치하지 않습니다.');
			$('#re_password').css('border', '1px solid red');
			$('#errMsg_05').css('color', 'red');
			$('#errMsg_05').css('font-size', '12px');
			$('#re_password').focus();
		}else {
			$('#errMsg_05').text('');
			$('#re_password').css('border', '1px solid #ebebeb');
			$('#re_password').focus();
		}
	});
	
	/*var emailCk = 0;
	$('.button-input').click(function() {
		var userEmail = $("#email").val();
		$.ajax({
			async : true,
			url : "insertUsers.do",
			type : "post",
			dataType: "json",
			data : userEmail,
			success : function(data) {
				if(data.cnt > 0) {
					$('#errMsg_02').text('중복된 이메일 입니다.');
					$('#errMsg_02').css('color', 'red');
					$('#errMsg_02').css('font-size', '12px');
					$('#submit').attr('disabled', 'disabled');
				}else {
					$('#errMsg_02').text('사용 가능한 이메일 입니다.');
					$('#errMsg_02').css('color', 'green');
					$('#errMsg_02').css('font-size', '12px');
					$('#submit').attr('disabled');
					emailCk = 1;
				}
			}
		});
	});*/
	
	//회원가입 버튼을 눌렀을 때
	$('#submit').click(function(event) {
		//** 이름 체크 **//
		var userName = $('#name').val();
		var nameLen = userName.length;
		
		if(nameLen < 1) {
			$("#errMsg_01").show();
			$("#errMsg_01").text("이름을 입력해주세요.");
			$('#name').css('border', '1px solid red');
			$('#errMsg_01').css('color', 'red');
			$('#errMsg_01').css('font-size', '12px');
			event.preventDefault();
		}else if(!getName.test($('#name').val())){
			$("#errMsg_01").show();
			$('#errMsg_01').text('올바른 이름이 아닙니다.');
			$('#name').css('border', '1px solid red');
			$('#errMsg_01').css('color', 'red');
			$('#errMsg_01').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_01").hide();
		}
		
		//** 이메일 체크 **//
		var userEmail = $('#email').val();
		var emailLen = userEmail.length;
		
		if(emailLen < 1) {
			$("#errMsg_02").show();
			$("#errMsg_02").text("이메일을 입력해주세요.");
			$('#email').css('border', '1px solid red');
			$('#errMsg_02').css('color', 'red');
			$('#errMsg_02').css('font-size', '12px');
			event.preventDefault();
		}else if(!getEmail.test($('#email').val())){
			$("#errMsg_02").show();
			$('#errMsg_02').text('올바른 이메일 형식이 아닙니다.');
			$('#email').css('border', '1px solid red');
			$('#errMsg_02').css('color', 'red');
			$('#errMsg_02').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_02").hide();
		}
		
		//** 휴대폰 번호 체크 **//
		var userPhone = $('#phone').val();
		var phoneLen = userPhone.length;
		
		if(phoneLen < 1) {
			$("#errMsg_03").show();
			$("#errMsg_03").text("휴대폰 번호를 입력해주세요.");
			$('#phone').css('border', '1px solid red');
			$('#errMsg_03').css('color', 'red');
			$('#errMsg_03').css('font-size', '12px');
			event.preventDefault();
		}else if(!getPhone.test($('#phone').val())){
			$("#errMsg_03").show();
			$('#errMsg_03').text('올바른 휴대폰 번호가 아닙니다.');
			$('#phone').css('border', '1px solid red');
			$('#errMsg_03').css('color', 'red');
			$('#errMsg_03').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_03").hide();
		}
		
		//** 비밀번호 체크 **//
		var userPw = $('#password').val();
		var pwLen = userPw.length;
		
		if(pwLen < 1) {
			$("#errMsg_04").show();
			$("#errMsg_04").text("비밀번호를 입력해주세요.");
			$('#password').css('border', '1px solid red');
			$('#errMsg_04').css('color', 'red');
			$('#errMsg_04').css('font-size', '12px');
			event.preventDefault();	
		}else if(!getPw.test($('#password').val())){
			$("#errMsg_04").show();
			$('#errMsg_04').text('숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.');
			$('#password').css('border', '1px solid red');
			$('#errMsg_04').css('color', 'red');
			$('#errMsg_04').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_04").hide();
		}
		
		//** 비밀번호 확인 체크 **//
		var userPw2 = $('#re_password').val();
		var pw2Len = userPw2.length;
		
		if(pw2Len < 1) {
			$("#errMsg_05").show();
			$("#errMsg_05").text("비밀번호를 입력해주세요.");
			$('#re_password').css('border', '1px solid red');
			$('#errMsg_05').css('color', 'red');
			$('#errMsg_05').css('font-size', '12px');
			event.preventDefault();
		}else if($('#re_password').val() != $('#password').val()){
			$("#errMsg_05").show();
			$('#errMsg_05').text('비밀번호가 일치하지 않습니다.');
			$('#re_password').css('border', '1px solid red');
			$('#errMsg_05').css('color', 'red');
			$('#errMsg_05').css('font-size', '12px');
			event.preventDefault();
		}else {
			$("#errMsg_05").hide();
		}
		
		if(!$("#agree-term").is(":checked")) {
			alert("이용약관을 동의하셔야 합니다.");
			$('#agree-term').focus();
			return false;
		}
		
		if(idck==0){
            alert('아이디 중복체크를 해주세요');
            return false;
        }else{
        alert("회원가입을 축하합니다");
        $("#frm").submit();
        }
	});
});