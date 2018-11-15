function getNetworkData() {
	const xhr = XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (this.readystate == 200) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
			let obj = JSON.parse(this.responseText);
			console.log("Success: " + obj);
		} else {
			console.log("Error");
		}
	};
	xhr.open("GET", "network");
	xhr.send();
	setTimeout("getNetworkData()", 10000);
}

function getElasticData() {
	const xhr = XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (this.readystate == 4 && this.readystate == 200) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
		}
	};
	xhr.open("GET", "http://211.193.58.162:2222/Processes");
	xhr.send();
	setTimeout("getElasticData()", 10000);
}