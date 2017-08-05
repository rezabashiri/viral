<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CMS.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager runat="server" ID="mgr"></asp:ScriptManager>
        <jq:JQLoader ID="loader" runat="server"   Theme="Trontastic" ></jq:JQLoader>
    <jq:JQDatePicker ID="test" runat="server"   Regional="fa" ShowInline="true" ></jq:JQDatePicker>
                <asp:AsyncFileUpload ID="AsyncFileUpload2" runat="server" />

        <uc1:FileUpload  ID="uscUpload" runat="server"  />

    </div>
    </form>
</body>
</html>
