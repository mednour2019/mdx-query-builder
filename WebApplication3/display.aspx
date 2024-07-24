<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="display.aspx.cs" Inherits="WebApplication3.display" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <head>
     <title></title>
      
       <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.blueopal.min.css" />
     <script src="https://kendo.cdn.telerik.com/2022.1.119/js/jquery.min.js"></script>
     
  
     <script src="https://kendo.cdn.telerik.com/2022.1.119/js/kendo.all.min.js"></script>
   
        </head>
    </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
      <html>
            <script>
                $(document).ready(function () {

                    // treelistview**************
                    var mapData = <%=this.JSONresult%>;
            var mapData2 = <%=this.output2%>;
            var maxvalue =<%=this.outputmax%>;
            var dimensiontitlename =<%=this.outputdimensiontitle%>;
            var dimensioncolum =<%=this.outputdimcolumn%>;
            var dimgeneralname =<%=this.outputdimgename%>;
            debugger


            var dataSource = new kendo.data.TreeListDataSource({
                data: mapData,
                schema: {
                    model: {
                        id: "id",
                        expanded: false
                    }
                }
            });
            //debugger
            $("#treelist").kendoTreeList({
                dataSource: dataSource,
                height: 600,
                groupable: true,
                sortable: true,
                pageable: {
                    refresh: true,
                    pageSizes: true,
                    buttonCount: 5
                },
                resizable: true,
                reorderable: true,
                columnMenu: true,
                filterable: true,
                toolbar: ["excel", "pdf", "search"],
                columns: mapData2,
                dataBound: function (e) {
                    debugger
                    e.sender.thead.find('.k-column-title').map(function (i, elm) {
                        // debugger

                        let html = $(elm).html().replaceAll("['", "").replaceAll("']", "").replaceAll("Measures", "")
                        // html = html.replaceAll("']", "")
                        $(elm).html(html)

                    })
                    debugger
                }
            });
            //  $("#example th[data-field='[NbSentDimCampaignsIsAutomatedAuto]']").find(".k-link").text("New Title");
            //  $("#example thead [data-field=[MeasuresNbSent]].k-link").html("NewTitle")
            //**************


            //dialog*********
            var dialog = $('#dialog'),
                undo = $("#undo");

            $("#dialog").kendoWindow({
                modal: true,
                visible: false,
                width: 1200,
                height: 900,
                title: "Show Report"



            });
            var title = "";
            $("#undo").one("click", function () {
                //  alert("This will be displayed only once.");
                var conc = " ";
                var myvar = " ";
                if (dimensioncolum == " ") {
                    for (var i = 1; i < mapData2.length; i++) {

                        conc = conc + " && " + mapData2[i]["field"].replaceAll("['", "").replaceAll("']", "").replaceAll("Measures", "");


                    }
                    myvar = "your choice is " + conc.slice(4) + " Like Measure(s) + " + dimensiontitlename + " On Rows => So you have possibility to visualise you report as: ";
                }
                else {
                    for (var i = 1; i < mapData2.length; i++) {

                        conc = conc + " && " + mapData2[i]["title"];


                    }
                    myvar = "your choice is " + conc.slice(4) + " Like Measure(s) + " + dimensiontitlename + " On Rows + " + dimensioncolum + " On Columns => So you have possibility to visualise you report as:";

                }
                $('<p>' + myvar + '</p>').appendTo('#Content');
                $('#engine1').kendoRadioButton({
                    label: "Bar Chart",
                    checked: true
                })
                $('#engine2').kendoRadioButton({
                    label: "Area Chart"
                })
                $('#engine3').kendoRadioButton({
                    label: "Line Chart"
                })
                $('#engine4').kendoRadioButton({
                    label: "StackedColumnChart"
                })
                $('#engine5').kendoRadioButton({
                    label: "Pie Chart "
                })
                $('#engine6').kendoRadioButton({
                    label: "Radar Chart "
                })
                $('#engine7').kendoRadioButton({
                    label: "StackedBarChart"
                })
                $('#engine8').kendoRadioButton({
                    label: "ColumnChart"
                })

                if (dimensioncolum == " ") {
                    for (var i = 1; i < mapData2.length; i++) {

                        title = title + " && " + mapData2[i]["field"].replaceAll("['", "").replaceAll("']", "").replaceAll("Measures", "");


                    }
                    title = title.slice(4) + " By " + dimensiontitlename;
                }
                else {
                    for (var i = 1; i < mapData2.length; i++) {

                        title = title + " && " + mapData2[i]["title"];


                    }
                    title = title.slice(4) + " By " + dimensiontitlename + " On Rows &&__" + dimensioncolum + " On Columns";
                }
            });
            undo.click(function () {
                dialog.data("kendoWindow").open();


                // console.log("nour");
                var keys = Object.keys(mapData[0]);
                keys = $.map(keys, function (e, ii) { return ['id', 'Position', 'parentId'].indexOf(e) == -1 ? e : null });
                if (keys.length > 1) {
                    $('input[id="engine5"]').attr("disabled", true);

                }
                else {
                    $("#engine5").prop("checked", true);


                    $(document).ready(createPieChart("pie"));
                    $(document).bind("kendo:skinChange", createPieChart("pie"));
                    $('input[id="engine1"]').attr("disabled", true);
                    $('input[id="engine2"]').attr("disabled", true);
                    $('input[id="engine3"]').attr("disabled", true);
                    $('input[id="engine4"]').attr("disabled", true);
                    // $('input[id="engine6"]').attr("disabled", true);
                    $('input[id="engine7"]').attr("disabled", true);
                    $('input[id="engine8"]').attr("disabled", true);


                }

            });

            function onClose() {
                undo.fadeIn();
            }

            //*************

            //radiobutton*********

            //*****************




            //onclicbutton********

            $('#primaryTextButton').click(function () {

                var radioValue = $("input[name='engine']:checked").val();
                var radiolabel = $("input[name='engine']:checked").parent().text().replace(/\s/g, '');
                var stacked = false;
                //  console.log(radioValue);
                // console.log(radiolabel);

                if (radioValue == "pie") {
                    createPieChart(radioValue);
                }
                else {

                    if (radiolabel == "StackedColumnChart" || radiolabel == "StackedBarChart") {
                        stacked = true;
                        maxvalue = null;

                    }






                    createChart(radioValue, stacked, maxvalue);
                }
                //createChart(radioValue);



            });
            //*******************

            //barchchart*****************

            function preparedata(mapdata) {
                var series = [];
                var colors = ["grey", "black", "blue", "green", "DarkSalmon",
                    "HotPink", "Tomato", "Gold", "DarkKhaki", "Khaki", "Thistle",
                    "Lavender", "MediumOrchid", "RebeccaPurple", "GreenYellow",
                    "Aqua", "LightSteelBlue", "Yellow", "MediumPurple", "OliveDrab", "LightCyan", "SandyBrown", "Maroon", "MistyRose", "DarkGray"];
                if (mapdata != null && mapdata.length > 0) {
                    var keys = Object.keys(mapData[0]);
                    var keys = $.map(keys, function (e, ii) { return ['id', 'Position', 'parentId'].indexOf(e) == -1 ? e : null });
                    if (keys != null && keys.length > 0) {
                        for (var i = 0; i < keys.length; i++) {
                            var keyname = keys[i];
                            var values = $.map(mapdata, function (e, ii) { return e["parentId"] == null ? e[keyname] : null; });
                            series.push({
                                name: keyname.replaceAll("Measures", ""),
                                data: values,
                                color: colors[i]
                            });
                        }
                    }
                }

                return series;
            }
            function preparepiedata(mapdata) {
                var colors2 = ["grey", "black", "blue", "green", "DarkSalmon",
                    "HotPink", "Tomato", "Gold", "DarkKhaki", "Khaki", "Thistle",
                    "Lavender", "MediumOrchid", "RebeccaPurple", "GreenYellow",
                    "Aqua", "LightSteelBlue", "Yellow", "MediumPurple", "OliveDrab", "LightCyan", "SandyBrown", "Maroon", "MistyRose", "DarkGray"];

                var series = [];
                var keys = Object.keys(mapData[0]);
                var keys = $.map(keys, function (e, ii) { return ['id', 'Position', 'parentId'].indexOf(e) == -1 ? e : null });
                for (var i = 0; i < mapData.length; i++) {
                    // console.log("loop", mapData[i])
                    if (mapData[i]["parentId"] == null) {

                        series.push({
                            category: mapData[i]["Position"],
                            value: mapData[i][keys],
                            color: colors2[i]
                        });

                    }
                }
                return series;
            }









            function createChart(type, stacked, m) {
                var series = preparedata(mapData);
                for (var i = 0; i < series.length; i++) {
                    series[i].data = series[i].data.map(Number);
                }

                if (dimensioncolum != " ") {
                    for (var i = 0; i < series.length; i++) {
                        series[i].name = series[i].name.replaceAll(dimensioncolum, "").replaceAll(dimgeneralname, "");
                    }

                }
                var liste1 = new Array();

                for (var i = 0; i < mapData.length; i++) {
                    // console.log("loop", mapData[i])
                    if (mapData[i]["parentId"] == null) {
                        liste1.push(mapData[i]["Position"]);

                    }
                }

                $("#chart").kendoChart({
                    title: {
                        text: title
                    },
                    legend: {
                        visible: true
                    },
                    seriesDefaults: {
                        type: type,
                        stack: stacked
                    },
                    series: series,
                    valueAxis: {
                        max: m,
                        line: {
                            visible: true
                        },
                        minorGridLines: {
                            visible: true
                        },
                        labels: {
                            rotation: "auto"
                        }
                    },
                    categoryAxis: {
                        categories: liste1,
                        visible: true,
                        majorGridLines: {
                            visible: true
                        }
                    },
                    tooltip: {
                        visible: true,
                        template: "#= series.name #: #= value #"
                    }
                });
            }
            function createPieChart(type) {
                var series = preparepiedata(mapData);

                $("#chart").kendoChart({
                    title: {
                        position: "top",
                        text: title
                    },
                    legend: {
                        visible: true
                    },
                    chartArea: {
                        background: ""
                    },
                    seriesDefaults: {
                        labels: {
                            visible: true,
                            background: "transparent",
                            template: "#= category #: \n #= value#"
                        }
                    },
                    series: [{
                        type: type,
                        startAngle: 150,
                        data: series
                    }],
                    tooltip: {
                        visible: true,
                        format: "{0}"
                    }
                });
            }

            $(document).ready(createChart("bar"));
            $(document).bind("kendo:skinChange", createChart("bar"));










            debugger


        });
    </script>
     <script>
         $(document).ready(function () {
             $("#notif").hide();
             $("#textbox").kendoTextBox({
                 placeholder: "Report Name",
                 label: {
                     content: "Report Name",
                     floating: true
                 }
                
             });

             var dialog = $('#dialogsave');


             $("#dialogsave").kendoWindow({
                 modal: true,
                 visible: false,
                 width: 500,
                 height: 300,
                 title: "Save Report",



             });
             var popup = $("#dialogsave").data('kendoWindow');
             popup.center();
             $('#savereport').click(function () {
                 // console.log("nour");
                 dialog.data("kendoWindow").open();
             });


             $(function () {
                 $('#savereportdb').click(function () {
                     if ($("#textbox").val() == "") {
                         $("#notif").show();
                         $("#notif").html('Enter Report Name');
                         $('#notif').css("color", "red");
                         $("#notif").delay(3000).fadeOut(500);

                         console.log("error");
                     }
                     else {
                         console.log("nour")
                         var Name = $("#textbox").val()

                         var DTO = { 'Name': Name };
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "display.aspx/afficher",
                             dataType: "json",
                             data: JSON.stringify(DTO),
                             success: OnSuccess,
                             error: ErrorFound
                         });

                     }

                 });
                 function OnSuccess(data) {
                     $("#notif").show();
                     $("#notif").html('Your report is saved succesfully');
                     $('#notif').css("color", "green");
                     $("#notif").delay(3000).fadeOut(500);
                     console.log("sucess");


                 };

                 function ErrorFound(result) {
                     $("#notif").show();
                     $("#notif").html('Error');
                     $('#notif').css("color", "red");
                     $("#notif").delay(3000).fadeOut(500);

                     console.log("error");
                 }

             });


            

         });

         $(document).ready(function () {
             $('#reportDropdown').attr('disabled', false);
             $('.footer-inner-wraper').attr('style', 'margin-top:35px');

         });

    </script>
    <style>
        .k-floating-label-container {
            width: 100%;
        }
    </style>

