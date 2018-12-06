// 내분점 공식
function scaleNum(D1,D2,T1,T2,n){
	r1 = (n-D1)/(D2-D1);
	r2 = (D2-n)/(D2-D1);
	return (T2*r2 + T1*r1)/(r1+r2);
}

function getProcessList() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/ProcessList',
		type: 'GET',
		async: false,
		success: function(el) {
			console.log("success");
		}
	}).responseText;
	setTimeout("getProcessList()", 20000);
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
			console.log("Success: '/checkMyNoti'");
			console.log(el);
			if (el.notiCount) {
				document.querySelector("span.count").innerText = el.notiCount;
				document.querySelector("span > strong").innerText = el.notiCount;
				$(".xAlarm").removeClass("notiActive");
				$(".oAlarm").removeClass("notiActive");
				$(".xAlarm").removeClass("nonActive");
				$(".oAlarm").removeClass("nonActive");
				$(".xAlarm").addClass(" nonActive");
				$(".oAlarm").addClass(" notiActive");
			} else {
				$(".xAlarm").removeClass("notiActive");
				$(".oAlarm").removeClass("notiActive");
				$(".xAlarm").removeClass("nonActive");
				$(".oAlarm").removeClass("nonActive");
				$(".xAlarm").addClass(" notiActive");
				$(".oAlarm").addClass(" nonActive");
			}
		}
	}).responseText;
	setTimeout("checkMyNoti()", 5000);
	return data;
}

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
}