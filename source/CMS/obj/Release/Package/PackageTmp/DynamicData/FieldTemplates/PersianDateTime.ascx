<%@ Control Language="C#" CodeBehind="PersianDateTime.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.PersianDateTime" %>

<asp:Label ID="Label1" CssClass=" text-right"  runat="server" Text="<%# GetDate(FieldValueString) %>"></asp:Label>
