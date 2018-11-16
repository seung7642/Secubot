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
	let data;
	const xhr = new XMLHttpRequest();
	// XMLHttpRequest.readyState 프로퍼티가 변경(이벤트 발생)될 때마다 'onreadystatechange' 이벤트 핸들러를 호출한다.
	xhr.onreadystatechange = (e) => {
		// XMLHttpRequest.readyState: 4 => DONE(서버 응답 완료)
		if (xhr.readyState === 4) {
			// TODO: XMLHttpRequest로 받아온 데이터를 처리하는 로직
			if (xhr.status === 200) {
				let res = xhr.responseText;
				data = JSON.parse(res);
				console.log(data.ProcessList[0]);
				
				function visualization(data) {
					var xScale = d3.scale.linear().domain([1, 100]).range([20, 480]);
					var yScale = d3.scale.linear().domain([1, 10]).range([480, 20]);
					
					var xAxis = d3.svg.axis().scale(xScale).orient("bottom").tickSize(1000).tickValues([1,2,3,4,5,6,7,8,9,10]);
					// d3.select("#visualization").select("svg").append("g").attr("id", "xAxisG").call(xAxis);
					
					var yAxis = d3.svg.axis().scale(yScale).orient("right").ticks(10).tickSize(1000).tickSubdivide(true);
					// d3.select("#visualization").select("svg").append("g").attr("id", "yAxisG").call(yAxis);
					
					var allG = d3.select("#visualization").select("svg").append("g").attr("class", "allG");
					allG.selectAll("circle.tweets").data(data.ProcessList).enter().append("circle")
					.attr("class", "tweets")
					.attr("r", 5)
					.attr("cx", function(d) { return xScale(d.x); })
					.attr("cy", function(d) { return yScale(d.y); })
					.style("fill", "black");
					
					var evt = d3.select("g.allG").selectAll("circle");
					evt.on("click", evtClick);
					evt.on("mouseover", evtOver);
					evt.on("mouseout", evtOut);
					
					function evtClick(d) {
						// TODO: circle를 클릭했을 때 모달이 뜨는 로직
						d3.select(this).attr("data-toggle", "modal").attr("data-target", "#myModal");
					}
					
					function evtOver(d) {
						d3.select(this).transition().duration(500).attr("r", 10);
					}
					
					function evtOut(d) {
						// TODO: mouseout 이벤트 로직
						d3.select(this).transition().duration(500).attr("r", 5);
					}
				}
				visualization(data);
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