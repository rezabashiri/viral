<%@ Page Title="" Language="C#" MasterPageFile="~/Viralme/Design/MasterPages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CMS.Pages.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc2" Assembly="App_Web_uscsignup.ascx.cc671b29" Namespace="AccessManagementService.Controls" %>


<asp:Content ContentPlaceHolderID="BodyContent" runat="server" ID="BodyHolder">
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <div>
        </div> 


        <button class="btn btn-primary btn-lg" id="btnsignup">
            ثبت نام 
        </button>

        <button class="btn btn-warning btn-lg" id="btnlogin">
            ورود به وایرال می 
        </button>



        <div class="modal fade" id="modal_signUp" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document" id="modalDrag">
                <div class="modal-content persian">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" style="text-align: right;">
                            <span class="label label-primary">ثبت نام در سامانه
                            </span>
                        </h2>

                    </div>
                    <div class="modal-body">
                        <div class="box-body">
                            <uc1:SignUp runat="server" ID="sign" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="modal_login" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document" id="modalDrag2">
                <div class="modal-content persian">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" style="text-align: right;">
                            <span class="label label-primary">ورود به وایرال می
                            </span>
                        </h2>

                    </div>
                    <div class="modal-body">
                        <div class="box-body">

                            <uc1:Login ID="LoginControl" runat="server" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- /.modal -->
        <script type="text/javascript">
            $('#btnsignup').on('click', function (e) {
                e.preventDefault();
                $("#modal_signUp").modal();
            });

            $('#btnlogin').on('click', function (e) {
                e.preventDefault();
                $("#modal_login").modal();
            });

        </script>


    </form>

</asp:Content>
