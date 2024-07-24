<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Login</title>
    <!-- plugins:css -->
  
    <link rel="stylesheet" href="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/vendors/mdi/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/vendors/flag-icon-css/css/flag-icon.min.css"/>
    <link rel="stylesheet" href="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/vendors/css/vendor.bundle.base.css"/>
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/css/style.css"/>
    <!-- End layout styles -->
    <link rel="shortcut icon" href="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/images/favicon.png" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
     <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.common.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>


</head>
     
     <script>

         /*  $(function () {
               $('#login').click(function () {
  
                  // console.log("nour")
                   var Username = $("#exampleInputUser1").val();
                   var Password = $("#exampleInputPassword1").val();
                   if (Username > '' && Password > '') {
                       var DTO = { 'Username': Username, 'Password': Password };
                       $.ajax({
                           type: "POST",
                           contentType: "application/json; charset=utf-8",
                           url: "Login.aspx/validerlogin",
                           dataType: "json",
                           data: JSON.stringify(DTO),
                           success: OnSuccess,
                           error: ErrorFound
                       });
                   }
               });
               function OnSuccess(data) {
                   if (data.d == true) {
                      // console.log("welcome");
                      // window.Location("dashboard.aspx")
                       window.location.href = "dashboard.aspx";
                   }
                   else {
                      // console.log("nooooo");
  
                   }
                   //console.log(data);
  
                   //console.log("sucess");
                   //debugger
               };
  
               function ErrorFound(result) {
                   console.log("error");
               }
  
  
  
           });*/

    </script>
 
<body>
   <style>
   .backg {background-image: url("https://images.pexels.com/photos/251225/pexels-photo-251225.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
            height: 880px; 
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center; 
          
            
   }
    
 
    </style>   
       <script>
           $(document).ready(function () {

           $("#exampleInputUser1").focus();
           $("#exampleInputUser1").blur(function () {
               var name = $('#exampleInputUser1').val();
               if (name.length == 0) {
                   $('#exampleInputUser1').next(".red").remove();

                   $('#exampleInputUser1').after('<h6 class="red" style="color:red"><small>UserName is Required</small></h6>');

                   $('#exampleInputUser1').css('border-color', 'red');
               }
               else {
                   $('#exampleInputUser1').next(".red").remove();
                   $('#exampleInputUser1').css('border-color', '#ced4da');

                   return true;
               }
           });

               $("#exampleInputPassword1").blur(function () {
                   var name = $('#exampleInputPassword1').val();
                   if (name.length == 0) {
                       $('#exampleInputPassword1').next(".red").remove();

                       $('#exampleInputPassword1').after('<h6 class="red" style="color:red"><small>Password is Required</small></h6>');
                       $('#exampleInputPassword1').css('border-color', 'red');
                   }
                   else {
                       $('#exampleInputPassword1').next(".red").remove();
                       $('#exampleInputPassword1').css('border-color', '#ced4da');
                       return true;
                   }
               });
               $("#exampleInputPassword1").parent().append("<span class='k-icon k-i-preview'style='float: right;margin-right:-25px; margin-top:-30px;'></span>");
               $(".k-i-preview").mousedown(function () {

                   $("#exampleInputPassword1").attr("type", "text");
               })
               $(".k-i-preview").mouseup(function () {

                   $("#exampleInputPassword1").attr("type", "password");
               })

               $("#exampleInputUser1").mouseover(function () {
                   $(".valo").hide();
               });
               $("#exampleInputPassword1").mouseover(function () {
                   $(".valo").hide();
               });
              
           });



</script>
     <div class="container-scroller ">
      
        <div class="content-wrapper d-flex align-items-center auth backg  ">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5" style="border-radius: 30px;margin-top: -90px; height:700px;" >
                <div class="brand-logo">
                  <img src="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/images/Acteol.png" style="width: 100px;margin-left: 100px;margin-top: -40px;"/>
                </div;
                  <div id="logo">
                    <img src="https://demos.telerik.com/kendo-ui/admin-dashboard/Content/images/signin-logo.svg" style="width: 200px;margin-left: 50px;"/>
                </div>
                <h4>Hello! let's get started</h4>
                <h6 class="font-weight-light">Sign in to continue.</h6>
                    <h6 class="font-weight-bold valo" style="color:red"><%=error%></h6>
                <form class="pt-3" id="form1" runat="server" >  
       
    
                  <div class="form-group">
                     <span class="input-group-addon"><i class="fa fa-user" style="font-size: xx-large;"></i></span>

                    <input type="text" name="username" required="required"  class="form-control form-control-lg" id="exampleInputUser1" placeholder="Username"  runat="server"/>
                  </div>
                  <div class="form-group">
                  <span class="input-group-addon"><i class="fa fa-lock" style="font-size: xx-large;"></i>

                    <input type="password" name="password" required="required" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password" runat="server"/>
                    
                      </span>
                  </div>
                   
                  <div class="mt-3">  
                        <asp:Button id="loginnn" runat="server" Text="SIGN IN"  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" OnClick="klik" />
       
                     
                   
                  </div>
                   
                  <div class="my-2 d-flex justify-content-between align-items-center">
                  
                  
                  </div>
                 
                
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
  
      <!-- page-body-wrapper ends -->
    </div>
     <!-- container-scroller -->
    <!-- plugins:js -->
   
    <!-- endinject -->

</body>
</html>
