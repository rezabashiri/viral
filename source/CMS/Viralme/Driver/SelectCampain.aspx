<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="SelectCampain.aspx.cs" Inherits="CMS.Viralme.Driver.SelectCampain" %>

<%@ Register Src="http://localhost:63774/Controls/UscSelectCampain.ascx" TagPrefix="uc2" TagName="UscSelectCampain" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">


    <uc2:uscselectcampain runat="server" id="UscSelectCampain" />


    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU&callback=myMap"></script>

</asp:Content>


