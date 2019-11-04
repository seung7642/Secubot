function readNoti(el) {
	var notiNo = el;
	
	$.ajax({
		url: '/readNoti.do',
		type: 'post',
		data: {noti_no: notiNo},
		success: function() {
			console.log("success");
		}
	});
}

function deleteNoti(el) {
	var notiNo = el;
	
	$.ajax({
		url: '/deleteNoti.do',
		type: 'post',
		data: {noti_no: notiNo},
		success: function() {
			console.log("success");
		}
	})
}