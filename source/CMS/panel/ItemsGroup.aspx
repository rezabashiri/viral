<%@ Page Language="C#" AutoEventWireup="true" Title="مدیریت گروه ها" Inherits="panel_ItemsGroup" MasterPageFile="~/Design/MasterPages/Administrator.Master" Codebehind="ItemsGroup.aspx.cs" %>

<script runat="server">

    protected void drpPart_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrv();
    }
</script>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TitleContentPH">
 
    <div class="confirmMSG" id="confirmDiv" visible="false" runat="server">
        <asp:Label ID="lblOk" runat="server"></asp:Label></div>
    <div class="clearFloat">
    </div>
    <div class="errorMSG" id="errorDiv" runat="server" visible="false">
        <asp:Label ID="lblError" runat="server"></asp:Label></div>
    <div class="clear">
    </div>
    <div id="title_bar">
        <h1>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
        <span>
            <asp:Label ID="lblSpanTitle" runat="server"></asp:Label></span>
    </div>
    <div class="clear">
    </div>
    <div id="main_content">
           <div class="row"  id="partDiv" runat="server">
            <div class="col-sm-3 text-left">
                بخش:</div>
            <div class="col-sm-9 text-right">
                <asp:DropDownList ID="drpPart" AppendDataBoundItems="true" runat="server" CssClass="Mydrp persian form-control" OnSelectedIndexChanged="drpPart_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="clear_1">
        </div>
        <!-- end of row -->
        <div class="row  ">
            <div class="col-sm-3 text-left">
                عنوان گروه اصلی:</div>
            <div class="col-sm-9 text-right">
                <asp:Label ID="lblFather" runat="server" ></asp:Label>
            </div>
        </div>
        <div class="clear_1">
        </div>
        <!-- end of row -->
        <div class="row ">
            <div class="col-sm-3 text-left">
                عنوان زیر گروه:</div>
            <div class="col-sm-9 text-right">
                <asp:TextBox ID="txtTopic" runat="server" CssClass="Mytxt persian form-control"></asp:TextBox>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTopic"
                    ErrorMessage="* لطفا عنوان گروه را وارد نمایید" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clear_1">
        </div>
        <!-- end of row -->
        <div class="row ">
            <div class="col-sm-3 text-left">
                وضعیت گروه:</div>
            <div class="col-sm-9 text-right">
                <asp:DropDownList ID="drpStat" runat="server" CssClass="Mydrp persian form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="clear_1">
        </div>
        <!-- end of row -->
        <div class="row text-center">
            <asp:Button ID="btnOk" runat="server" Text="ثبت" CssClass="btn btn-primary" OnClick="btnOk_Click" />
        </div>
        <div class="clear_1">
        </div>
        <!-- end of row -->
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="MyGrid"
                OnRowCommand="GridView1_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="عنوان گروه" DataField="GrpName" />
                    <asp:BoundField DataField="PartName" HeaderText="بخش" />
                    <asp:BoundField HeaderText="وضعیت" DataField="StatName" />
                    <asp:TemplateField HeaderText="ویرایش">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("GrpID").ToString() %>'
                                CommandName="EditC" ImageUrl="../images/Edit.png" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="حذف">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnDel" runat="server" CommandArgument='<%# Eval("GrpID").ToString() %>'
                                CommandName="DelC" ImageUrl="../images/delete.png" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="لیست مطالب">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("GrpID").ToString() %>'
                                CommandName="ListC" ImageUrl="../images/List.png" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ایجاد مطلب جدید">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton3" runat="server" 
                                CommandArgument='<%# Eval("GrpID").ToString() %>' CommandName="AddC" 
                                ImageUrl="../images/Add.png" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ایجاد زیر گروه">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton5" runat="server" CommandArgument='<%# Eval("GrpID").ToString() %>' CommandName="AddSubC" ImageUrl="../images/previous.png" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="clear_1">
        </div>
        <!-- end of row -->
    </div>
    <div class="clear">
    </div>
</asp:Content>
