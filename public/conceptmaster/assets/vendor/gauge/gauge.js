
"use strict";
// ============================================================== 
// Guage 1
// ============================================================== 
var opts = {
    angle: 0, // The span of the gauge arc
    lineWidth: 0.32, // The line thickness
    radiusScale: 1, // Relative radius
    pointer: {
        length: 0.6, // // Relative to gauge radius
        strokeWidth: 0.088, // The thickness
        color: '#2e2f39' // Fill color
    },
    limitMax: false, // If false, max value increases automatically if value > maxValue
    limitMin: false, // If true, the min value of the gauge will be fixed
    colorStart: '#e4e4ee', // Colors
    colorStop: '#5969ff', // just experiment with them
    strokeColor: '#e4e4ee', // to see which ones work best for you
    generateGradient: true,
    highDpiSupport: true, // High resolution support

};
var target = document.getElementById('gauge1'); // your canvas element
var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
gauge.maxValue = 1000; // set max gauge value
gauge.setMinValue(0); // Prefer setter over gauge.minValue = 0
gauge.animationSpeed = 76; // set animation speed (32 is default value)
//gauge.set(0); // set actual value
function get_request_gauge(){
    $.ajax({
        type:"get",
        url:"/admin/load/request/counter",
        data:{_token:$("input[name='_token']").val()},
        success:function(data){
            data=serialze_data(data);
            gauge.set(data[0]["counter"]);
            $("#gauge1_value").html("عدد طلبات المرسلة الى الخادم أخر 10 دقائق"+data[0]["counter"]);
            /*console.log(data);
            console.log("will done");
            */
        },
        error:function(data){
            data=serialze_data(data);
            /*console.log(data);*/

        },
        statusCode:{
            404:function(data){
                alert("Error 404");
            },
            500:function(data){
                alert("Error 404");
            },
        }
    });
}
var load_gauge_refresh = setInterval("get_request_gauge()", 2500 );
function load_load_data(){
    $.ajax({
        type:"get",
        url:"/admin/load/request/all_load",
        data:{_token:$("input[name='_token']").val()},
        success:function(data){
            data=serialze_data(data);
            let i=0;
            let show=[];
            for (const key in data) {
                show.push(data[key]["counter"])
                i++;
            }
            $("#sparkline2").sparkline(show, 
            {
                type: 'line',
                height: 135,
                barWidth: 10,
                barSpacing: 4,
                barColor: '#5969ff',
                
                
            });

            /*console.log(data);
            console.log("will done");
            */
        },
        error:function(data){
            data=serialze_data(data);
            /*console.log(data);*/

        },
        statusCode:{
            404:function(data){
                alert("Error 404");
            },
            500:function(data){
                alert("Error 404");
            },
        }
    });
}

load_load_data();

var load_sparkline_refresh = setInterval("load_load_data()", 2500 );
    



















