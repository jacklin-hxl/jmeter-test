<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at
 
       http://www.apache.org/licenses/LICENSE-2.0
 
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->

<!-- 
	Stylesheet for processing 3.0 output format test result files 
	To uses this directly in a browser, add the following to the JTL file as line 2:
	<?xml-stylesheet type="text/xsl" href="jmeter-results-report_hxl.xsl"?>
	and you can then view the JTL in a browser.Edit by hxl
-->

<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" />

<!-- Defined parameters (overrideable) -->
<xsl:param    name="showData" select="'y'"/>
<xsl:param    name="titleReport" select="'Interface Test Results'"/>
<xsl:param    name="dateReport" select="'date not defined'"/>


<xsl:template match="testResults">

	<html>
		<head>
			<title><xsl:value-of select="$titleReport" /></title>
			<style type="text/css">
                #home {
                    margin: 0 100px 0px 100px;
                }
        
                #heading {
                    border: 1px solid #E7EAEC;
                    border-top-width: 5px;
                    <!-- box-shadow: 10px 10px 5px #888888; -->
                }
        
                .title {
                    font-size: 30px;
                    margin: 1px 0px 30px 0px;
                }
        
                .date {
                    font-size: 18px;
                    font-style: italic;
                    margin: 1px 0px 30px 0px;
                }
        
                #summary {
                    margin: 50px 50px 50px 50px;
                    border: 1px solid #E7EAEC;
                    border-top-width: 5px;
                    <!-- box-shadow: 10px 10px 5px #888888; -->
                    padding: 0px;
                    position: relative;
                    animation: leftMove 1s;
                    -webkit-animation: leftMove 1s;
                }
        
                @keyframes leftMove {
        
                    0% {
                        -webkit-transform: scale(0);
                        transform: scale(0)
                    }
        
                    100% {
                        -webkit-transform: scale(1);
                        transform: scale(1)
                    }
                }
        
        
                .page-heading p {
                    text-align: center;
                    background-color: #F8F8F8;
                    font-weight: bold;
                    font-size: 25px;
                    border-bottom-width: 1px;
                    border-bottom-style: solid;
                    border-bottom-color: #E7EAEC;
                    margin-top: 0px;
                    margin-bottom: 0px;
                }
        
                .table {
                    margin: 20px 5px 20px 5px;
                    border: 1px solid #E7EAEC;
                    overflow-x: auto;
                }
        
                .table table {
                    width: 100%;
                    text-align: center;
        
                }
        
                .table-heading {
                    background: #99BFE6;
                }
        
                .table-content {
                    background: #EBF2FA;
                }
        
                #summary-canvas {
                    overflow-x: auto;
                }
        
                #summary-canvas div {
                    width: 500px;
                    background-color: rgb(255, 255, 255);
                    overflow-x: auto;
                    margin: 10px auto;
                    border: 1px solid #E7EAEC;
                }
        
                #details {
                    margin: 50px 0px 50px 0px;
                    border: 1px solid #E7EAEC;
                    border-top-width: 5px;
                    <!-- box-shadow: 10px 10px 5px #888888; -->
                    padding: 0px;
                }
        
                .page_details {
                    display: none;
                }
        
                .page_details_expanded {
                    display: block;
                    /* hide this definition from  IE5/6 */
                    display: table-row;
        
                }
        
                .page_details_expanded div {
                    margin-bottom: 10px;
                    background-color: rgb(243, 241, 231);
                }
        
                #failures {
                    margin: 50px 0px 50px 0px;
                    border: 1px solid #E7EAEC;
                    border-top-width: 5px;
                    <!-- box-shadow: 10px 10px 5px #888888; -->
                    padding: 0px;
                }        
        
                #failures .table a {
                    text-align: left;
                    font-size: 20px;
                }
        
                textarea {
                    width: 99%;
                    background: #EBF2FA;
                }
        
        
                .fadeInRight {
                    -webkit-animation-name: fadeInRight;
                    animation-name: fadeInRight;
                }
        
                @-webkit-keyframes fadeInRight {
                    0% {
                        opacity: 0;
                        -webkit-transform: translate3d(100%, 0, 0);
                        transform: translate3d(100%, 0, 0);
                    }
        
                    to {
                        opacity: 1;
                        -webkit-transform: none;
                        transform: none;
                    }
                }
        
                @keyframes fadeInRight {
                    0% {
                        opacity: 0;
                        -webkit-transform: translate3d(100%, 0, 0);
                        transform: translate3d(100%, 0, 0);
                    }
        
                    to {
                        opacity: 1;
                        -webkit-transform: none;
                        transform: none;
                    }
                }
        
                .animated {
                    -webkit-animation-duration: 1s;
                    animation-duration: 1s;
                    -webkit-animation-fill-mode: both;
                    animation-fill-mode: both;
                }
        
                @-webkit-keyframes fadeInLeft {
                    0% {
                        opacity: 0;
                        -webkit-transform: translate3d(-100%, 0, 0);
                        transform: translate3d(-100%, 0, 0);
                    }
        
                    to {
                        opacity: 1;
                        -webkit-transform: none;
                        transform: none;
                    }
                }
        
                @keyframes fadeInLeft {
                    0% {
                        opacity: 0;
                        -webkit-transform: translate3d(-100%, 0, 0);
                        transform: translate3d(-100%, 0, 0);
                    }
        
                    to {
                        opacity: 1;
                        -webkit-transform: none;
                        transform: none;
                    }
                }
        
                .fadeInLeft {
                    -webkit-animation-name: fadeInLeft;
                    animation-name: fadeInLeft;
                }

                #failures .table {
                    margin-bottom: 50px;
                }

			</style>
		</head>
		<body>
            <div id="home">
                <xsl:call-template name="heading" />
                <xsl:call-template name="summary" />
                <xsl:call-template name="details" />
                <xsl:call-template name="failures" />
            </div>
		</body>
    </html>

    <script language="JavaScript">
        <![CDATA[
        var data = [{ "type": "success", "color": "#5ab1ee" }, { "type": "failure", "color": "#d7797f" }];
        var canvas = document.querySelector("#canvas");
        var ctx = canvas.getContext("2d");                                  //获取canvas上下文
        var radius = canvas.height * 1 / 3;                                        //圆半径
        var x0 = canvas.width / 2;                                             //圆心x坐标
        var y0 = canvas.height / 2;                                              //圆心y坐标
        var step = 1;                                                       //动画步骤
        var totalStep = 40;                                                 //动画总步骤
        var speed = 30;                                                     //动画刷新频率
        var startAngle = 0.5 * Math.PI;
        var endAngle;
        var new_data = [];
        var totleNb = 0;
        var text;
        var textLine = 20
        var endTextAngle;
        var startTextAngle = -0.5 * Math.PI;
        var textLineAngle1X0;
        var textLineAngle1Y0;
        var textLineAngle1X1;
        var textLineAngle1Y1;
        var textWidth;
        chart(data);
    
        function chart(data) {
            //获取success和failures数量
            for (i in data) {
                var tag = document.getElementById(data[i]["type"] + "Nb");
                var number = tag.innerText;
                data[i]["number"] = parseInt(number);
            }
            data = data.sort(function (a, b) {
                return a["number"] - b["number"];
            });
    
            for (var i = 0; i < data.length; i++) {
                totleNb += data[i]["number"];
            };
    
            for (var i = 0; i < data.length; i++) {
                new_number = data[i]["number"] / totleNb;
                new_data.push(new_number);
            };
    
            for (let step = 0; step <= totalStep; step++) {
                setTimeout(function () {
                    draw(step);
                }, speed *= 1.085);
            }
            // for (;step <= totalStep;step++){
            //     run(step);
            // }
        };
    
        // function run(step){
        //         setTimeout(function(){
        //             draw(step);
        //         },speed*=1.085);
        //     };
    
        function draw(step) {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
    
            var line = 10;
            var num = 0;
            for (i in data) {
                ctx.beginPath();
                ctx.fillStyle = data[i]["color"];
                ctx.fillRect(10, line, 30, 15);
                ctx.font = "15px Arial"
                if (i == data.length - 1) {
                    num = 100 - num
                } else {
                    num = parseInt(new_data[i] * 100)
                }
                text = data[i]["type"] + ":" + num + "%"
                ctx.fillText(text, 45, line + 13)
                line += 20;
            }
    
            if (data[0]["number"] != 0) {
                data.forEach(function (currentValue, index, arr) {
                    text = currentValue["type"]
                    textWidth = ctx.measureText(text).width;
                    endTextAngle = startTextAngle + new_data[index] * Math.PI;
                    textLineAngle1X0 = x0 + radius * Math.cos(endTextAngle);
                    textLineAngle1Y0 = y0 + radius * Math.sin(endTextAngle);
                    textLineAngle1X1 = x0 + (radius + 20) * Math.cos(endTextAngle);
                    textLineAngle1Y1 = y0 + (radius + 20) * Math.sin(endTextAngle);
                    ctx.beginPath();
                    ctx.lineWidth = 1;
                    ctx.font = "15px Arial"
                    ctx.fillStyle = currentValue["color"];
                    ctx.strokeStyle = currentValue["color"];
                    ctx.moveTo(textLineAngle1X1, textLineAngle1Y1);
                    if (textLineAngle1X1 <= x0 + 0.1) {
                        ctx.textAlign = "left";
                        ctx.lineTo(textLineAngle1X1 - textWidth * step / totalStep - textLine, textLineAngle1Y1);
                        ctx.stroke();
                        ctx.beginPath();
                        ctx.moveTo(textLineAngle1X1, textLineAngle1Y1);
                        ctx.lineTo(x0 + (radius + 20 * (totalStep - step) / totalStep) * Math.cos(endTextAngle), textLineAngle1Y0);
                        ctx.stroke();
                        ctx.fillText(text, textLineAngle1X1 - textWidth * 2 + textWidth * step / totalStep - textLine, textLineAngle1Y1 - 5);
                    } else {
                        ctx.textAlign = "right";
                        ctx.lineTo(textLineAngle1X1 + textWidth * step / totalStep + textLine, textLineAngle1Y1);
                        ctx.stroke();
                        ctx.beginPath();
                        ctx.moveTo(textLineAngle1X1, textLineAngle1Y1);
                        ctx.lineTo(x0 + (radius + 20 * (totalStep - step) / totalStep) * Math.cos(endTextAngle), textLineAngle1Y0);
                        ctx.stroke();
                        ctx.fillText(text, textLineAngle1X1 + textWidth * 2 - textWidth * step / totalStep + textLine, textLineAngle1Y1 - 5);
                    }
                    if (index == data.length) {
                        startTextAngle = -0.5 * Math.PI;
                    } else {
                        startTextAngle += new_data[index] * Math.PI * 2;
                    }
                })
            }
            ctx.save();
            ctx.translate(x0, y0);
            ctx.beginPath();
            ctx.strokeStyle = "rgba(0,0,0," + 0.5 * step / totalStep + ")"
            ctx.arc(0, 0, (radius + 10) * step / totalStep, 0, 2 * Math.PI);
            ctx.stroke();
            ctx.rotate(Math.PI * step / totalStep);
            data.forEach(function (currentValue, index, arr) {
                endAngle = startAngle + new_data[index] * Math.PI * 2 * step / totalStep
                ctx.beginPath();
                ctx.moveTo(0, 0)
                ctx.arc(0, 0, radius * step / totalStep, startAngle, endAngle);
                ctx.fillStyle = currentValue["color"];
                ctx.closePath();
                ctx.fill();
                startAngle = endAngle;
            });
            startAngle = 0.5 * Math.PI
            ctx.restore();
        };
        ]]>
    </script>
    <script language="JavaScript">
        <![CDATA[
        function expand(details_id) {
            document.getElementById(details_id).className = "page_details_expanded";
        }
    
        function collapse(details_id) {
            document.getElementById(details_id).className = "page_details";
        }
    
        function change(details_id) {
            var _dataType = document.getElementById(details_id + "_image").getAttribute('data-type');
            if (_dataType == 'expand') {
                // document.getElementById(details_id+"_image").src = "collapse.png";
                document.getElementById(details_id + "_image").src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAGUExURSZ0pv///xB+eSAAAAARSURBVAjXY2DABuR/gBA2AAAzpwIvNQARCgAAAABJRU5ErkJggg==";
                expand(details_id);
                document.getElementById(details_id + "_image").setAttribute('data-type', 'collapse');
            } else {
                // document.getElementById(details_id+"_image").src = "expand.png";
                document.getElementById(details_id + "_image").src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAGUExURSZ0pv///xB+eSAAAAAWSURBVAjXY2CAAcYGBJL/AULIIjAAAJJrBjcL30J5AAAAAElFTkSuQmCC";
                collapse(details_id);
                document.getElementById(details_id + "_image").setAttribute('data-type', 'expand');
            }
        }
        ]]>
    </script>

