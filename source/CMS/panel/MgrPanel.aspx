<%@ Page Language="C#" AutoEventWireup="true" Inherits="Control_Panel_aspx_MgrPanel"  MasterPageFile="~/masterpages/MgrMaster.Master" Codebehind="MgrPanel.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    
    <title>کنترل پنل مدیریت</title>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="TitleContentPH">
    <div id="roadmap">
    
    </div>
    <div class="clear">
    </div>
    <div id="title_bar">
        <h1>
        </h1>
        <span></span>
    </div>
    <div class="clear">
    </div>
    <div id="main_content">
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
             <div class="showback">

            
                <div class="row">
                    <div class="col-sm-2 white-header">
                  <h5> دفترچه یادداشت:</h5> 
                    </div>
                   
                    <div class="col-sm-2" id="confirmDiv" visible="false" runat="server" style="margin:0 auto; width:auto;">
                        <asp:Label ID="lblOk" runat="server"></asp:Label></div>
                    <div class="clearFloat">
                    </div>
                    <div class="col-sm-2" id="errorDiv" runat="server" visible="false">
                        <asp:Label ID="lblError" runat="server"></asp:Label></div>
                    <div class="clear">
                    </div>
                    </div>
                     <div class="row">
                           <div class="col-sm-12">
                    <asp:TextBox ID="txtRemark" Width="100%" runat="server" CssClass="Remarktxt persian" TextMode="MultiLine"></asp:TextBox>
                               </div>
                             </div>
                    <div class="row">
                           <div class="col-sm-12 text-center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="یادداشت کن"
                        CssClass="btn btn-warning"   />
                               </div>
                </div>
         </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
