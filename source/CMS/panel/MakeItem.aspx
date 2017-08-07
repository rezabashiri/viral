<%@ Page Language="C#" AutoEventWireup="true" Inherits="panel_MakeItem" 
    MasterPageFile="~/Design/MasterPages/Administrator.Master" EnableEventValidation="false" ValidateRequest="false" Codebehind="MakeItem.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <title>ایجاد و ویرایش مطلب جدید</title>
    <meta name="robots" content="nosnippet"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content="مرورگران"/>
 
    <script type="text/javascript" src="../js/tinymce/tinymce.min.js"></script>
     <script type="text/javascript" src="../js/Main.js"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TitleContentPH">
     
    <div class="clear">
    </div>
    <div class="confirmMSG" id="confirmDiv" visible="false" runat="server">
        <asp:Label ID="lblOk" runat="server"></asp:Label>
    </div>
    <div class="clearFloat">
    </div>
    <div class="errorMSG" id="errorDiv" runat="server" visible="false">
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </div>
    <div class="clear">
    </div>
    <div id="title_bar">
        <h1>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
        <span>
            <asp:Label ID="lblSpanTitle" runat="server"></asp:Label></span>
    </div>
    <div class="clear">
    </div>
    <div class="row">
        <div class="col-sm-12 text-center">
 
        <asp:ValidationSummary ID="vldSummary" runat="server" />
            
        </div>
    </div>
        <div class="row  ">
            <div class="col-sm-2 text-left">
                عنوان مطلب<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtTopic" Text="*" ErrorMessage="عنوان مطلب را وارد کنید" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                :
            </div>
            <div class="col-sm-8 text-right">
                <asp:TextBox ID="txtTopic" runat="server" CssClass="Mytxt persian form-control"
                    Width="500px" MaxLength="100"></asp:TextBox>
            </div>
        </div>
        <!-- end of row -->
        <div class="row  ">
            <div class="col-sm-2 text-left">
                گروه:
            </div>
            <div class="col-sm-8 text-right">
                <asp:DropDownList ID="drpGrpNews" runat="server" CssClass="Mydrp form-control">
                </asp:DropDownList>
            </div>
        </div>
        <!-- end of row -->
        <div class="clear">
        </div>
        <div class="row  " id="DivPhoto" runat="server" visible="false">
            <div class="col-sm-2 text-left">
                تصویر فعلی:
            </div>
            <div class="col-sm-8 text-right">
                <asp:Image ID="imgItem" runat="server" Height="150px" Width="220px" />
            </div>
        </div>
        <!-- end of row -->
        <div class="clear">
        </div>
        <div class="row  ">
            <div class="col-sm-2 text-left">
                <asp:Label ID="lblPhoto" runat="server" Text="تصویر مطلب:" Font-Size="13px"></asp:Label>
                <br />
                <asp:Label ID="Label1" runat="server" Text="حداکثر حجم 150 کیلوبایت"></asp:Label>
            </div>
            <div class="col-sm-8 text-right">
             <%--   <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />--%>
        
                     <telerik:RadAsyncUpload runat="server" ID="AsyncFileUpload1"    
                            
                            Skin="Silk"
                            MultipleFileSelection="Disabled"
                            
                            AllowedFileExtensions=".jpeg,.jpg,.png"
                            
                            
                             >
         <Localization Select="انتخاب " Cancel="انصراف"  />
         
     </telerik:RadAsyncUpload>
            </div>
        </div>
        <div class="clear">
        </div>
        <!-- end of row -->
        <div class="row  ">
            <div class="col-sm-2 text-left">
                <asp:Label ID="lblSummary" runat="server" Text="خلاصه مطلب" Font-Size="12px"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSummary"
                    ErrorMessage="خلاصه مطلب را وارد کنید" Text="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                :
            </div>
            <div class="col-sm-8 text-right">
                <asp:TextBox ID="txtSummary" runat="server" CssClass="Mytxt persian form-control" Height="50px" TextMode="MultiLine"
                    Width="97%"></asp:TextBox>
            </div>
        </div>
        <!-- end of row -->
        <div class="clear">
        </div>
        <div class="row " id="DivBody" runat="server">
            <div class="col-sm-2 text-left">
                متن کامل
                :
            </div>
            <div class="col-sm-8 text-right">
                    <asp:TextBox ID="editor" class="HtmlEdittor" runat="server"  style="width: 100%;height:500px;"></asp:TextBox>
            </div>
        </div>
        <!-- end of row -->
        <div class="clear">
        </div>
        <div class="row "  id="DivExFile" runat="server">
            <div class="col-sm-2 text-left">
                فایل فعلی:
            </div>
            <div class="col-sm-8 text-right">
                <asp:LinkButton ID="lnkBtnExFile" runat="server" OnClick="lnkBtnExFile_Click"></asp:LinkButton>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="row  " id="DivUplode" runat="server">
            <div class="col-sm-2 text-left">
                <asp:Label ID="lblFile" runat="server" Text="فایل جهت دانلود:"></asp:Label>
            </div>
            <div class="col-sm-8 text-right">
     
                 <telerik:RadAsyncUpload runat="server" ID="AsyncFileUpload2"    
                            
                            Skin="Silk"
                            MultipleFileSelection="Disabled"
                            
                    
                            
                            
                             >
         <Localization Select="انتخاب " Cancel="انصراف"  />
         
     </telerik:RadAsyncUpload>
                <br />
            </div>
        </div>
        <!-- end of row -->
        <div class="clear">
        </div>
        <div class="panel panel-info" >

        
        <div class="panel-heading">
            وضعیت مطلب
        </div>
        <div class="row  ">
            <div class="col-sm-2 text-left">
                نمایش در صفحه اول:
            </div>
            <div class="col-sm-8 text-right">
                <asp:DropDownList ID="drpFreshStat" runat="server" CssClass="Mydrp persian form-control">
                </asp:DropDownList>
            </div>
        </div>
        <!-- end of row -->
        <div class="row  ">
            <div class="col-sm-2 text-left">
                وضعیت نظردهی:
            </div>
            <div class="col-sm-8 text-right">
                <asp:DropDownList ID="drpCommentStat" runat="server" CssClass="Mydrp persian form-control">
                </asp:DropDownList>
            </div>
        </div>
            </div>
        <!-- end of row -->
        <div class="row  ">
            <div class="col-sm-2 text-left">
                وضعیت انتشار:
            </div>
            <div class="col-sm-8 text-right">
                <asp:DropDownList ID="drpPubStat" runat="server" CssClass="Mydrp persian form-control">
                </asp:DropDownList>
            </div>
        </div>
        <!-- end of row -->
     <div class="panel panel-success">

        <div class="panel-heading">

            گالری چند رسانه ای 
        </div>
        <div class="panel-body ">
            <asp:UpdateProgress AssociatedUpdatePanelID="uploadpannel" ID="progress" runat="server">
                <ProgressTemplate>
                    <img src="../images/loading.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel runat="server" ID="uploadpannel" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
     <uc1:FileUpload  ID="uscUpload" runat="server"  />

                </ContentTemplate>
            </asp:UpdatePanel>
       
        </div>
    
        </div>
        <div class="panel panel-info">

        <div class="panel-heading">

            زمان و تاریخ 
        </div>
        <div class="panel-body ">
            <div class="row">
            <div class="col-sm-2 text-right">
                تاریخ و زمان انتشار:
            </div>
            <div class="col-sm-8 text-right">
                  <uc1:DateTime ID="datPub" runat="server" />
            </div>
                   </div>
            <div class="row">
                    <div class="col-sm-2 text-right">
                  تاریخ وقوع رویداد
            </div>
            <div class="col-sm-8 text-right">
               <uc1:DateTime ID="ucsDateTime" runat="server" />
            </div>
            </div>
        </div>
        <!-- end of row -->
 
          </div>
                    
    
        <!-- end of row -->
        <div class="row col-sm-12 text-left" >
            <asp:Button ID="btnSubmit" runat="server" Text="درج مطلب" CssClass="btn btn-primary" Style="float: left; margin-left: 10px;" OnClick="btnSubmit_Click1"/>
         
    </div>
</asp:Content>
