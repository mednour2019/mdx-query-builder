<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checking.aspx.cs" Inherits="WebApplication3.checking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

     <script src="Scripts/bootstrap.min.js"></script>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />

<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <script type="text/javascript">
        function SearchEmployees(txtSearch, cblEmployees)
        {
            if ($(txtSearch).val() != "")
            {
                var count = 0;
                $(cblEmployees).children('tbody').children('tr').each(function ()
                {
                    var match = false;
                    $(this).children('td').children('label').each(function ()
                    {
                      if ($(this).text().toUpperCase().indexOf($(txtSearch).val().toUpperCase()) > -1)
                        match = true;
                    });

                    if (match)
                    {
                        $(this).show();
                         count++;
                    }
                    else
                    {
                        $(this).hide();
                    }
                });
            $('#spnCount').html((count) + ' match');
            }
            else
            {
                $(cblEmployees).children('tbody').children('tr').each(function ()
                {
                    $(this).show();
                });
            $('#spnCount').html('');
            }
        }

        function SearchEmployees2(txtSearch, cblEmployees2)
        {
            if ($(TextBox1).val() != "")
            {
                var count = 0;
                $(cblEmployees2).children('tbody').children('tr').each(function ()
                {
                    var match = false;
                    $(this).children('td').children('label').each(function ()
                    {
                        if ($(this).text().toUpperCase().indexOf($(TextBox1).val().toUpperCase()) > -1)
                            match = true;
                    });
                    if (match)
                    {
                        $(this).show();
                        count++;
                    }
                    else
                    {
                        $(this).hide();
                    }
                });
                $('#spnCount2').html((count) + ' match');
            }
            else
            {
                $(cblEmployees2).children('tbody').children('tr').each(function ()
                {
                    $(this).show();
                });
                $('#spnCount2').html('');
            }
        }
    </script>
</head>

<body>
   <div class="container" style="margin-top: 35px;">
   <form id="form1" runat="server">
        <div class="row"> 
                <div class="col-md-4" style= "height: 180px;  width: 150px;">

                    <fieldset style="width: 240px">

                        <legend>Cube Measures choosen</legend>

                        <asp:TextBox ID="txtSearch" runat="server" onkeyup="SearchEmployees(this,'#cblEmployees');"
                        placeholder="Search Measures">
                        </asp:TextBox>

                        <span id="spnCount"></span>
                        <div style="height: 200px; overflow-y: auto; overflow-x: hidden">
                            <asp:CheckBoxList ID="cblEmployees" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="240px" ClientIDMode="Static">
                            </asp:CheckBoxList>
                       </div>
                    </fieldset> 
                    
                </div>

               <div class="col-md-6" style= "height: 180px;width: 150px;margin-left: 200px;" >

                      <fieldset style="width: 240px">
                          <legend>Cube Dimensions choosen</legend>
                          <asp:TextBox ID="TextBox1" runat="server" onkeyup="SearchEmployees2(this,'#CheckBoxList1');"
                                    placeholder="Search Dimensions">
                          </asp:TextBox>
                           <span id="spnCount2"></span>
                           <div style="height: 200px; overflow-y: auto; overflow-x: hidden">
                               <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="240px" ClientIDMode="Static">
                               </asp:CheckBoxList>
                           </div>
                      </fieldset>           
               </div>

             <div class="col-md-6" style="margin-bottom:-900px;">
                   <asp:Button ID="bbb" runat="server" Text="Next" 
                   OnClick="bbb_Click"   CssClass="btn btn-primary" />
             </div>
        
       </div>      
    </form>
 </div>
</body>
</html>
