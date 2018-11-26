// 내분점 공식
function scaleNum(D1,D2,T1,T2,n){
	r1 = (n-D1)/(D2-D1);
	r2 = (D2-n)/(D2-D1);
	return (T2*r2 + T1*r1)/(r1+r2);
}

function getElasticData() {
	var data = $.ajax({
		url: 'http://211.193.58.162:2222/ProcessList',
		type: 'GET',
		async: false,
		success: function (el) {
			console.log("success");
		}
	}).responseText;
	console.log(data);
	setTimeout("getElasticData()", 20000);
	return data;
}