<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentMgr.aspx.cs" Inherits="CMS.panel.CommentMgr" MasterPageFile="~/MasterPages/MgrMaster.Master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="TitleContentPH">
                    <div id="roadmap">
                </div>
                <div class="clear">
    </div>
    <div class="confirmMSG" id="confirmDiv" visible="false" runat="server">
        <asp:Label ID="lblOk" runat="server"></asp:Label></div>
    <div class="clearFloat">
    </div>
    <div class="errorMSG" id="errorDiv" runat="server" visible="false">
        <asp:Label ID="lblError" runat="server"></asp:Label></div>
    <div id="title_bar">
        <h1></h1>
        <span></span>
    </div>
                <div id="main_content">
            <div class="first_row color1">
                جستجوی دیدگاه</div>
            <div class="row heigh_30">
                <div class="Rcolumn">
                    شماره مطلب:
                </div>
                <div class="Lcolumn">
                    <asp:TextBox ID="txtId" runat="server" CssClass="Mytxt persian"></asp:TextBox>
                </div>
            </div>

              <div class="row heigh_30">
                <div class="Rcolumn">
                    وضعیت دیدگاه:
                </div>
                <div class="Lcolumn">
                    <asp:DropDownList ID="drpStat" runat="server" CssClass="Mydrp persian">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="last_row">
                <asp:Button ID="btnSearch" runat="server" Text="جستجو" CssClass="Mybtn" OnClick="btnSearch_Click" />
            </div>
            <div class="clear_1">
            </div>
            <!-- end of row -->
                    <div class="first_row color1">
                لیست دیدگاه</div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <div class="rowWraper1" style="width:80%;margin:0 auto;">
                        <div class="row borderbot2" style="padding:10px 0 15px 5px;">
                           تعداد یافت شده:&nbsp;&nbsp; <asp:Label ID="lblCountCmt" runat="server" Font-Size="Large" ></asp:Label>
                        <asp:LinkButton ID="lnkbtnAll" runat="server" OnClick="lnkbtnAll_Click" CssClass="mylnkbtn left" >انتخاب همه</asp:LinkButton>
                        <asp:LinkButton ID="lnkbtnNone" runat="server" OnClick="lnkbtnNone_Click" CssClass="mylnkbtn left">هیچکدام</asp:LinkButton></div>
                        <asp:ListView ID="lstVCmt" runat="server" OnItemEditing="lstVCmt_ItemEditing" OnItemUpdating="lstVCmt_ItemUpdating" OnItemCanceling="lstVCmt_ItemCanceling" OnItemDataBound="lstVCmt_ItemDataBound" OnItemDeleting="lstVCmt_ItemDeleting">
                            <ItemTemplate>
                        <div class="row heigh_30 borderbot1">
                        <div class="Rcolumn">عنوان مطلب:</div>
                        <div class="Lcolumn padTop7"><%# DataBinder.Eval(Container.DataItem, "ItemTopic") %>
                            <asp:CheckBox ID="chkselect" runat="server" CssClass="left"/>
                        </div>
                    </div><div class="clear"></div>
                        <div class="row height_auto">
                        <div class="Rcolumn">متن دیدگاه:</div>
                        <div class="Lcolumn padTop7"><asp:Label ID="lblCmtID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CmtID") %>'></asp:Label> - 
                            <%# DataBinder.Eval(Container.DataItem, "CmtTxt") %></div>
                    </div><div class="clear"></div>
                        <div class="row heigh_30 borderbot1 bordertop1">
                        <div class="Rcolumn">نام نویسنده:</div>
                        <div class="Rcolumn"><%# DataBinder.Eval(Container.DataItem, "WrittenBy") %></div>
                        <div class="Rcolumn">ایمیل نویسنده:</div>
                        <div class="Rcolumn"><%# DataBinder.Eval(Container.DataItem, "WriterEmail") %></div>
                    </div><div class="clear"></div>
                        <div class="row heigh_30 borderbot1">
                        <div class="Rcolumn">تاریخ و زمان:</div>
                        <div class="Rcolumn"><%# MyClass.GetFarsiDate(Eval("CmtDate")) %> ساعت <%# DataBinder.Eval(Container.DataItem, "time") %></div>
                        <div class="Rcolumn">وضعیت:</div>
                        <div class="Rcolumn"><%# DataBinder.Eval(Container.DataItem, "StatName") %></div>
                    </div><div class="clear"></div>
                        <div class="last_row borderbot2" style="text-align:left">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            <asp:Button ID="btbEditCmt" runat="server" Text="ویرایش" CssClass="Mybtn2" CommandName="Edit" />
                            <asp:Button ID="btnDelCmt" runat="server" Text="حذف" CssClass="Mybtn2" CommandName="Delete" /></div>
                                <div class="clear"></div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                         <div class="row heigh_30 borderbot1">
                        <div class="Rcolumn">عنوان مطلب:</div>
                        <div class="Lcolumn padTop7"><%# DataBinder.Eval(Container.DataItem, "ItemTopic") %>
                            <asp:CheckBox ID="chkselect" runat="server" CssClass="left"/>
                        </div>
                    </div><div class="clear"></div>
                        <div class="row height_auto">
                        <div class="Rcolumn">متن دیدگاه:</div>
                        <div class="Lcolumn padTop7"><asp:Label ID="lblCmtID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CmtID") %>'></asp:Label> - 
                          <asp:TextBox ID="txtComment" runat="server" CssClass="Mytxt" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "CmtTxt") %>'></asp:TextBox></div>
                    </div><div class="clear"></div>
                        <div class="row height_auto borderbot1">
                        <div class="Rcolumn">نام نویسنده:</div>
                        <div class="Rcolumn">
                            <asp:TextBox ID="txtWriter" runat="server" CssClass="Mytxt" Text='<%# DataBinder.Eval(Container.DataItem, "WrittenBy") %>'></asp:TextBox></div>
                        <div class="Rcolumn">ایمیل نویسنده:</div>
                        <div class="Rcolumn">
                            <asp:TextBox ID="txtEmailWriter" runat="server"  CssClass="Mytxt" Text='<%# DataBinder.Eval(Container.DataItem, "WriterEmail") %>'></asp:TextBox></div>
                    </div><div class="clear"></div>
                        <div class="row heigh_30 borderbot1">
                        <div class="Rcolumn">تاریخ و زمان:</div>
                        <div class="Rcolumn"><%# MyClass.GetFarsiDate(Eval("CmtDate")) %> ساعت <%# DataBinder.Eval(Container.DataItem, "time") %></div>
                        <div class="Rcolumn">وضعیت:</div>
                        <div class="Rcolumn"><%# DataBinder.Eval(Container.DataItem, "StatName") %></div>
                    </div><div class="clear"></div>
                        <div class="last_row borderbot2" style="text-align:left">
                            <asp:Button ID="btnUpdateCmt" runat="server" Text="به روز رسانی" CssClass="Mybtn2" CommandName="Update" />
                            <asp:Button ID="btnCancel" runat="server" Text="انصراف" CssClass="Mybtn2" CommandName="Cancel" /></div>
                                <div class="clear"></div>
                            </EditItemTemplate>
                        </asp:ListView>
                    </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                      <div class="last_row" style="text-align:left">
                          <asp:Button ID="btnConfirm" runat="server" Text="تائید" CssClass="Mybtn3" OnClick="btnConfirm_Click" />
                          <asp:Button ID="btnReject" runat="server" Text="عدم تائید" CssClass="Mybtn" OnClick="btnReject_Click" />
                          </div>
                </div>
</asp:Content>

