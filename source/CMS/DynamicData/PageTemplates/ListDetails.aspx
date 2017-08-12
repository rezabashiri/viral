<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master"  MaintainScrollPositionOnPostback="true" AutoEventWireup="true" EnableViewStateMac="false" ValidateRequest="false" CodeBehind="ListDetails.aspx.cs" Inherits="CMS.ListDetails" %>

<%@ Register Src="~/DynamicData/Content/GridViewPager.ascx" TagName="GridViewPager" TagPrefix="asp" %>
<%--<%@ Register src="~/DynamicData/Content/FilterUserControl.ascx" tagname="DynamicFilter" tagprefix="asp" %>--%>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPH" runat="Server">


    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true" />

    <h1 style="float: right"><%= GridDataSource.GetTable().DisplayName %></h1>

    <asp:ScriptManagerProxy runat="server" ID="ScriptManagerProxy1" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>--%>
    <div class="row col-sm-12" style="float: right" dir="rtl">
        <asp:ValidationSummary ID="ValidationSummary1"   runat="server" EnableClientScript="true"
            HeaderText="خطاهای زیر را برطرف نمایید" />
        <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1" Display="None" />


        <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
            <ItemTemplate>
                <div class="row">
                    <div class="col-sm-2 text-right">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>' OnPreRender="Label_PreRender" />
                        </div>
                        <div class="col-sm-6 text-right">
                            <asp:DynamicFilter runat="server" ID="DynamicFilter" OnFilterChanged="DynamicFilter_FilterChanged" />
                          </div>
                    
          </div>
            </ItemTemplate>
        </asp:QueryableFilterRepeater>

    </div>
    <div class="row col-sm-12" style="float: right ;margin-top:5px" dir="rtl">
        <dynamic:DynamicRadGrid ID="GridView1" AllowPaging="true" AllowSorting="True" Width="100%" OnItemInserted="GridView1_ItemInserted" 
            ShowFooter="true" ShowGroupPanel="true" AllowFilteringByColumn="true"
            EnableHeaderContextFilterMenu="false" EnableHeaderContextMenu="true"
            Skin="Web20" AllowAutomaticInserts="true" Height="600px"
            AutoGenerateColumns="false" runat="server" DataSourceID="GridDataSource">
            <ExportSettings ExportOnlyData="true"></ExportSettings>
            <GroupPanel Text="به منظور دسته بندی ستونها را در اینجا رها نمایید"></GroupPanel>
            <GroupingSettings  ShowUnGroupButton="true"></GroupingSettings>
            <PagerStyle Mode="NextPrevAndNumeric" Position="Top"  AlwaysVisible="true" PageSizeControlType="RadDropDownList" />
            <ClientSettings AllowDragToGroup="true">
                <Scrolling FrozenColumnsCount="2" AllowScroll="true" SaveScrollPosition="true" ScrollHeight="120%" />
                <Selecting AllowRowSelect="true" />
               
            </ClientSettings>

            <MasterTableView  UseAllDataFields="true" CommandItemDisplay="Top"      NoMasterRecordsText="اطلاعاتی برای نمایش وجود ندارد">
                <EditFormSettings  EditColumn-InsertText="افزودن" >
                    <EditColumn UpdateText="ویرایش" CancelText="انصراف"></EditColumn>
                    <PopUpSettings ScrollBars="Both"  Modal="true" Width="90%"  />
                </EditFormSettings>

                <CommandItemStyle HorizontalAlign="Right"  VerticalAlign="Middle"   />
                <CommandItemSettings CancelChangesText="انصراف"  RefreshText="بارگذاری مجدد" AddNewRecordText="اضافه نمودن رکورد"  />

          <%--      <NestedViewTemplate>

                    <ef:EntityDataSource ID="GridDetailDataSource" runat="server"
                        EnableDelete="true" EnableUpdate="true" OnSelecting="GridDetailDataSource_Selecting">
                    </ef:EntityDataSource>

                    <dynamic:DynamicRadGrid runat="server" ID="DetailGridView" Skin="Sunset"
                        OnInit="DetailGridView_Init" OnItemCommand="GridDetailDataSource_ItemCommand"
                        AllowFilteringByColumn="true" SelectedItemStyle-BackColor="LightBlue" ShowGroupPanel="true"
                        DataSourceID="GridDetailDataSource" AllowAutomaticUpdates="true" AllowMultiRowSelection="false"
                        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true">
                        <ClientSettings AllowDragToGroup="true">
                            <Scrolling AllowScroll="true" FrozenColumnsCount="2" UseStaticHeaders="false" />
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <PagerStyle Mode="Advanced" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridEditCommandColumn InsertText="افزودن" CancelText="انصراف" EditText="ویرایش" ButtonType="ImageButton" UpdateText="بروز رسانی" />
                                <telerik:GridButtonColumn CommandName="Delete" Text="حذف" ButtonType="ImageButton" ConfirmText="آیا از حذف اطمینان دارید؟" />
                                <telerik:GridButtonColumn CommandName="Select" Text="انتخاب" />
                            </Columns>
                        </MasterTableView>
                    </dynamic:DynamicRadGrid>

                </NestedViewTemplate>--%>
                <Columns >

                    <telerik:GridEditCommandColumn CancelText="انصراف" EditText="ویرایش" ButtonType="ImageButton" UpdateText="بروز رسانی" />
                    <telerik:GridButtonColumn CommandName="Delete" Text="حذف" ButtonType="ImageButton" ConfirmTitle="حذف" ConfirmText="آیا از حذف اطمینان دارید؟" />


                </Columns>
            </MasterTableView>
        </dynamic:DynamicRadGrid>

        <ef:EntityDataSource ID="GridDataSource" AutoGenerateWhereClause="false" OnSelecting="GridDataSource_Selecting" OnInserted="GridDataSource_Inserted" EnableInsert="true" runat="server" EnableDelete="true" EnableUpdate="true">
        </ef:EntityDataSource>
    </div>
    <%--          <asp:Panel ID="DetailsPanel" runat="server">
              <br /><br />

                  <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="DetailsDataSource"
                  AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" AutoGenerateInsertButton="true"
                  OnModeChanging="OnDetailsViewModeChanging" OnPreRender="OnDetailsViewPreRender"
                  OnItemDeleted="OnDetailsViewItemDeleted" OnItemUpdated="OnDetailsViewItemUpdated" OnItemInserted="OnDetailsViewItemInserted">
              </asp:DetailsView>
              
              <ef:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" EnableInsert="true" EnableUpdate="true">
                  <WhereParameters>
                      <asp:DynamicControlParameter ControlID="GridView1" />
                  </WhereParameters>
              </ef:EntityDataSource>

            </asp:Panel>--%>
    <asp:QueryExtender TargetControlID="GridDataSource" ID="GridQueryExtender" runat="server">
        <asp:DynamicFilterExpression ControlID="FilterRepeater" />
    </asp:QueryExtender>
    <%--      </ContentTemplate>
        
    </asp:UpdatePanel>--%>
</asp:Content>
