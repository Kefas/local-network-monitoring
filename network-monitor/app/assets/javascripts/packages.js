$(function () {
    // var arr_data = [
    //     [gd(2012, 1, 1), 82],
    //     [gd(2012, 1, 2), 23],
    //     [gd(2012, 1, 3), 66],
    //     [gd(2012, 1, 4), 9],
    //     [gd(2012, 1, 5), 150],
    //     [gd(2012, 1, 6), 6],
    //     [gd(2012, 1, 7), 9]
    // ];

    var from_ip = $('#from_ip small')[0].innerHTML
    var data

    if(from_ip) {
        $.ajax({
            dataType: "text",
            url: "test.json",
            type: "GET",
            data: {from_ip: from_ip},
            success: function(json) {
                arr_data = JSON.parse(json);

                arr_data.forEach(function(entry) {
                    entry[0] = new Date(entry[0])
                });

                var chart_plot_01_settings = {
                    series: {
                        lines: {
                            show: false,
                            fill: true
                        },
                        splines: {
                            show: true,
                            tension: 0.01,
                            lineWidth: 1,
                            fill: 0.4
                        },
                        points: {
                            radius: 0,
                            show: true
                        },
                        shadowSize: 2
                    },
                    grid: {
                        verticalLines: true,
                        hoverable: true,
                        clickable: true,
                        tickColor: "#d5d5d5",
                        borderWidth: 1,
                        color: '#fff'
                    },
                    colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
                    xaxis: {
                        tickColor: "rgba(51, 51, 51, 0.06)",
                        mode: "time",
                        tickSize: [1, "day"],
                        //tickLength: 10,
                        axisLabel: "Date",
                        axisLabelUseCanvas: true,
                        axisLabelFontSizePixels: 12,
                        axisLabelFontFamily: 'Verdana, Arial',
                        axisLabelPadding: 10
                    },
                    yaxis: {
                        ticks: 8,
                        tickColor: "rgba(51, 51, 51, 0.06)",
                    },
                    tooltip: false
                };


                if ($("#chart_plot_01").length) {
                    console.log('Plot1');

                    $.plot($("#chart_plot_01"), [arr_data], chart_plot_01_settings);
                }
            }
        })

    }



});