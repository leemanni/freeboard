function formCheck(obj) {
	if(!obj.password.value || obj.password.value.trim().length==0){
		alert('비밀번호를 반드시 입력해야 합니다.')
		obj.password.value ='';
		obj.password.focus();
		return false;
	}
	return true
}