</xsl:template>


<xsl:template name="heading">
    <div id="heading">
        <p class="title"><xsl:value-of select="$titleReport" /></p>
        <p class="date">Date report: <xsl:value-of select="$dateReport" /></p>
    </div>
</xsl:template>

<xsl:template name="summary">
    <div id="summary">

        <div class="page-heading">
            <p>Test Summary</p>
        </div>

        <div class="table">
            <table>
                <tr class="table-heading">
                    <td>Samples</td>
                    <td>Success</td>
                    <td>Failures</td>
                    <td>Average Time</td>
                    <td>Min Time</td>
                    <td>Max Time</td>
                    <td>90% Line</td>
                    <td>QPS</td>
                </tr>
                <tr class="table-content">
                    <xsl:variable name="allCount" select="count(/testResults/*)" />
                    <xsl:variable name="allFailureCount" select="count(/testResults/*[attribute::s='false'])" />
                    <xsl:variable name="allSuccessCount" select="count(/testResults/*[attribute::s='true'])" />
                    <xsl:variable name="allTotalTime" select="sum(/testResults/*/@t)" />
                    <xsl:variable name="allAverageTime" select="$allTotalTime div $allCount" />
                    <xsl:variable name="allMinTime">
                        <xsl:call-template name="min">
                            <xsl:with-param name="nodes" select="/testResults/*/@t" />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="allMaxTime">
                        <xsl:call-template name="max">
                            <xsl:with-param name="nodes" select="/testResults/*/@t" />
                        </xsl:call-template>
                    </xsl:variable>
                    <!-- New add 90% line -->
                    <xsl:variable name="allLineTime">
                        <xsl:call-template name="lineTime">
                            <xsl:with-param name="nodes" select="/testResults/*/@t" />
                        </xsl:call-template>
                    </xsl:variable>
                    <!-- 将毫秒转换成秒 -->
                    <xsl:variable name="qps" select="$allCount * 1000 div $allTotalTime"/>

                    <td><xsl:value-of select="$allCount" /></td>
                    <td id="successNb"><xsl:value-of select="$allSuccessCount" /></td>
                    <xsl:choose>
                        <xsl:when test="$allFailureCount &gt; 0">
                            <td id="failureNb" style="color:red">
                                    <xsl:value-of select="$allFailureCount" />
                            </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td id="failureNb">
                                <xsl:value-of select="$allFailureCount" />
                            </td>
                          </xsl:otherwise>
                    </xsl:choose>
                    <td>
                        <xsl:call-template name="display-time">
                            <xsl:with-param name="value" select="$allAverageTime" />
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="display-time">
                            <xsl:with-param name="value" select="$allMinTime" />
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="display-time">
                            <xsl:with-param name="value" select="$allMaxTime" />
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="display-time">
                            <xsl:with-param name="value" select="$allLineTime" />
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="display-qps">
                            <xsl:with-param name="value" select="$qps" />
                        </xsl:call-template>
                    </td>
                </tr>
            </table>
        </div>

        <div id="summary-canvas">
            <div>
                <canvas id="canvas" width="500px" height="300px">Your browser does not support the canvas element.</canvas>
            </div>
        </div>

    </div>
