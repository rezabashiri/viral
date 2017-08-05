<%@ Control Language="C#" CodeBehind="HtmlEdittor.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.HtmlEdittor" %>
 <%--<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script> 
     <script type="text/javascript" src="/js/Main.js"></script>

<textarea id="editor" class="HtmlEdittor" runat="server"   name="content" style="width: 100%;height:500px;"></textarea>--%>
 <asp:Literal runat="server" ID="editor" Text="<%# FieldValueString %>" /> 