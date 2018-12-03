function visualization(data) {
	d3.select("svg").selectAll("*").remove();
	
	var margin = { top: 30, right: 20, bottom: 30, left: 50 },
		width = 600 - (margin.left + margin.right);
		height = 500 - (margin.top + margin.bottom);
	
	var xScale = d3.scale.linear().domain([0, data.maxX]).range([0, width]);
	var yScale = d3.scale.linear().domain([0, data.maxY]).range([height, 0]);
	var colorScale = d3.scale.linear().domain([0, data.maxY]).range([0, 255]);
	
	var xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(5).tickValues([1, 2, 3, 4, 5]);
	var yAxis = d3.svg.axis().scale(yScale).orient("left").tickPadding(10);
	
	var zoom = 
		d3.behavior.zoom()
			.x(xScale)
			.y(yScale)
			.on("zoom", function() {
				svg
				.attr("transform", "translate(" + d3.event.translate + ")" + " scale(" + d3.event.scale + ")");
			});
	
	var svg = 
		d3.select("#visualization")
		.select("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom)
			.call(zoom)
		.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")")
			.attr("class", "behaviorG");
	svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + height + ")").call(xAxis);
	svg.append("g").attr("class", "y axis").call(yAxis);
	
	svg.selectAll("circle.behavior").data(data.ProcessList).enter()
	.append("circle")
		.attr("class", "behavior")
		.attr("r", 5)
		.attr("cx", function(d) { return width - xScale(d.x); })
		.attr("cy", function(d) { return yScale(d.y); })
		.style("fill", function(d) {
			return "rgb(" + colorScale(d.y) + ", 0, 0)";
		});
	
	d3.select("g.behaviorG").selectAll("circle")
		.on("click", evtClick)
		.on("mouseover", evtOver)
		.on("mouseout", evtOut);
	
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

function lineChart() {
	var margin = { top: 30, right: 20, bottom: 30, left: 50 },
		width = 600 - (margin.left + margin.right),
		height = 500 - (margin.top + margin.bottom);
	
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
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")")
		.call(d3.behavior.zoom().on("zoom", function() {
			svg.attr("transform", "translate(" + d3.event.translate + ")" + " scale(" + d3.event.scale + ")");
		}))
	
	d3.csv("dataset/data.csv", function(error, data) {
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