<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="Campains.aspx.cs" Inherits="CMS.Viralme.Driver.Campains" %>

<%@ Register Assembly="App_Web_uscselectcampains.ascx.cc671b29" Namespace="Viralme.Controls" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">

        <uc1:SelectCampains runat="server" id="ucsSelectCampains"></uc1:SelectCampains>

</asp:Content>