</xsl:template>

<xsl:template name="details">
    <div id="details" class="animated fadeInRight">

        <div class="page-heading">
            <p>Detail Page</p>
        </div>
    
        <div class="table">
            <table>
    
                <tr class="table-heading">
                    <td>URL</td>
                    <td>Samples</td>
                    <td>Success</td>
                    <td>Failures</td>
                    <td>Success Rate</td>
                    <td>Average Time</td>
                    <td>Min Time</td>
                    <td>Max Time</td>
                    <td>90% Line</td>
                    <td>QPS</td>
                </tr>

                <xsl:for-each select="/testResults/*[not(@lb = preceding::*/@lb)]">
                    <xsl:variable name="label" select="@lb" />
                    <xsl:variable name="count" select="count(../*[@lb = current()/@lb])" />
                    <xsl:variable name="failureCount" select="count(../*[@lb = current()/@lb][attribute::s='false'])" />
                    <xsl:variable name="successCount" select="count(../*[@lb = current()/@lb][attribute::s='true'])" />
                    <xsl:variable name="successPercent" select="$successCount div $count" />
                    <xsl:variable name="totalTime" select="sum(../*[@lb = current()/@lb]/@t)" />
                    <xsl:variable name="averageTime" select="$totalTime div $count" />
                    <xsl:variable name="minTime">
                        <xsl:call-template name="min">
                            <xsl:with-param name="nodes" select="../*[@lb = current()/@lb]/@t" />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="maxTime">
                        <xsl:call-template name="max">
                            <xsl:with-param name="nodes" select="../*[@lb = current()/@lb]/@t" />
                        </xsl:call-template>
                    </xsl:variable>
                    <!-- new add 90% line time -->
                    <xsl:variable name="nintyTime">
                        <xsl:call-template name="lineTime">
                            <xsl:with-param name="nodes" select="../*[@lb = current()/@lb]/@t" />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="qpsTime" select="$count * 1000 div $totalTime"/>

                    <tr class="table-content">
                        <td>
                            <xsl:if test="$failureCount > 0">
                                <a>
                                    <xsl:attribute name="href">#<xsl:value-of select="$label" /></xsl:attribute>
                                    <xsl:value-of select="$label" />
                                </a>
                            </xsl:if>
                            <xsl:if test="0 >= $failureCount">
                                <xsl:value-of select="$label" />
                          </xsl:if>
                        </td>
                        <td>
                            <xsl:value-of select="$count" />
                        </td>
                        <td>
                            <xsl:value-of select="$successCount" />
                        </td>
                        <xsl:if test="$failureCount > 0">
                            <td style="color:red">
                                <xsl:value-of select="$failureCount" />
                            </td>
                        </xsl:if>
                        <xsl:if test="0 >= $failureCount">
                            <td>
                                <xsl:value-of select="$failureCount" />
                            </td>
                      </xsl:if>
                        <td>
                            <xsl:call-template name="display-percent">
                                <xsl:with-param name="value" select="$successPercent" />
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="display-time">
                                <xsl:with-param name="value" select="$averageTime" />
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="display-time">
                                <xsl:with-param name="value" select="$minTime" />
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="display-time">
                                <xsl:with-param name="value" select="$maxTime" />
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="display-time">
                                <xsl:with-param name="value" select="$nintyTime" />
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="display-qps">
                                <xsl:with-param name="value" select="$qpsTime" />
                            </xsl:call-template>
                        </td>
                        <td>
                            <a href="javascript:void(0)">
                                <xsl:attribute name="href"><xsl:text/>javascript:change('page_details_<xsl:value-of select="position()" />')</xsl:attribute>
                                <!-- <img src="expand.png" alt="expand/collapse"><xsl:attribute name="id"><xsl:text/>page_details_<xsl:value-of select="position()" />_image</xsl:attribute></img> -->
                                <img data-type="expand" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAGUExURSZ0pv///xB+eSAAAAAWSURBVAjXY2CAAcYGBJL/AULIIjAAAJJrBjcL30J5AAAAAElFTkSuQmCC" alt="expand/collapse"><xsl:attribute name="id"><xsl:text/>page_details_<xsl:value-of select="position()" />_image</xsl:attribute></img>
                             </a>
                        </td>
                    </tr>

                    <tr class="page_details">
                        <xsl:attribute name="id"><xsl:text/>page_details_<xsl:value-of select="position()" /></xsl:attribute>
                        <td colspan="11" >
                            <div>
                                <table>
                                    <caption>Details for Page "<xsl:value-of select="$label" />"</caption>
                                    <tr>
                                        <th>Thread</th>
                                        <th>Iteration</th>
                                        <th>Time (milliseconds)</th>
                                        <th>Bytes</th>
                                        <th>Success</th>
                                    </tr>
                                    <xsl:for-each select="../*[@lb = $label and @tn != $label]">			         			            
                                        <tr>
                                            <td><xsl:value-of select="@tn" /></td>
                                            <td><xsl:value-of select="position()" /></td>
                                            <td><xsl:value-of select="@t" /></td>
                                            <!--  TODO allow for missing bytes field -->
                                            <td><xsl:value-of select="@by" /></td>
                                            <td><xsl:value-of select="@s" /></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </div>
                        </td>
                    </tr>

                </xsl:for-each>
    
            </table>
        </div>

    </div>
