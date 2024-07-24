<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="sharing.aspx.cs" Inherits="WebApplication3.sharing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
      <script src="https://kendo.cdn.telerik.com/2022.1.119/js/jquery.min.js"></script>

    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.blueopal.min.css" />
      

    <script src="https://kendo.cdn.telerik.com/2022.1.119/js/kendo.all.min.js"></script>
     
    <div class="container">
             
  <div class="card"  style="width: 700px;height: 350px;">
  <div class="row">
  
    <div class="col" style="margin-left: 20px;">
                  <h4 class="text-dark font-weight-bold mb-2">   Reports List: <i class="fa fa-dashboard"></i> </h4> 

      <select id="listBox" style="width: 200px; height: 200px;"></select>
    <button id="share"  class="btn btn-secondary">Share <i class="mdi mdi-share"></i></button>   
    </div>
      
    <div class="col">
                           <h4 class="text-dark font-weight-bold mb-2">     Users List:  <i class="fa fa-user"></i> </h4> 

      <select id="listBox1" style="width: 200px; height: 200px;"></select>
           

    </div>

  
       </div>
                     <label id="notif" style="margin-left: 200px;"></label>

  </div>
</div>

  
  
<script>

    var Tra = <%= Newtonsoft.Json.JsonConvert.SerializeObject(liste) %>;
    var Tra2 = <%= Newtonsoft.Json.JsonConvert.SerializeObject(users) %>;
    var UserId = "";
    var ReportId = "";
    $("#listBox").kendoListBox({
        dataSource: {
            data: Tra
        },
        template: "<div>#:Name#</div>",
        change: onChange
    });
    function onChange(e) {
        var element = e.sender.select();
        var dataItem = e.sender.dataItem(element[0])
        console.log(dataItem.Name)
        //debugger 
        ReportId = dataItem.ReportId;
        
    }

    $("#listBox1").kendoListBox({
        dataSource: {
            data: Tra2
        },
        template: "<div>#:username#</div>",
        change: onChange2
    });
    function onChange2(e) {
        var element = e.sender.select();
        var dataItem = e.sender.dataItem(element[0])
        console.log(dataItem.username)
        UserId = dataItem.userid;
       

    }

       

      

  
</script>

 <script>
     $(function () {
         $('#share').click(function () {

             
             //var Name = $("#textbox").val()

             var DTO = { 'reportid': ReportId, 'userid': UserId  };
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "sharing.aspx/afficher",
                 dataType: "json",
                 data: JSON.stringify(DTO),
                 success: OnSuccess,
                 error: ErrorFound
             });



         });
         function OnSuccess(data) {

             $("#notif").show();
             $("#notif").html('Your report is shared succesfully');
             $('#notif').css("color", "green");
             $("#notif").delay(3000).fadeOut(500);
             console.log("sucess");
         };

         function ErrorFound(result) {
             console.log("error");
         }

     });
</script>
    </asp:Content>

