<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="Campains.aspx.cs" Inherits="CMS.Viralme.Advertiser.Campains" %>
<%@ Register Assembly ="App_Web_usccampains.ascx.cc671b29" Namespace="Viralme.Controls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Design/js/jsgrid-1.5.3/jsgrid.min.css" rel="stylesheet" />
    <link href="../../Design/js/jsgrid-1.5.3/jsgrid-theme.min.css" rel="stylesheet" />

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU&v=3.exp&libraries=places"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">

    <script src="../../Design/js/jsgrid-1.5.3/jsgrid.min.js"></script>
    <script src="../../Design/js/jquery.json.min.js"></script>

    <uc1:Campains runat="server" ID="uscCompain" />
   
    <script type="text/javascript">

        function SaveData(name,start,duration,data) {
            seen = [];
            var str = JSON.stringify(data, function (key, val) {
                if (val != null && typeof val == "object") {
                    if (seen.indexOf(val) >= 0) {
                        return;
                    }
                    seen.push(val);
                }
                return val;
            });
       
            $.ajax({
                type: "post",
                url: "/Viralme/ClientCalls.aspx/SaveCampagin",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: "{statics:'" + str + "',name:'" + name + "',startdate:'" + start + "',duraion:'"+duration+"'}",
                success: function (msg) {
                    alert('کمپین شما با موفقیت ایجاد شد');
                },
                error: function (xhr, status, error) {

                    alert(xhr.responseText);
                }
            });
        }
    </script>
</asp:Content>
