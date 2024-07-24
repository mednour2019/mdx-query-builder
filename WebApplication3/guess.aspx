<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="guess.aspx.cs" Inherits="WebApplication3.guess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
     
</asp:Content>
 
      

  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
      <script src="https://kendo.cdn.telerik.com/2022.1.119/js/jquery.min.js"></script>

    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.blueopal.min.css" />
      

    <script src="https://kendo.cdn.telerik.com/2022.1.119/js/kendo.all.min.js"></script>
    <form class="pt-3" id="form1" runat="server" > 
    <div class="container">
         <div class="card" style="width: 800px;height: 350px;">
  <div class="row">
    <div class="col-sm">
<input type="hidden" value="" id="SendA" name="SendA" />
 <input type="hidden" value="" id="Sendimcol" name="Sendimcol" />
  <input type="hidden" value="" id="Sendnbcol" name="Sendnbcol" />
  <input type="hidden" value="" id="Sendimgenename" name="Sendimgenename" />
        <input type="hidden" value="" id="Sendlistemesure" name="Sendlistemesure" />
         <input type="hidden" value="" id="Sendlisterow" name="Sendlisterow" />
         <input type="hidden" value="" id="Sendserver" name="Sendserver" />
         <input type="hidden" value="" id="Sendb" name="Sendb" />

    </div>
   
         
              <div class="col-sm">
    <h4 class="text-dark font-weight-bold mb-2">   Reports List: <i class="fa fa-dashboard"></i> </h4> 
      <select id="listBox" style="width: 200px; height: 200px;"></select>
        <br>
                   <br>
           
                        <asp:LinkButton ID="btndggf" runat="server" OnClick="klik"   class="btn btn-secondary" BackColor="#41464b63" Style="margin-left: 30px;">
                            <i class="mdi mdi-eye-check"></i>Display Data
</asp:LinkButton>
  
         </div>
       
    <div class="col-sm"></div>
    
  </div>
</div>
</div>
  </form> 

 
<script>
 
    var Tra = <%= Newtonsoft.Json.JsonConvert.SerializeObject(liste) %>;

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
     
        debugger
        document.getElementById("SendA").value = dataItem.Mdxquery;
        document.getElementById("Sendimcol").value = dataItem.dimcol;
        document.getElementById("Sendnbcol").value = dataItem.nbcol;
        document.getElementById("Sendimgenename").value = dataItem.dimgenename;
        document.getElementById("Sendlistemesure").value = dataItem.listemesure;
        document.getElementById("Sendlisterow").value = dataItem.listerow;
        document.getElementById("Sendserver").value = dataItem.servername;
        document.getElementById("Sendb").value = dataItem.dbname;
    }

</script>
    </asp:Content>