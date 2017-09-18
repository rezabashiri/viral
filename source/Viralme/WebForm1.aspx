<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Viralme.WebForm1" %>

<%@ Register Src="~/Controls/UscDriverPackage.ascx" TagPrefix="uc1" TagName="UscDriverPackage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="Resources/jsgrid.min.css" rel="stylesheet" />
    <link href="Resources/jsgrid-theme.min.css" rel="stylesheet" />

    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/bootstrap-rtl.min.css" rel="stylesheet" />

  
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <uc1:UscDriverPackage runat="server" ID="UscDriverPackage" />

    </form>

    <script src="js/bootstrap.min.js"></script>


    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU&v=3.exp&libraries=places"></script>
    <script src="Resources/sandbox-google-maps-marker-lasso-search-tool.js"></script>
    <script> initialize();</script>


    <script src="Resources/jsgrid.min.js"></script>


</body>
</html>
