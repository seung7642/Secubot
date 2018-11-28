function visualization(data) {
	d3.select("svg").selectAll("*").remove();
	var formatAxis = d3.format("label");
	
	var xScale = d3.scale.linear().domain([data.minX, data.maxX]).range([20, 200]);
	var yScale = d3.scale.linear().domain([data.minY, data.maxY]).range([480, 0]);
	
	/*
	 *	설명: 차트의 축을 생성한다.
	 */
	var xAxis = d3.svg.axis().scale(xScale).orient("bottom").tickSize(1100).tickFormat(formatAxis);
	// d3.select("#visualization").select("svg").append("g").attr("id", "xAxisG").call(xAxis);
	var yAxis = d3.svg.axis().scale(yScale).orient("right").ticks(10).tickSize(1050);
	// d3.select("#visualization").select("svg").append("g").attr("id", "yAxisG").call(yAxis);
	
	/*
	 *	설명: 확대 & 드래그 기능을 추가한다.
	 */
	var zoom = zoomFunc(1, 10);
	
	/*
	 *	설명: Circle을 생성한다.
	 *	개발 참고사항: data() 메서드의 매개변수 타입은 배열이다.
	 */
	var allG = d3.select("#visualization").select("svg").append("g").attr("class", "allG").call(zoom);
	allG.selectAll("circle.behavior").data(data.ProcessList).enter().append("circle")
	.attr("class", "behavior")
	.attr("r", 5)
	//.attr("cx", function(d) { return 1300 - scaleNum(0,data.maxX,10,600,d.x); })
	.attr("cx", function(d) { return 200 - xScale(d.x); })
	.attr("cy", function(d) { return yScale(d.y); })
	.style("fill", "black");
	
	/*
	 *	설명: 각 Circle에 이벤트를 추가한다.
	 */
	var evt = d3.select("g.allG").selectAll("circle");
	evt.on("click", evtClick);
	evt.on("mouseover", evtOver);
	evt.on("mouseout", evtOut);
	
	function evtClick(d) {
		// TODO: circle를 클릭했을 때 popup이 뜨는 로직
		console.log(d.MD5);
		var that = d3.select(this);
		var popUrl = "/Secubot/popup.jsp?md5=" + d.MD5 + "&imagename=" + d.ImageName;
		var popOption = "width=700, height=400, scrollbars=no, status=no;";
		window.open(popUrl, popOption);
	}
	
	function evtOver(d) {
		d3.select(this).transition().duration(500).attr("r", 10);
	}
	
	function evtOut(d) {
		// TODO: mouseout 이벤트 로직
		d3.select(this).transition().duration(500).attr("r", 5);
	}
}

function zoomFunc(x, y) {
	var zoom = d3.behavior.zoom()
	.scaleExtent([x, y])
	.on("zoom", function() {
		var e = d3.event;
		var tx = Math.min(0, Math.max(e.translate[0], width - width * e.scale));
		var ty = Math.min(0, Math.max(e.translate[1], height - height * e.scale));
		
		zoom.translate([tx, ty]);
	});
	
	return zoom;
}

function dragFunc() {
	var drag = d3.behavior.drag()
	.origin(function(d) { return d; })
	.on("dragstart", dragstarted)
	.on("drag", dragged)
	.on("dragend", dragended);
	
	function dragstarted(d) {
		d3.event.sourceEvent.stopPropagation();
		d3.select(this).classed("dragging", true);
	}
	
	function dragged(d) {
		d3.select(this)
		.attr("cx", d.x = d3.event.x)
		.attr("cy", d.y = d3.event.y);
	}
	
	function dragended(d) {
		d3.select(this).classed("dragging", false);
	}
}

function lineChart() {
	var margin = { top: 30, right: 20, bottom: 30, left: 50 },
		width = 600 - (margin.left + margin.right),
		height = 270 - (margin.top + margin.bottom);
	
	var parseDate = d3.time.format("%d-%b-%y").parse;
	var formatTime = d3.time.format("%e %B");
	
	var xScale = d3.time.scale().range([0, width]);
	var yScale = d3.scale.linear().range([height, 0]);
	
	var xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(5);
	var yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(5);
	
	var valueLine = d3.svg.line()
	.x(function(d) { return xScale(d.date); })
	.y(function(d) { return yScale(d.close); });
	
	var div = d3.select("body").append("div")
	.attr("class", "tooltip")
	.style("opacity", 0);
	
	var svg = d3.select("#line")
	.append("svg")
		.attr("width", width + margin.left + margin.right)
		.attr("height", height + margin.top + margin.bottom)
	.append("g")
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
	d3.csv("dataset/data.csv", function(error, date) {
		data.forEach(function(d) {
			d.date = parseDate(d.date);
			d.close = +d.close;
		});
		
		xScale.domain(d3.extent(data, function(d) { return d.date; }));
		yScale.domain([0, d3.max(data, function(d) { return d.close; })]);
		
		svg
		.append("path")
			.attr("class", "line")
			.attr("d", valueLine(data));
		
		svg.selectAll("dot").data(data).enter()
		.append("circle")
			.attr("r", 5)
			.attr("cx", function(d) { return xScale(d.date); })
			.attr("cy", function(d) { return yScale(d.close); })
			.on("mouseover", function(d) {
				div.transition().duration(200).style("opacity", .9);
				div.html(formatTime(d.date) + "<br />" + d.close)
					.style("left", (d3.event.pageX) + "px")
					.style("top", (d3.event.pageY - 28) + "px");
			})
			.on("mouseout", function(d) {
				div.transition.duration(500).style("opacity", 0);
			});
		
		svg
		.append("g")
			.attr("class", "x axis")
			.attr("transform", "translate(0, " + height + ")")
			.call(xAxis);
		
		svg
		.append("g")
			.attr("class", "y axis")
			.call(yAxis);
	})
}