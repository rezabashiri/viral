<%@ Page Title="بخشهای سیستم" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="ItemsPart.aspx.cs" Inherits="CMS.panel.ItemsPart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">
    <div class="confirmMSG">
        <asp:Label ID="lblOK" runat="server"></asp:Label>
    </div>
          <div class="row"   >
            <div class="col-sm-3 text-left">
            نام بخش   
            </div>
            <div class="col-sm-8 text-right">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"  ></asp:TextBox>
            </div>
              <div>
                  <asp:RequiredFieldValidator Text="*" ValidationGroup="a" ErrorMessage="نام بخش را وارد نمایید" runat="server" ControlToValidate="txtName"></asp:RequiredFieldValidator>
              </div>
        </div>
 
        <!-- end of row -->
        <div class="row text-center">
          
            <asp:Button ID="btnOk" runat="server" Text="ثبت" ValidationGroup="a" CssClass="btn btn-primary" OnClick="btnOk_Click" />
              <asp:ValidationSummary runat="server" ID="valSummary"  />
        </div>
        <div class="row">
            <asp:GridView ID="GridView1" DataKeyNames="PartID"   runat="server" DataSourceID="partSource" AutoGenerateColumns="False" CssClass="MyGrid"
                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                
                <Columns>
                          <asp:TemplateField HeaderText="حذف" >
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnDel" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("PartID").ToString() %>'
                                CommandName="Delete" ImageUrl="../images/delete.png" OnClientClick="return confirm('آیا از حذف اطمینان دارید؟');" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="ویرایش">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" CssClass="btn btn-success" runat="server"  
                                CommandName="Edit" ImageUrl="../images/Edit.png" CausesValidation="False" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button CssClass="btn btn-success" Text="بروز رسانی" CommandName="Update" runat="server" ID="btnUpdate" />
                            <asp:Button CssClass="btn btn-danger" Text="کنسل" CommandName="Cancel" runat="server" ID="Button1" />

                        </EditItemTemplate>
                    </asp:TemplateField>
              
                    <asp:BoundField HeaderText="عنوان بخش" DataField="PartName" />
             
                    </Columns>
                </asp:GridView>
            <asp:SqlDataSource OnInit="partSource_Init"   SelectCommandType="Text" DeleteCommand="delete TParts where PartID=@PartID" UpdateCommand="update TParts set PartName=@PartName where PartID=@PartID" SelectCommand="select * from TParts" ProviderName="System.Data.SqlClient" ID="partSource" runat="server"></asp:SqlDataSource>
            </div>
</asp:Content>