<body>
    <style>
        .fieldlist {
            margin: 0 0 -1em;
            padding: 0;
        }

            .fieldlist li {
                list-style: none;
                padding-bottom: 1em;
            }
    </style>
    
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <asp:GridView id="GridView1" runat ="server" CssClass="table table-hover table-striped" onrowdatabound="Your_GridView_RowDataBound" >
                        <Columns>

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
 
        <asp:Label ID="Label1" runat="server"></asp:Label>
          <asp:Label ID="Label2" runat="server"></asp:Label>
          <asp:Label ID="Label3" runat="server"></asp:Label>
          <asp:Label ID="Label4" runat="server"></asp:Label>
           <asp:Label ID="Label5" runat="server"></asp:Label>
  
             
           

    </form>

    </div>
    <!--<h1><asp:Label ID="valeur" runat="server" Font-Size="Large" ForeColor="Crimson"></asp:Label></h1>-->
    <button id="undo" hidden>report</button>
      <button id="savereport" hidden>savereport</button>

      <div id="example5">
          <div id="dialogsave">
               <div class="demo-section k-content">  </div>
 <div id="example6">
    <div class="demo-section k-content">
        
        <input id="textbox" style="width: 100%;" required/>
          <label id="notif"></label>

    </div>

   

   
</div>

               <button id="savereportdb" class="btn btn-secondary btn-sm" style="margin-top: 40px;"> Save <i class="fa fa-save"></i></button>

       </div>      
             </div> 
     <div id="example2">
          <div id="dialog">
               <div class="demo-section k-content">
             <h4>Select Chart:</h4>
            <div id="Content"> </div>
                
             <ul class="fieldlist">
                 <li>
                <input type="radio" name="engine" id="engine1" value="bar" />
                     <i class="fa fa-bar-chart"></i>
            </li>
                  <li>
                <input type="radio" name="engine" id="engine7" value="bar" />
                      <i class="fa fa-bar-chart-o"></i>
            </li>
                                   <li>
                <input type="radio" name="engine" id="engine4" value="column" />
                                       <i class="fa fa-columns"></i>
            </li>
                  <li>
                <input type="radio" name="engine" id="engine8" value="column" />
                           <i class="fa fa-columns"></i>
            </li>
                  <li>
                <input type="radio" name="engine" id="engine2" value="area" />
                           <i class="fa fa-area-chart"></i>
            </li>
                <li>
                <input type="radio" name="engine" id="engine3" value="line" />
                     <i class="fa fa-line-chart"></i>
            </li>

                 <li>
                <input type="radio" name="engine" id="engine5" value="pie" />
                      <i class="fa fa-pie-chart"></i>
            </li>
                 <li>
                <input type="radio" name="engine" id="engine6" value="radarLine" />
                      <i class="fa fa-check"></i>
            </li>
                
                
                 </ul>
              </div>
                  <button id="primaryTextButton" class="btn btn-secondary btn-sm">show chart  <i class="fa fa-eye"></i></button>
     <div id="example3">
        <div class="demo-section k-content wide">
            <div id="chart" style="background:center no-repeat url('#');"></div>
        </div>
     </div>

            

      </div>
     
   
       </div>
   


 
     <div id="example" style="margin-top:-30px">
            <div id="treelist" style="width:1170px;" ></div>
     
           
        </div>
   

  

</body>
    </html>

     </asp:Content>






    

  

   
  
