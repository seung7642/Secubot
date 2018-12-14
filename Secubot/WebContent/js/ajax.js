// 내분점 공식
function scaleNum(D1,D2,T1,T2,n){
	r1 = (n-D1)/(D2-D1);
	r2 = (D2-n)/(D2-D1);
	return (T2*r2 + T1*r1)/(r1+r2);
}

function getProcessList() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/ProcessList?total=1d&interval=1m',
		type: 'GET',
		async: true, // 비동기로 하면 잘되는데, 동기로하면 400 Bad Request가 나옴.
		success: function(el) {
			console.log("success: " + el);
		}
	}).responseText;
	//setTimeout("getProcessList()", 20000);
	console.log(data);
	return data;
}

function getAgentList() {
	var bodyContent = $.ajax({
		url: "http://211.193.58.162:2222/AgentList",
		global: false,
		type: "GET",
		async: false
	}).responseText;
	return bodyContent;
}

function checkMyNoti() {
	var data = $.ajax({
		url: 'http://localhost:8080/Secubot/checkMyNoti',
		type: 'GET',
		async: false,
		success: function(el) {
			if (el.notiCount) {
				document.querySelector("span.count").innerText = el.notiCount;
				document.querySelector("span > strong").innerText = el.notiCount;
				$(".xAlarm").removeClass("notiActive");
				$(".oAlarm").removeClass("notiActive");
				$(".xAlarm").removeClass("nonotiActive");
				$(".oAlarm").removeClass("nonotiActive");
				$(".xAlarm").addClass(" nonotiActive");
				$(".oAlarm").addClass(" notiActive");
			} else {
				$(".xAlarm").removeClass("notiActive");
				$(".oAlarm").removeClass("notiActive");
				$(".xAlarm").removeClass("nonotiActive");
				$(".oAlarm").removeClass("nonotiActive");
				$(".xAlarm").addClass(" notiActive");
				$(".oAlarm").addClass(" nonotiActive");
			}
		}
	}).responseText;
	//setTimeout("checkMyNoti()", 5000);
	return data;
}

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
}

function todayEventCount() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/TodayEventCount',
		type: 'GET',
		async: false,
		success: function(el) {
			
		}
	}).responseText;
	var parse = JSON.parse(data);
	document.querySelector('.today-event-count').innerText = parse.result;
	setTimeout("todayEventCount", 100000);
	return data;
}

function todayProcessCount() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/TodayProcessCount',
		type: 'GET',
		async: false,
		success: function(el) {
			console.log("Success: todayProcessCount");
		}
	}).responseText;
	var parse = JSON.parse(data);
	document.querySelector('.today-process-count').innerText = parse.result;
	setTimeout("todayEventCount", 100000);
	return data;
}

function todayNetworkCount() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/TodayNetworkCount',
		type: 'GET',
		async: false,
		success: function(el) {
		}
	}).responseText;
	var parse = JSON.parse(data);
	document.querySelector('.today-network-count').innerText = parse.result;
	setTimeout("todayNetworkCount", 100000);
	return data;
}

function todayRuleCount() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/TodayRuleCount',
		type: 'GET',
		async: false,
		success: function(el) {
		}
	}).responseText;
	var parse = JSON.parse(data);
	document.querySelector('.today-rule-count').innerText = parse.result;
	setTimeout("todayRuleCount", 100000);
	return data;
}