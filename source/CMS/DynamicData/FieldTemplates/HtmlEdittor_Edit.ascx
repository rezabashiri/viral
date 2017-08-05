<%@ Control Language="C#" CodeBehind="HtmlEdittor_Edit.ascx.cs" Inherits="CMS.DynamicData.FieldTemplates.HtmlEdittor_EditField" %>

<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        var len = $('script').filter(function () {
            return ($(this).attr('src') == '/js/Main.js');
        }).length;

        //if there are no scripts that match, the load it
        if (len === 0) {
    
            loadScript('/js/Main.js');
        }
        len = $('script').filter(function () {
            return ($(this).attr('src') == '/js/Main.js');
        }).length;
        if (len === 0) {
            alert('still');
        }
        function loadScript(scriptLocationAndName) {
            var head = document.getElementsByTagName('head')[0];
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.src = scriptLocationAndName;
            head.appendChild(script);
        }
    });
</script>
   


 <asp:TextBox ID="editor" class="HtmlEdittor" runat="server"  style="width: 100%;height:500px;"></asp:TextBox>
 

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="editor" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="editor" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="editor" Display="Dynamic" />
