<%@ Control Language="C#" CodeBehind="QRCode_Edit.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.QRCode_EditField" %>

<asp:Image ID="Image1" ImageUrl="data:image/gif;base64,<%# FieldValueString  %>" runat="server" />