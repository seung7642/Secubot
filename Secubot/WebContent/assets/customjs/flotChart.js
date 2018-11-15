var months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12",
    "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23",
    "24", "25", "26", "27", "28", "29", "30", "31"
];

var lowerlimit = [ [X축값, 값], [X축값, 값]];
var measurement = [ [1, 9.007], [2, 9.008], [3, 9.006], [4, 9.006],
    [5, 9.007], [6, 9.005]
];

$.fn.UseTooltip =  function() {
    var previousPoint = null;
    $(this).bind("plothover", function(event, pos, item) {
        if (item) {
            if (previousPoint != item.dataIndex) {
                previousPoint = item.dataIndex;
                $("#tooltip").remove();
                var x = item.datapoint[0];
                var y = item.datapoint[1];
                showTooltip(item.pageX, item.pageY, y+"("+item.seriex.label+")");
            }
        } else {
            $("#tooltip").remove();
            previousPoint = null;
        }
    });
};

function showTooltip(x, y, contents) {
    $('<div id="tooltip">' + contents + '</div>').css({
        position: 'absolute',
        display: 'none',
        top: y + 5,
        left: x + 20,
        border: '1px solid #4572A7',
        padding: '2px',
        size: '3',
        'background-color': 'BBFFFF',
        opacity: 0.80
    }).appendTo("body").fadeIn(150);
}

$(function() {
    $.plot($("#flotcontainer"), [
        {
            data: measurement, label: "upperSP",
            points: {show: false, radius: 0},
            dashes: {show: true, lineWidth: 1, dashLength: 3},
            color: "red"
        },
        {
            data: lowerspec, label: "lowerSP",
            points: {show: false, radius: 0},
            dashes: {show: true, lineWidth: 1, dashLength: 3},
            color: "red"
        }
    ], {
        grid: {
            hoverable: true,
            clickable: false,
            mouseActiveRadius: 30,
            backgroundColor: { colors: ["#FFFFFF", "#FFFFFF"]}
        },
        xaxis: {
            ticks: [
                [1, "1"], [2, "2"], [3, "3"], [4, "4"], [5, "5"], [6, "6"],
                [7, "7"], [8, "8"], [9, "9"], [10, "10"], [11, "11"], [12, "12"],
                [13, "13"], [14, "14"], [15, "15"], [16, "16"], [17, "17"], [18, "18"],
                [19, "19"], [20, "20"], [21, "21"], [22, "22"], [23, "23"], [24, "24"],
                [25, "25"], [26, "26"], [27, "27"], [28, "28"], [29, "29"], [30, "30"], [31, "31"]
            ]
        },
        yaxis: {
            min: 9.002,
            max: 9.012
        }
    });
    $("#flotcontainer").UseTooltip();
});