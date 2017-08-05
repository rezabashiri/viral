<%@ Control Language="C#" CodeBehind="QRCode.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.QRCode" %>

 
<asp:Image ID="Image1" Width="120" Height="120" ImageUrl="<%# GetImagePath(FieldValueString) %>" runat="server" />
