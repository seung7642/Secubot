<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Agent Details</title>

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css?ver=1" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<style>
body {
	font: sans-serif;
}
div#window {
	width: 100%;
	height: auto;
	border: 1px solid gray;
	padding: 10px;
}
#window_0, #window_1, #window_2 {
	width: 31.5%;
	height: 500px;
	border: 1px solid gray;
	box-shadow: 3px 3px 3px 3px;
	margin: 10px;
	float: left;
	overflow-y: auto;
}
table > tbody > tr > td {
	cursor: pointer;
}
div#policy {
	margin: 20px 20px;
	padding: 20px 20px;
	border: 1px solid gray;
}
.clear {
	clear: both;
}
label {
	display: inline-block;
	text-align: right;
}
</style>
</head>
<body>
<%
	String imagename = request.getParameter("imagename");
%>
	<div id="window">
		<h1>프로세스명: <% out.println(imagename); %></h1>
		<div id="window_0">
			<table class="table table-hover table-striped table-sm">
				<caption>Process 에이전트 리스트</caption>
				<thead class="thead-dark">
					<tr>
						<th>Name</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody id="forData">
				</tbody>
			</table>
		</div>
		<div id="window_1">
			<table class="table table-hover table-striped table-sm">
				<caption>프로세스 세션</caption>
				<thead class="thead-dark">
					<tr>
						<th>세션</th>
					</tr>
				</thead>
				<tbody id="forData2">
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="window_2">
			<table class="table table-hover table-striped table-sm">
				<caption>행위 리스트</caption>
				<thead class="thead-dark">
					<tr>
						<th>UtcTime</th>
						<th>Type</th>
					</tr>
				</thead>
				<tbody id="forData3">
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="clear"></div>
		<div id="policy" class="pull-right1">
			<form action="" method="GET" class="form col-md-2" onsubmit="pausecomp(1000);alert('전송되었습니다');return false;">
				<label for="policyName">대응: </label>
				<select id="policyName" class="form-control">
					<option value="policy1">차단</option>
					<option value="policy2">정상</option>
				</select>
				<button type="submit" class="btn btn-success btn-custom m-b-5">추가</button>
			</form>
		</div>
	</div>


	<script>
	function pausecomp(millis)
	{
	    var date = new Date();
	    var curDate = null;
	    do { curDate = new Date(); }
	    while(curDate-date < millis);
	}
	var Base64 = {

			// private property
_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

		  // public method for encoding
		  encode : function (input) {
			  var output = "";
			  var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
			  var i = 0;

			  input = Base64._utf8_encode(input);

			  while (i < input.length) {

				  chr1 = input.charCodeAt(i++);
				  chr2 = input.charCodeAt(i++);
				  chr3 = input.charCodeAt(i++);

				  enc1 = chr1 >> 2;
				  enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
				  enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
				  enc4 = chr3 & 63;

				  if (isNaN(chr2)) {
					  enc3 = enc4 = 64;
				  } else if (isNaN(chr3)) {
					  enc4 = 64;
				  }

				  output = output +
					  this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
					  this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

			  }

			  return output;
		  },

		  // public method for decoding
decode : function (input) {
			 var output = "";
			 var chr1, chr2, chr3;
			 var enc1, enc2, enc3, enc4;
			 var i = 0;

			 input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

			 while (i < input.length) {

				 enc1 = this._keyStr.indexOf(input.charAt(i++));
				 enc2 = this._keyStr.indexOf(input.charAt(i++));
				 enc3 = this._keyStr.indexOf(input.charAt(i++));
				 enc4 = this._keyStr.indexOf(input.charAt(i++));

				 chr1 = (enc1 << 2) | (enc2 >> 4);
				 chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
				 chr3 = ((enc3 & 3) << 6) | enc4;

				 output = output + String.fromCharCode(chr1);

				 if (enc3 != 64) {
					 output = output + String.fromCharCode(chr2);
				 }
				 if (enc4 != 64) {
					 output = output + String.fromCharCode(chr3);
				 }

			 }

			 output = Base64._utf8_decode(output);

			 return output;

		 },

		 // private method for UTF-8 encoding
_utf8_encode : function (string) {
				   string = string.replace(/\r\n/g,"\n");
				   var utftext = "";

				   for (var n = 0; n < string.length; n++) {

					   var c = string.charCodeAt(n);

					   if (c < 128) {
						   utftext += String.fromCharCode(c);
					   }
					   else if((c > 127) && (c < 2048)) {
						   utftext += String.fromCharCode((c >> 6) | 192);
						   utftext += String.fromCharCode((c & 63) | 128);
					   }
					   else {
						   utftext += String.fromCharCode((c >> 12) | 224);
						   utftext += String.fromCharCode(((c >> 6) & 63) | 128);
						   utftext += String.fromCharCode((c & 63) | 128);
					   }

				   }

				   return utftext;
			   },

			   // private method for UTF-8 decoding
_utf8_decode : function (utftext) {
				   var string = "";
				   var i = 0;
				   var c = c1 = c2 = 0;

				   while ( i < utftext.length ) {

					   c = utftext.charCodeAt(i);

					   if (c < 128) {
						   string += String.fromCharCode(c);
						   i++;
					   }
					   else if((c > 191) && (c < 224)) {
						   c2 = utftext.charCodeAt(i+1);
						   string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
						   i += 2;
					   }
					   else {
						   c2 = utftext.charCodeAt(i+1);
						   c3 = utftext.charCodeAt(i+2);
						   string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
						   i += 3;
					   }

				   }

				   return string;
			   },

URLEncode : function (string) {
				return escape(this._utf8_encode(string));
			},

			// public method for url decoding
URLDecode : function (string) {
				return this._utf8_decode(unescape(string));
			}
		}</script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		var urlString = window.location.href;
		var url = new URL(urlString);
		var md5 = url.searchParams.get("md5");
		function getProcessAgentList() {
			console.log("MD5: " + md5);
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/ProcessAgentList?MD5=" + md5,
				global: false,
				type: "GET",
				async: false
			}).responseText;
			return bodyContent;
		}
		tmp = getProcessAgentList();
		console.log("tmp: " + tmp);
		parse = JSON.parse(tmp);
		for (var i in parse.ProcessAgentList) {
			document.querySelector("#forData").innerHTML += "<td>" + parse.ProcessAgentList[i].UserName + "</td>" +
			"<td class=" + parse.ProcessAgentList[i].AgentID + ">" + parse.ProcessAgentList[i].userPhone + "</td>";
			//parse.ProcessAgentList[i].AgentID
			
		}
		
		var forData = document.querySelector("#forData");
		console.log(forData);
		forData.addEventListener('click', function(e) {
				console.log("MD5: " + md5);
				var bodyContent = $.ajax({
					url: "http://211.193.58.162:2222/ProcessGuidList?MD5=" + md5 + "&AgentID=" +e.target.className,
					global: false,
					type: "GET",
					async: false
				}).responseText;
				parse = JSON.parse(bodyContent);
				document.querySelector("#forData2").innerHTML = "";
				for (var i in parse.ProcessGuidList){
					document.querySelector("#forData2").innerHTML += "<td class=" + e.target.className +">" + parse.ProcessGuidList[i] + "</td>";
				}

				
		}, false);
		var forData = document.querySelector("#forData2");
		console.log(forData);
		forData.addEventListener('click', function(e) {
				var bodyContent = $.ajax({
					url: "http://211.193.58.162:2222/ProcessEventList?Guid=" + e.target.innerText + "&AgentID=" +e.target.className,
					global: false,
					type: "GET",
					async: false
				}).responseText;
				parse = JSON.parse(bodyContent);
				document.querySelector("#forData3").innerHTML = "";
				for (var i in parse.ProcessEventList){
					document.querySelector("#forData3").innerHTML +=  "<td class=" + Base64.encode(JSON.stringify(parse.ProcessEventList[i])) + "</td>" + parse.ProcessEventList[i].UtcTime +  
					"</td>"+"<td class=" + Base64.encode(JSON.stringify(parse.ProcessEventList[i])) + ">" + parse.ProcessEventList[i].type + 
					"</td>";
				}

				
		}, false);
		var forData = document.querySelector("#forData3");
		console.log(forData);
		forData.addEventListener('click', function(e) {
				alert(Base64.decode(e.target.className));

		}, false);
	</script>
</body>
</html>