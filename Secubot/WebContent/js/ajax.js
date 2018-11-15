function getNetworkData() {
	const xhr = XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (this.readystate == 4 && this.readystate == 200) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
		}
	};
	xhr.open("GET", "network");
	xhr.send();
	// setTimeout("getNetworkData()", 10000);
}

function getElasticData() {
	const xhr = XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (this.readystate == 4 && this.readystate == 200) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
		}
	};
	xhr.open("GET", "http://192.168.1.233:2020/test");
	xhr.send();
	// setTimeout("getElasticData()", 10000);
}