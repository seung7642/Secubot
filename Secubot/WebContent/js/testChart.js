function loadTestChart() {
	d3.json("dataset/tweets.json", testChart);
	
	function testChart(data) {
		console.log(data);
		console.log(data.tweets);
		console.log(data.tweets[0]);
	}
}