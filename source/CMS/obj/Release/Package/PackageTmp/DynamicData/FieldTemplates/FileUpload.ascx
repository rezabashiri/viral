<%@ Control Language="C#" CodeBehind="FileUpload.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.FileUpload" %>

<uc1:FileUpload ID="uscFileUpload" runat="server" AttachId="<%# GetAttachId(FieldValueString) %>" CanUpload="false" />
