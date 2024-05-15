<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Amazon.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenthead" runat="Server">
    <style>
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 320px;
            max-width: 800px;
            margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">


    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>



    <figure class="highcharts-figure">
        <div id="container"></div>
        <p class="highcharts-description">
            Pie charts demo showing how to create a custom entrance animation.
        </p>
    </figure>
    <div runat="server" id="divsrc">
        <script>
            (function (H)
            {
                H.seriesTypes.pie.prototype.animate = function (init) {
                    const series = this,
                        chart = series.chart,
                        points = series.points,

                        { animation } = series.options,
                        {
                            startAngleRad } = series; function fanAnimate(point,
                                startAngleRad) {
                                const graphic = point.graphic,
                                    args = point.shapeArgs; if (graphic && args) {
                                    graphic.attr({
                                        start: startAngleRad,
                                        end: startAngleRad,
                                        opacity: 1
                                    }).animate({
                                        start: args.start,
                                        end: args.end
                                    },
                                        {
                                        duration: animation.duration / points.length
                                        },
                                        function () {
                                        if (points[point.index + 1]) {
                                            fanAnimate(points[point.index + 1],
                                                args.end);
                                        } if (point.index === series.points.length - 1) {
                                            series.dataLabelsGroup.animate({
                                                opacity: 1
                                            },
                                                void 0,
                                                function () {
                                                points.forEach(point => {
                                                    point.opacity = 1;
                                                }); series.update({
                                                    enableMouseTracking: true
                                                },
                                                    false); chart.update({
                                                    plotOptions: {
                                                        pie: {
                                                            innerSize: '40%',
                                                            borderRadius: 8
                                                        }
                                                    }
                                                });
                                            });
                                        }
                                    });
                                }
                    } if (init) {
                        points.forEach(point => {
                            point.opacity = 0;
                        });
                    } else {
                        fanAnimate(points[0],
                            startAngleRad);
                    }
                };
            }(Highcharts)); Highcharts.chart('container',
                {
                chart: {
                    type: 'pie'
                    },
                    title: {
                        text: 'Departamental Strength of the Company',
                        align: 'left'
                    },
                    subtitle: {
                        text: 'Custom animation of pie series',
                        align: 'left'
                    },
                    tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                    },
                    plotOptions: {
                    pie: {
                            allowPointSelect: true,
                            borderWidth: 2,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b><br>{point.percentage}%',
                                distance: 20
                        }
                    }
                    },
                    series: [{
                        enableMouseTracking: false,
                        animation: {
                        duration: 2000
                        },
                        colorByPoint: true,
                        data: []
                }]
                });

        </script>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

