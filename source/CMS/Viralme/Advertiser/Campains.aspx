<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="Campains.aspx.cs" Inherits="CMS.Viralme.Advertiser.Campains" %>
<%@ Register Assembly ="App_Web_usccampains.ascx.cc671b29" Namespace="Viralme.Controls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Design/js/jsgrid-1.5.3/jsgrid.min.css" rel="stylesheet" />
    <link href="../../Design/js/jsgrid-1.5.3/jsgrid-theme.min.css" rel="stylesheet" />

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU&v=3.exp&libraries=places"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">

    <script src="../../Design/js/jsgrid-1.5.3/jsgrid.min.js"></script>

    <uc1:Campains runat="server" ID="uscCompain" />
   

</asp:Content>
