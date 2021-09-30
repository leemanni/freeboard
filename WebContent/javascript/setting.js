function setting(idx, mode, title, name, content) {
	var form = document.commentForm;
	form.idx.value = idx;
	form.mode.value = mode;
	form.commentBtn.value = title;
	form.name.value = name;
	
	while (content.indexOf('<br/>') != -1) {
		content = content.replace('<br/>', '\r\n');
	}
	form.content.value = content;
}