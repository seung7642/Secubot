function getNetworkData() {
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		// readyState: 4 => DONE(서버 응답 완료)
		if (xhr.readyState === XMLHttpRequest.DONE) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
			if (xhr.status === 200) {
				console.log(xhr.responseText);
			} else {
				console.log("Error !");
			}
		}
	};
	xhr.open("GET", "network");
	xhr.send();
	setTimeout("getNetworkData()", 10000);
}

function getElasticData() {
	const xhr = new XMLHttpRequest();
	
	// XMLHttpRequest.readyState 프로퍼티가 변경(이벤트 발생)될 때마다 'onreadystatechange' 이벤트 핸들러를 호출한다.
	xhr.onreadystatechange = (e) => {
		// XMLHttpRequest.readyState: 4 => DONE(서버 응답 완료)
		if (xhr.readyState === 4) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
			if (xhr.status === 200) {
				let res = xhr.responseText;
				let parse = JSON.parse(res);
				console.log(parse.ProcessList[0]);
			}
		} else {
			let res = xhr.responseText;
		}
	};
	xhr.open("GET", "http://211.193.58.162:2222/ProcessList");
	xhr.setRequestHeader('Accept', 'application/json');
	xhr.send();
	setTimeout("getElasticData()", 10000);
}