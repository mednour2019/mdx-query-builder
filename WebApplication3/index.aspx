<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication3.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <head>
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.nour{
  background-color: gray;
  border: none;
  color: black;
  padding: 10px 10px;
  font-size: 15px;
  cursor: pointer;
      margin-top: 8px;
}
/* Darker background on mouse-over */
.nour:hover {
  background-color: dimgrey;
}
.sidebar{
    margin-left:-12px !important;
    }


</style>
       <title>Configuration</title>
      
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  



     

     </head>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <body style="background-color:#dee2e63b;">
        <script type="text/javascript">


            $(document).ready(function () {
                /*  $(".test").button().click(function () {
                      //alert();
                      console.log("button")
                  });*/
            });
           </script>
         

 <form id="form1" runat="server" >
      <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
   <div class="container">
       <div class="row">            
               <div class="col" style="margin-top: -50px;">
    
                     <dt >Measure(s): <i class="fa fa-signal"></i></dt>

                        <div  overflow-y: auto; overflow-x: hidden" >

                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true" RepeatColumns="1"
                         RepeatDirection="Vertical" Width="240px" ClientIDMode="Static" CssClass="form-control">  

                    </asp:CheckBoxList>
                  
  
                       </div>
                     <div class="vl"></div>
                  <div class="col" style="margin-right: 30px; margin-top: -125px;" >
                      <dt > StartDate: <i class="fa fa-calendar"></i></dt>
                <asp:TextBox ID="TextBox2" runat="server" textmode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col" style="MARGIN-RIGHT: 30px; margin-top: 15px; " >
                <dt > EndDate: <i class="fa fa-calendar"></i></dt>
                <asp:TextBox ID="TextBox3" runat="server" textmode="Date" CssClass="form-control"></asp:TextBox>
            </div>
               </div>
          

             
           <style>
               .vl {
                   border-left: 0.5px solid #80808063;
                   height: 300px;
                   margin-left: 250px;
                   margin-top: -100px;
               }

</style>
                     
        
                 
        
           <div class="col-6"  style="margin-top: -50px;">
<div id="popup" style="max-height:300px;overflow-y:scroll;">

     <asp:UpdatePanel runat="server" id="UpdatePanel" UpdateMode="Conditional" >
     <ContentTemplate> 
     <asp:GridView ID="GridView1" AutoGenerateColumns="false"   runat="server" CssClass="table table-hover table-striped"    >    
             <Columns>    
                  <asp:BoundField DataField="field" HeaderText="field" />
           
                           

            <asp:TemplateField>
                <ItemTemplate>
                             
                   <asp:Button ID="btnrow" runat="server" Text="row" OnClick="row_Click" AutoPostBack="true" class="btn btn-secondary btn-sm test" BackColor="#adb5bd"  > </asp:Button>
           
          <asp:Button ID="bc"  runat="server" Text="col" OnClick="col_Click" AutoPostBack="true" class="btn btn-secondary btn-sm test2" value="col" BackColor="#adb5bd" > </asp:Button>
     <asp:Button ID="bf"  runat="server" Text="fil" OnClick="fil_Click"  AutoPostBack="true" class="btn btn-secondary btn-sm test3" value="fil" BackColor="#adb5bd"> </asp:Button>
         

                            
                </ItemTemplate>
            </asp:TemplateField>
                
             </Columns>    
         </asp:GridView> 
      </ContentTemplate>

   </asp:UpdatePanel>
     
     
    </div>
                 
    </div>
        
                        
               <div class="col"  style="margin-top: -50px;">
                       <asp:UpdatePanel runat="server" id="UpdatePanel1" UpdateMode="Conditional" >
     <ContentTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server"  OnClick="addfilter_Click" class="btn btn-secondary btn-sm nour">
    <i class="fa fa-plus"></i>Add
</asp:LinkButton>
        <asp:ListBox ID="ListBox5" runat="server" SelectionMode="Multiple"  CssClass="form-control" style="overflow: auto;" ></asp:ListBox>
           </ContentTemplate>

   </asp:UpdatePanel>
    </div>
        
             
  </div>  
                             <div class="col" style="margin-left: 500px; margin-top: -1px;" >
                                   <asp:LinkButton ID="LinkButton5" runat="server" OnClick="display_Click"   class="btn btn-secondary" BackColor="#41464b">
    <i class="fa fa-dashboard"></i>Display Data

</asp:LinkButton><br> 
                   </div>  
       
        
       <hr class="mt-2 mb-3"/>

                <div class="row">
    <div class="col" >
      <dt > Row(s):<i class="fa fa-cube"></i></dt>
           <asp:UpdatePanel runat="server" id="UpdatePanel2" UpdateMode="Conditional" >
     <ContentTemplate>
        <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple" CssClass="form-control"></asp:ListBox>
         <asp:LinkButton ID="LinkButton3" runat="server" OnClick="clearow_Click"  class="btn btn-secondary btn-sm nour">
    <i class="fa fa-trash"></i>
</asp:LinkButton>
           </ContentTemplate>

   </asp:UpdatePanel>
    </div>
    <div class="col" >
      <dt > Column(s): <i class="fa fa-columns"></i></dt>
     <asp:UpdatePanel runat="server" id="UpdatePanel3" UpdateMode="Conditional" >
     <ContentTemplate>
      <asp:ListBox ID="ListBox11" runat="server"  CssClass="form-control" SelectionMode="Multiple"> </asp:ListBox>
         <asp:LinkButton ID="LinkButton2" runat="server"  OnClick="cancelcol_Click"  class="btn btn-secondary btn-sm nour">
    <i class="fa fa-trash"></i>
</asp:LinkButton>
           </ContentTemplate>

   </asp:UpdatePanel>
    </div>
    <div class="col-5">
       <dt > Filter(s):<i class="fa fa-filter"></i></dt>
        <asp:UpdatePanel runat="server" id="UpdatePanel4" UpdateMode="Conditional" >
     <ContentTemplate>
      <asp:ListBox ID="ListBox3" runat="server"   CssClass="form-control"  SelectionMode="Multiple"></asp:ListBox>
        
   <asp:LinkButton ID="LinkButton1" runat="server"  OnClick="cancelfilter_Click" class="btn btn-secondary btn-sm nour">
    <i class="fa fa-trash"></i>
</asp:LinkButton>
           </ContentTemplate>

   </asp:UpdatePanel>
    </div>
  </div>


      
  

             

            

            
                   
            
                        
            
         





    
  

    </div>
     
  </form>

</body>
</asp:Content>



 
 
   

