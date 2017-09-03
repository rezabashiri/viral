<%@ Page Title="" Language="C#" MasterPageFile="~/Viralme/Design/MasterPages/HomeMaster.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CMS.Pages.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BodyContent" runat="server">
    <em:MessageBox ID="msg" runat="server" ></em:MessageBox>
    <form runat="server" id="frm">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

    </form>
</asp:Content>
