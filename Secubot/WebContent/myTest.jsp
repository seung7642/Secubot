<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- d3 -->
<link href="css/d3.css?ver=2" rel="stylesheet">
</head>
<body>

	<a href="${pageContext.request.contextPath}/index.jsp" target="_blank">link</a>
	<button onclick="window.open('${pageContext.request.contextPath}/popup.jsp',
	'window_name', 'width=700, height=400, location=no, status=no, scrollbars=yes');">popup</button>


	<!-- d3.js -->
	<script src="js/d3.v3.min.js"></script>
    <script>
        var svg = d3.select("body")
                    .append("svg")
                    .attr("width",400)
                    .attr("height",400);
        var data = [40, 100, 80, 140, 60, 70];
        
        var x = d3.scale.linear()
                .domain([0,200])
                .range([10, 300]);
                
        var rect = svg.selectAll("rect")
                    .data(data)
                    .enter()
                    .append("rect")
                    .attr("x",10)
                    .attr("y", function(d, i){return i * (20 + 1) })
                    .attr("width",function(d){return x(d)})
                    .attr("height", 20)
                    .attr("fill", "steelblue");
            
        var xAxis = d3.svg.axis()
                .scale(x)
                .orient("bottom")
                .ticks(5)
                .outerTickSize(0)
                .tickPadding(-5)
                ;
                
        svg.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0,130)")
          .call(xAxis);
        
        var label = svg.selectAll(".label")
            .data(data)
            .enter()
            .append("text")
            .attr("x", function(d, i){return x(d)})
            .attr("y", function(d, i){return i * (20 + 1)+16})
            .attr("text-anchor","end")
            .text(function(d){return d})
            .style("fill", "white");
    </script>
</body>
</html>