</xsl:template>

<xsl:template name="failures">
    <xsl:variable name="allFailureCount" select="count(/testResults/*[attribute::s='false'])" />

    <xsl:if test="$allFailureCount > 0">
        <div id="failures" class="animated fadeInLeft">

            <div class="page-heading">
                <p>Failure Details</p>
            </div>

            <xsl:for-each select="/testResults/*[not(@lb = preceding::*/@lb)]">
                <xsl:variable name="failureCount" select="count(../*[@lb = current()/@lb][attribute::s='false'])" />
                <xsl:if test="$failureCount > 0">
                    <div class="table">
                        <table>
                            <a><xsl:attribute name="name"><xsl:value-of select="@lb" /></xsl:attribute><xsl:value-of select="@lb" /></a>
                            <tr class="table-heading">
                                <td>Response</td>
                                <td>Failure Message</td>
                                <td>Response Data</td>
                            </tr>

                            <xsl:for-each select="/testResults/*[@lb = current()/@lb][attribute::s='false']">
                                <tr class="table-content">
                                    <td><xsl:value-of select="@rc | @rs" /> - <xsl:value-of select="@rm" /></td>
                                    <td><xsl:value-of select="assertionResult/failureMessage" /></td>
                                    <xsl:if test="$showData = 'y'">
                                        <td>
                                            <textarea readonly="readonly" rows="5"><xsl:value-of select="responseData" /></textarea>
                                        </td>
                                    </xsl:if>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </xsl:if>
            </xsl:for-each>

        </div>
    </xsl:if>
