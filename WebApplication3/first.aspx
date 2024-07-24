<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="first.aspx.cs"  Inherits="WebApplication3.config" %>
<!doctype html>
<html lang="en">
<head>
   

     <script type="text/javascript">
         function SearchEmployees(txtSearch, cblEmployees) {
             if ($(txtSearch).val() != "") {
                 var count = 0;
                 $(cblEmployees).children('tbody').children('tr').each(function () {
                     var match = false;
                     $(this).children('td').children('label').each(function () {
                         if ($(this).text().toUpperCase().indexOf($(txtSearch).val().toUpperCase()) > -1)
                             match = true;
                     });

                     if (match) {
                         $(this).show();
                         count++;
                     }
                     else {
                         $(this).hide();
                     }
                 });
                 $('#spnCount').html((count) + ' match');
             }
             else {
                 $(cblEmployees).children('tbody').children('tr').each(function () {
                     $(this).show();
                 });
                 $('#spnCount').html('');
             }
         }
         function SearchEmployees2(txtSearch, cblEmployees2) {
             if ($(TextBox1).val() != "") {
                 var count = 0;
                 $(cblEmployees2).children('tbody').children('tr').each(function () {
                     var match = false;
                     $(this).children('td').children('label').each(function () {
                         if ($(this).text().toUpperCase().indexOf($(TextBox1).val().toUpperCase()) > -1)
                             match = true;
                     });
                     if (match) {
                         $(this).show();
                         count++;
                     }
                     else {
                         $(this).hide();
                     }
                 });
                 $('#spnCount2').html((count) + ' match');
             }
             else {
                 $(cblEmployees2).children('tbody').children('tr').each(function () {
                     $(this).show();
                 });
                 $('#spnCount2').html('');
             }
         }
     
        

</script>
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
  <script>
      $(document).ready(function () {
          
       });
      
  </script>
    <style>
#CheckBoxList1{margin-left: -30px!important;

}
        #DropDownList1, #ListBox1, #cblEmployees, #CheckBoxList1 {
            border: 1px solid #777;
            font-size: initial;
        }

</style>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="bootstrap-wizard-master/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="bootstrap-wizard-master/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>WIZARD</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!--     Fonts and icons     -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

	<!-- CSS Files -->
    <link href="bootstrap-wizard-master/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="bootstrap-wizard-master/assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="bootstrap-wizard-master/assets/css/demo.css" rel="stylesheet" />
     <link href="Content/demo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
      <style>
   
.timeline-steps {
    display: flex;
    justify-content: center;
    flex-wrap: wrap
}

.timeline-steps .timeline-step {
    align-items: center;
    display: flex;
    flex-direction: column;
    position: relative;
    margin: 1rem
}

@media (min-width:768px) {
    .timeline-steps .timeline-step:not(:last-child):after {
        content: "";
        display: block;
        border-top: .25rem dotted #3b82f6;
        width: 3.46rem;
        position: absolute;
        left: 7.5rem;
        top: .3125rem
    }
    .timeline-steps .timeline-step:not(:first-child):before {
        content: "";
        display: block;
        border-top: .25rem dotted #3b82f6;
        width: 3.8125rem;
        position: absolute;
        right: 7.5rem;
        top: .3125rem
    }
}

.timeline-steps .timeline-content {
    width: 10rem;
    text-align: center
}

.timeline-steps .timeline-content .inner-circle {
    border-radius: 1.5rem;
    height: 1rem;
    width: 1rem;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background-color: #3b82f6
}

