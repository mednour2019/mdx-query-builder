<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication3.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="https://kendo.cdn.telerik.com/2022.1.119/js/jquery.min.js"></script>

    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.1.119/styles/kendo.blueopal.min.css" />
      

    <script src="https://kendo.cdn.telerik.com/2022.1.119/js/kendo.all.min.js"></script>
     <script>
         $(document).ready(function () {
             var mapData = <%=this.output2%>;
             var mapData2 = <%=this.output3%>;
             var max = <%=this.maxvalue%>;
             debugger 
             function createChart() {
                 $("#chart").kendoChart({
                     title: {
                         text: "TotalUser By Country"
                     },
                     legend: {
                         visible: true
                     },
                     seriesDefaults: {
                         type: "column"
                     },
                     series: [{
                         name: "Total User",
                         data: mapData2,
                         color: "black"

                     }],
                     valueAxis: {
                         max: max,
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
                         visible: true,
                         categories: mapData,
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

             $(document).ready(createChart);
             $(document).bind("kendo:skinChange", createChart);
         });
        
         </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
  <div class="row">
    <div class="col-sm">
     
    </div>
    <div class="col-sm">
     <img src="ConnectPlusAdmin-Free-Bootstrap-Admin-Template-master/template/assets/images/Acteologo.png"alt="logo" 
              style="width: 120px;height: 100px;background-color: #e6faf221; margin-top: -60px;margin-left: 100px;"/>
    </div>
    <div class="col-sm">
      
    </div>
  </div>
</div>
 <div class="d-xl-flex justify-content-between align-items-start">
              <h2 class="text-dark font-weight-bold mb-2"> Mdx Query Builder <i class="mdi mdi-cube"></i> </h2> 
             
            </div>
         <div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
               
                 
                </div>
     <div class="row">
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">Users <i class="fa fa-user-secret" style="font-size: revert;"></i></h5>
                            <h2 class="mb-4 text-dark font-weight-bold"><%=nbusers%></h2>
                            <div class="dashboard-progress dashboard-progress-1 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-lightbulb icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0"><i class="fa fa-check" style="font-size: revert;"></i></p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark"></h3>
                          </div>
                        </div>
                      </div>
                   <div class="col-xl-9 ">
                        <div class="card">
                          <div class="card-body text-center">
                           <div id="example">
                               <i class="mdi mdi-flag-checkered" style="font-size:large; color:black"></i>
                          <div class="demo-section k-content wide">
                          <div id="chart" style="background: center no-repeat url('');"></div>
                          </div>
                          </div>

                          </div>
                        </div>
                      </div>
                    </div>
         <div class="row">

                      <div class="col-12 grid-margin">
                        <div class="card" >
                          <div class="card-body">
                     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container bootstrap snippets bootdeys">
      <div class="row text-center">
        <div class="col-sm-4">
          <div class="contact-detail-box">
            <i class="fa fa-th fa-3x text-colored"></i>
            <h4>Get In Touch</h4>
            <abbr title="Phone">P:</abbr>  0845 345 3300<br>
            E: <a href="mailto:info@acteol.com" class="text-muted">info@acteol.com</a>
          </div>
        </div><!-- end col -->

        <div class="col-sm-4">
          <div class="contact-detail-box">
            <i class="fa fa-map-marker fa-3x text-colored"></i>
            <h4>Our Location</h4>

            <address>
            Route l'Afrane km7 <br>
          Sfax 3093  <br>
          </address>
          </div>
        </div><!-- end col -->

        <div class="col-sm-4">
          <div class="contact-detail-box">
            <i class="fa fa-book fa-3x text-colored"></i>
            <h4>24x7 Support</h4>

            <p>Company's standard dummy text.</p>
            <h4 class="text-muted">0845 345 3300</h4>
          </div>
        </div><!-- end col -->

      </div>
      <!-- end row -->


      <div class="row">
        <div class="col-sm-6">
          <div class="contact-map">
            <iframe src="https://maps.google.com/maps?q=acteol%20sfax&t=k&z=15&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" style="width: 100%; height: 360px;"></iframe>
          </div>
        </div><!-- end col -->

        <!-- Contact form -->
        <div class="col-sm-6">
          <form role="form" name="ajax-form" id="ajax-form" action="https://formsubmit.io/send/coderthemes@gmail.com" method="post" class="form-main">

            <div class="form-group">
              <label for="name2">Name <i class="mdi mdi-login"></i></label>
              <input class="form-control" id="name2" name="name" onblur="if(this.value == '') this.value='Name'" onfocus="if(this.value == 'Name') this.value=''" type="text" value="Name">
              <div class="error" id="err-name" style="display: none;">Please enter name</div>
            </div> <!-- /Form-name -->

            <div class="form-group">
              <label for="email2">Email<i class="mdi mdi-email"></i></label>
              <input class="form-control" id="email2" name="email" type="text" onfocus="if(this.value == 'E-mail') this.value='';" onblur="if(this.value == '') this.value='E-mail';" value="E-mail">
              <div class="error" id="err-emailvld" style="display: none;">E-mail is not a valid format</div> 
            </div> <!-- /Form-email -->

            <div class="form-group">
              <label for="message2">Message<i class="mdi mdi-message"></i></label>
              <textarea class="form-control" id="message2" name="message" rows="5" onblur="if(this.value == '') this.value='Message'" onfocus="if(this.value == 'Message') this.value=''">Message</textarea>

              <div class="error" id="err-message" style="display: none;">Please enter message</div>
            </div> <!-- /col -->

            <div class="row">            
              <div class="col-xs-12">
                <div id="ajaxsuccess" class="text-success" style="display:none">E-mail was successfully sent.</div>
                <div class="error" id="err-form" style="display: none;">There was a problem validating the form please check!</div>
                <div class="error" id="err-timedout" style="display:none">The connection to the server timed out!</div>
                <div class="error" id="err-state"></div>
                <button type="submit" class="btn btn-primary btn-shadow btn-rounded w-md" id="send">Submit<i class="mdi mdi-check"></i></button>
              </div> <!-- /col -->
            </div> <!-- /row -->

          </form> <!-- /form -->
        </div> <!-- end col -->

      </div> <!-- end row -->
          
    </div>
                          </div>
                        </div>
                      </div>
                    </div>
   
    </asp:Content>
