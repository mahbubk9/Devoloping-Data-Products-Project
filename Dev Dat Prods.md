Time Series Forecasting Shiny App Presentation
========================================================
author: Mahbub khan
date: 



Overview
========================================================
### This is a Financial Time Series Forecasting App.
### Financial Data is loaded from Google using quantmod R package.
### Twitter, Facebook & Apple time series available at the moment.
### Users can select start and end date of the data.
### Users can also select time frame, monthly & quarterly available at present.
### Clicking "Update view" button will show outputs in three tabs:
* Time Series tab will display the interactive time series
* Decomposition tab will display the time series decomposed into trend and seasonality
* Forecast tab will display the Forecast.
* There's also a help tab, holding supporting documentation







Time Series Interactive Visualisation
========================================================

[1] "TWTR"
<!-- LineChart generated in R 3.2.5 by googleVis 0.5.10 package -->
<!-- Tue Jun 21 12:12:26 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID7047d207d61 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "2013 Q4",
45.1 
],
[
 "2014 Q1",
65 
],
[
 "2014 Q2",
46.71 
],
[
 "2014 Q3",
42.06 
],
[
 "2014 Q4",
51.08 
],
[
 "2015 Q1",
36.23 
],
[
 "2015 Q2",
51 
],
[
 "2015 Q3",
36.05 
],
[
 "2015 Q4",
26.47 
],
[
 "2016 Q1",
22.64 
],
[
 "2016 Q2",
16.41 
] 
];
data.addColumn('string','TWTR.Date');
data.addColumn('number','TWTR.Open');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID7047d207d61() {
var data = gvisDataLineChartID7047d207d61();
var options = {};
options["allowHtml"] = true;
options["series"] = [{targetAxisIndex: 0}];

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID7047d207d61')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID7047d207d61);
})();
function displayChartLineChartID7047d207d61() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID7047d207d61"></script>
 
<!-- divChart -->
  
<div id="LineChartID7047d207d61" 
  style="width: 500; height: automatic;">
</div>






Time Series Decomposition
========================================================



![plot of chunk unnamed-chunk-2](Dev Dat Prods-figure/unnamed-chunk-2-1.png)




Time Series Forecasting
========================================================


![plot of chunk unnamed-chunk-3](Dev Dat Prods-figure/unnamed-chunk-3-1.png)
