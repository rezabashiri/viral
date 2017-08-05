<%@ Control Language="C#" CodeBehind="PersianDate_Edit.ascx.cs" EnableViewState="true" Inherits="DynamicWebApp.PersianDate_EditField" %>
 

<style type="text/css">
    .ui-datepicker .ui-datepicker-title select {
    color:black !important;
    }
</style>
 <jq:JQLoader ID="loader" runat="server" LoadJQScript="false" LoadUIScript="false" LoadUICoreStyles="true" Theme="Flick" ></jq:JQLoader>
 <jq:JQDatePicker CssClass=" text-right" ID="DatePicker1" Regional="fa" ShowSelectButton="true" ChangeYear="true" ChangeMonth="true"   runat="server"></jq:JQDatePicker>