.timeline-steps .timeline-content .inner-circle:before {
    content: "";
    background-color: #3b82f6;
    display: inline-block;
    height: 3rem;
    width: 3rem;
    min-width: 3rem;
    border-radius: 6.25rem;
    opacity: .5
}
.h6{
        text-transform: lowercase;
       font-size: 12px;
}
    </style>

     <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="Home.aspx"> <i class="fa fa-home"></i>Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  
         <i class="fa fa-dashboard"></i> Reports
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="guess.aspx"><i class="fa fa-eye"></i>Existant Report</a>
          <a class="dropdown-item" href="sharing.aspx"><i class="fa fa-share"></i>Shared Reports</a>
        </div>
      </li>
      <li class="nav-item" style="display:none">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  
         <i class="fa fa-user"></i>  <%=name%>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">  Profile</a>
          <a class="dropdown-item" href="#">Settings</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="Login.aspx"> <i class="fa fa-sign-out"></i>LogOut</a>
        </div>
      </li>
      <li class="nav-item" style="display:none">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<div class="image-container set-full-height" style="background-image: url('bootstrap-wizard-master/assets/img/wizard-city.jpg')">
    <!--   Creative Tim Branding   -->
  
   

	

    <!--   Big container   -->
    <div class="container">
        <div class="row">
           
        <div class="col-sm-8 col-sm-offset-2">

            <!--      Wizard container        -->
            <div class="wizard-container">

                <div class="card wizard-card" data-color="orange" id="wizardProfile">
                    <form action="" method="" runat="server">
                          <div class="wizard-header">
                               <div class="h-100 row align-items-center">
                 <img src="bootstrap-wizard-master/assets/img/Acteol.png" style="width: 80px;margin-left: 320px;"/>
            </div>
                        	<h3>
                        	   <b>MDX</b> QUERY BUILDER GENERATOR <br>
                        	   <small>This information will let us know more about Tool Usage.</small>
                        	</h3>
                    	</div>
                        	<div class="wizard-navigation">
                            <ul>
                                <li><a href="#nour" data-toggle="tab">ToolsInformations</a></li>
                                <li><a href="#about" data-toggle="tab">ServerConnexion</a></li>
                                <li><a href="#account" data-toggle="tab">OlapCube</a></li>
                                <li><a href="#address" data-toggle="tab">MeasuresDimensions</a></li>
                                
                            </ul>

						</div>
    
  <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
       
         	
                <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->
                      
                    	
					
                   
                        <div class="tab-content">
                         
                             <div class="tab-pane" id="nour">
                                    <div class="row">
        <div class="col">
            <div class="timeline-steps aos-init aos-animate" data-aos="fade-up">
                <div class="timeline-step">
                    <div class="timeline-content" data-toggle="popover" data-trigger="hover" data-placement="top" title="" data-content="And here's some amazing content. It's very engaging. Right?" data-original-title="2003">
                        <div class="inner-circle"></div>
                        <p class="h6 mt-3 mb-1" style="text-transform: lowercase;">Step1 <i class="fa fa-close" style="font-size: smaller;"></i></p>
                        <p class="h6 text-muted mb-0 mb-lg-0" style="text-transform: lowercase;">Cnx Server <i class="fa fa-laptop" style="font-size: large;"></i></p>
                    </div>
                </div>
                <div class="timeline-step">
                    <div class="timeline-content" data-toggle="popover" data-trigger="hover" data-placement="top" title="" data-content="And here's some amazing content. It's very engaging. Right?" data-original-title="2004">
                        <div class="inner-circle"></div>
                        <p class="h6 mt-3 mb-1">Step2<i class="fa fa-close" style="font-size: smaller;"></i></p>
                        <p class="h6 text-muted mb-0 mb-lg-0"> Olap Cube<i class="fa fa-cube" style="font-size: large;"></i> </p>
                    </div>
                </div>
                <div class="timeline-step">
                    <div class="timeline-content" data-toggle="popover" data-trigger="hover" data-placement="top" title="" data-content="And here's some amazing content. It's very engaging. Right?" data-original-title="2005">
                        <div class="inner-circle"></div>
                        <p class="h6 mt-3 mb-1">Step3<i class="fa fa-close" style="font-size: smaller;"></i></p>
                        <p class="h6 text-muted mb-0 mb-lg-0">Measures && Dimensions <i class="fa fa-signal" style="font-size: large;"></i></p>
                    </div>
                </div>
                <div class="timeline-step">
                    <div class="timeline-content" data-toggle="popover" data-trigger="hover" data-placement="top" title="" data-content="And here's some amazing content. It's very engaging. Right?" data-original-title="2010">
                        <div class="inner-circle"></div>
                        <p class="h6 mt-3 mb-1">Step4<i class="fa fa-close" style="font-size: smaller;"></i></p>
                        <p class="h6 text-muted mb-0 mb-lg-0">MDX query Options <i class="fa fa-clone" style="font-size: large;"></i></p>
                    </div>
                </div>
                <div class="timeline-step mb-0">
                    <div class="timeline-content" data-toggle="popover" data-trigger="hover" data-placement="top" title="" data-content="And here's some amazing content. It's very engaging. Right?" data-original-title="2020">
                        <div class="inner-circle"></div>
                        <p class="h6 mt-3 mb-1">Step5<i class="fa fa-close" style="font-size: smaller;
    "></i></p>
                        <p class="h6 text-muted mb-0 mb-lg-0">Reporting<i class="fa fa-dashboard" style="font-size: large;"></i></p>
                    </div>
                </div>
            </div>
        </div>
   
</div>
                                     <div class="row">
                                       <div class="col-sm-10 col-sm-offset-1">
                                            <div class="col-sm-4">
                                                 <div class="h-100 row align-items-center">
                 <img src="bootstrap-wizard-master/assets/img/Acteol.png" style="width: 60px; border-radius: 50%;"/>
            </div>
       <h6 class="text-muted" style="text-transform: lowercase;">
             <small style="text-transform: lowercase;" >Powered By:</small>

 Acteol
