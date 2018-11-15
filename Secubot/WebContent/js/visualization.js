// TODO: loadScript 함수의 인자로 들어오는 data는 JSON 객체.
function loadScript() {
	d3.csv("dataset/tweetdata.csv", visualization);
	
	function visualization(data) {
		var xScale = d3.scale.linear().domain([1, 10, 5]).range([20, 480]);
		var yScale = d3.scale.linear().domain([0, 35]).range([480, 20]);
		
		var xAxis = d3.svg.axis().scale(xScale).orient("bottom").tickSize(480).tickValues([1,2,3,4,5,6,7,8,9,10]);
		d3.select("#visualization").select("svg").append("g").attr("id", "xAxisG").call(xAxis);
		
		var yAxis = d3.svg.axis().scale(yScale).orient("right").ticks(10).tickSize(480).tickSubdivide(true);
		d3.select("#visualization").select("svg").append("g").attr("id", "yAxisG").call(yAxis);
		
		var allG = d3.select("#visualization").select("svg").append("g").attr("class", "allG");
		allG.selectAll("circle.tweets").data(data).enter().append("circle")
		.attr("class", "tweets")
		.attr("r", 5)
		.attr("cx", function(d) { return xScale(d.day); })
		.attr("cy", function(d) { return yScale(d.tweets); })
		.style("fill", "black");
		
		allG.selectAll("circle.retweets").data(data).enter().append("circle")
		.attr("class", "retweets")
		.attr("r", 5)
		.attr("cx", function(d) { return xScale(d.day); })
		.attr("cy", function(d) { return yScale(d.retweets); })
		.style("fill", "lightgray");
		
		allG.selectAll("circle.favorites").data(data).enter().append("circle")
		.attr("class", "favorites")
		.attr("r", 5)
		.attr("cx", function(d) { return xScale(d.day); })
		.attr("cy", function(d) { return yScale(d.favorites); })
		.style("fill", "gray");
		
		var evt = d3.select("g.allG").selectAll("circle");
		evt.on("click", evtClick);
		evt.on("mouseover", evtOver);
		evt.on("mouseout", evtOut);
		
		function evtClick(d) {
			// TODO: circle를 클릭했을 때 모달이 뜨는 로직
			d3.select(this).attr("data-toggle", "modal").attr("data-target", "#myModal");
		}
		
		function evtOver(d) {
			d3.select(this)
			.transition().duration(500).attr("r", 10);
		}
		
		function evtOut(d) {
			// TODO: mouseout 이벤트 로직
			d3.select(this)
			.transition().duration(500).attr("r", 5);
		}
		
		
		
		
	}
}