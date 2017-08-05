<%@ Control Language="C#" CodeBehind="Enumeration.ascx.cs" Inherits="DynamicWebApp.EnumerationFilter" %>
<%@ Register Src="~/DynamicData/Filters/Boolean.ascx" TagPrefix="uc2" TagName="Boolean" %>


<asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="True" CssClass="text-right form-control "
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
  <asp:ListItem Text="همه" Value="" />
</asp:DropDownList>

<uc2:Boolean runat="server" ID="Boolean" />
