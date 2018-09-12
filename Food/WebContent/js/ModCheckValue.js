/**
 *  
 */
function updateInfoConfirm() {

	if(!document.userInfo.oldpwd.value){
		alert("기존 비밀번호를 입력하세요.");
		document.userInfo.oldpwd.focus();
		return false;
	}

	if(!document.userInfo.pwd.value){
		alert("비밀번호를 입력하세요.");
		document.userInfo.pwd.focus();
		return false;
	}

	if(document.userInfo.pwd.value != document.userInfo.pwdcheck.value ){
		alert("비밀번호가 일치하지 않습니다.");
		document.userInfo.pwdcheck.focus();
		return false;
	}

	if(!document.userInfo.gender.value){
		alert("성별을 입력하세요.");
		return false;
	}

	document.userInfo.submit();

}

function back() {
	history.go(-1);
}