</h6> 
                                                                
  
 

                                        </div>
                                             <div class="col-sm-4">
                                                 
                                        </div>
                                            <div class="col-sm-4">
                                               

  <h6 class="text-muted" style="text-transform: lowercase;"> Tool Demo <i class="fa fa-video-camera" style="font-size: small;"></i></h6>

                                 <iframe width="200" height="200" src="" allowfullscreen="true" style="border-radius: 25px;"></iframe>
                                               
                                        </div>
                                            </div>
                                       <div class="col-sm-5 col-sm-offset-1" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2022 Copyright:
    <a class="text-reset fw-bold" href="https://www.theaccessgroup.com">theaccessgroup.com</a>
  </div>
         
                                      </div>
                            </div>
                            <div class="tab-pane" id="about">
                              <div class="row">
                                  <h4 class="info-text"> connexion to Server... <i class="fa fa-server" style="font-size: revert;"></i></h4>
                                  <div class="col-sm-2 col-sm-offset-1">
                                     
                                  </div>
                                  <div class="col-sm-6">
                        
                                        
      <asp:UpdatePanel runat="server" id="UpdatePanel" >
     <ContentTemplate>
         
       <asp:DropDownList  ID="DropDownList1" runat="server" AutoPostBack = "true" OnSelectedIndexChanged = "OnSelectedIndexChanged" class="form-control" required="true"   >
            <asp:ListItem Value="">--select Server--</asp:ListItem>
  
</asp:DropDownList>
                     
        
                </ContentTemplate>

   </asp:UpdatePanel>
                           

                    
       
                                         
                                      <div class="form-group">
                                    </div>
                                  </div>
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                         
    
                              

                                      </div>
                                  </div>
                              </div>
                            </div>

                            <div class="tab-pane" id="account">
                                <h4 class="info-text">Choose  OLAP Cube... <i class="fa fa-cube" style="font-size: revert;"></i> </h4>
                                           



                                    <div class="col-sm-10 col-sm-offset-1">
                                       
                                     
                                            
                                               <asp:UpdatePanel runat="server" id="UpdatePanel2" >
     <ContentTemplate>
                                                 <asp:ListBox  ID="ListBox1" runat="server" SelectionMode="Multiple" AutoPostBack = "true" onselectedindexchanged="listIndexChanged" class="form-control" required="true"   >
                    </asp:ListBox>  

                                           
         </ContentTemplate>

   </asp:UpdatePanel>
                                       
                                        
                                   

                                </div>
                            </div>
                           

                            <div class="tab-pane" id="address">
                              
                                <div class="row">
                                <div class="col-sm-12">
                                        <h4 class="info-text">  Manage Measures and Dimensions... 
                                    <i class="fa fa-cubes" style="font-size: revert;"></i>


                                        </h4>
                                    </div>

                                    <div class="col">
                                       
                             

                        <label id="Label4">Choose Measure(s) <i class="fa fa-signal" style="font-size: revert;"></i> </label>

                     
                    <input name="search" type="text" class="form-control" 
                        placeholder="Search Measures..." ID="txtSearch" onkeyup="SearchEmployees(this,'#cblEmployees');" style="width: 250px;" >
                                      
                         
                          

                                                       <asp:UpdatePanel runat="server" id="UpdatePanel1" >
     <ContentTemplate>
          <div style="height: 200px; overflow-y: auto; overflow-x: hidden; margin-right:160px;margin-top: 10px;">
                            <asp:CheckBoxList ID="cblEmployees" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="240px" Height="1000px" ClientIDMode="Static" CssClass="form-control" required="true" >
                            </asp:CheckBoxList>
                 </div>
           </ContentTemplate>

   </asp:UpdatePanel>
                                 
                       
     
                    
              

      
                              </div>
                             
                                    <div class="col">
             <label id="Label6">Choose Dimension(s) <i class="fa fa-table" style="font-size: revert;"></i> </label>

                                         <input name="search" type="text" class="form-control" 
                        placeholder="Search Measures..." ID="TextBox1" onkeyup="SearchEmployees2(this,'#CheckBoxList1');" style="width: 250px;margin-left: -28px;">
                                        

                     

                        
                       
                              <asp:UpdatePanel runat="server" id="UpdatePanel3" >
     <ContentTemplate>
             <div style=" overflow-y: visible; overflow-x: visible; margin-top: 10px;">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="240px" height="250px" ClientIDMode="Static" CssClass="form-control" required="true"  >
                            </asp:CheckBoxList>
                 </div>
          </ContentTemplate>

   </asp:UpdatePanel>
                      
                   
                       
                                    </div>
                                  
                                  
                                </div>
                             
                            </div>
                                  
      

                        </div>
                       
        
            <div class="wizard-footer height-wizard">
                            <div class="pull-right">

                    
                                 <input type='button' class='btn btn-next btn-fill btn-default btn-wd btn-sm' name='next' value='Next'/>  
                   
                               <asp:Button ID="Button1"  runat="server" Text="Finish" OnClick="next_Click" class='btn btn-finish btn-fill btn-default btn-wd btn-sm' >  </asp:Button>  

                            </div>

                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                            </div>
                            <div class="clearfix"></div>
                        </div>
            
                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div><!-- end row -->
    </div> <!--  big container -->

    <div class="footer">
        <div class="container">
        </div>
    </div>

</div>

</body>

	<!--   Core JS Files   -->
	<script src="bootstrap-wizard-master/assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="bootstrap-wizard-master/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="bootstrap-wizard-master/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="bootstrap-wizard-master/assets/js/gsdk-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="bootstrap-wizard-master/assets/js/jquery.validate.min.js"></script>

</html>