</xsl:template>


<xsl:template name="min">
	<xsl:param name="nodes" select="/.." />
	<xsl:choose>
		<xsl:when test="not($nodes)">NaN</xsl:when>
		<xsl:otherwise>
			<xsl:for-each select="$nodes">
				<xsl:sort data-type="number" />
				<xsl:if test="position() = 1">
					<xsl:value-of select="number(.)" />
				</xsl:if>
			</xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="max">
	<xsl:param name="nodes" select="/.." />
	<xsl:choose>
		<xsl:when test="not($nodes)">NaN</xsl:when>
		<xsl:otherwise>
			<xsl:for-each select="$nodes">
				<xsl:sort data-type="number" order="descending" />
				<xsl:if test="position() = 1">
					<xsl:value-of select="number(.)" />
				</xsl:if>
			</xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- 90% line time -->
<xsl:template name="lineTime">
	<xsl:param name="nodes" select="/.." />
	<xsl:choose>
		<xsl:when test="not($nodes)">NaN</xsl:when>
		<xsl:otherwise>
			<xsl:for-each select="$nodes">
				<xsl:sort data-type="number" />
				<!-- last() 返回当前上下文中的最后一个节点位置数 -->
				<!-- ceiling(number) 返回大于number的最小整数 -->
				<!-- floor(number) 返回不大于number的最大整数 -->
				<!-- position() 返回当前节点位置的数字 -->
				<!-- number(object) 使对象转换成数字 -->
				<xsl:choose>
                    <!-- 当只有一个节点时，向上取整 -->
                    <xsl:when test="last() = 1">
                       	<xsl:if test="position() = ceiling(last()*0.9)">
                            <xsl:value-of select="number(.)" />
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="position() = floor(last()*0.9)">
                            <xsl:value-of select="number(.)" />
                        </xsl:if>
                      </xsl:otherwise>
                </xsl:choose>
			</xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="display-percent">
	<xsl:param name="value" />
	<xsl:value-of select="format-number($value,'0.00%')" />
</xsl:template>

<xsl:template name="display-time">
	<xsl:param name="value" />
	<xsl:value-of select="format-number($value,'0 ms')" />
</xsl:template>

<xsl:template name="display-qps">
	<xsl:param name="value" />
	<xsl:value-of select="format-number($value,'0.000 /s')" />
</xsl:template>

	
</xsl:stylesheet>
