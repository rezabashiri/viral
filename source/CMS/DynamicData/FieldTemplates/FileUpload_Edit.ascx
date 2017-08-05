<%@ Control Language="C#" CodeBehind="FileUpload_Edit.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.FileUpload_EditField" %>

<uc1:FileUpload ID="uscFileUpload" AllowedFileType="bmp" runat="server" AttachId="<%# GetAttachId( FieldValueEditString ) %>" UserId="<%# AccessManagementService.Access.AccessControl.LoggenInUser.ID %>" UploadPath="<%# GetUploadPath() %>" />

<%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="uscFileUpload" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="uscFileUpload" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="uscFileUpload" Display="Dynamic" />--%>
