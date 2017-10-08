<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="SelectCampain.aspx.cs" Inherits="CMS.Viralme.Driver.SelectCampain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">


    <style>
        body {
            direction: rtl;
        }


        .CampainRow {
            padding: 0 35px 0 0;
        }

            .CampainRow div {
                /*float: right;*/
            }

        .CampainBorder {
            border: 2px groove black;
            margin: 10px 40px;
        }

        .CampainImage {
            padding-left: 220px;
        }

        .CampainText {
            padding: 33px 0 0 0;
        }

        .center {
            text-align: center;
        }

        .CampainText .row2 {
            /*line-height: 33px;*/
            margin-top: 10px;
        }

        .CampainText .buttonRow3 {
            margin: 5px 0px 10px -55px;
        }

        #listview2Button {
            margin: 14px 0px 10px -193px;
        }
    </style>

    <div class="row">
        <div class="col-sm-12 col-md-12 center">
            <h3>انتخاب کمپین
            </h3>
        </div>
    </div>

    <%--for list view 1--%>

    <div class="CampainRow row">

        <div class="col-sm-11 col-md-11 CampainBorder">

            <div class="col-sm-12 col-md-4 CampainImage">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="img" />
            </div>

            <div class="col-sm-12 col-md-5 CampainText">


                <div class="col-md-9">

                    <div class="col-sm-12 col-md-4">
                        <p>
                            <%-- read from DB --%>
                   شرکت پگاه
                        </p>
                    </div>
                    <div class="col-sm-12 col-md-4">

                        <label>
                            نام تبلیغ دهنده:
                        </label>
                    </div>

                    <br />

                    <div class="col-sm-12 col-md-4 row2">
                        <p>
                            <%-- read from DB --%>
                   سه ماه
                        </p>
                    </div>

                    <div class="col-sm-12 col-md-4 row2">
                        <label>
                            مدت زمان:
                        </label>
                    </div>

                </div>

                <br />

                <div class="col-sm-12 col-md-7 buttonRow3">
                    <asp:Button ID="btnCampainSelect" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
                </div>
            </div>
        </div>
    </div>





    <%--for list view 2--%>

    <div class="CampainRow row">

        <div class="col-sm-11 col-md-11 CampainBorder">

            <div class="row">


                <div class="col-sm-12 col-md-4 CampainImage">
                    <%-- read from DB --%>
                    <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image1" />
                </div>


                <div class="col-sm-12 col-md-5 CampainText">

                    <div class="col-sm-12 col-md-4">
                        <p>
                            <%-- read from DB --%>
                   شرکت پگاه
                        </p>
                    </div>
                    <div class="col-sm-12 col-md-4">

                        <label>
                            نام تبلیغ دهنده:
                        </label>
                    </div>

                    <br />

                    <div class="col-sm-12 col-md-4 row2">
                        <p>
                            <%-- read from DB --%>
                   سه ماه
                        </p>
                    </div>

                    <div class="col-sm-12 col-md-4 row2">
                        <label>
                            مدت زمان:
                        </label>
                    </div>

                    <br />

                    <div class="col-sm-12 col-md-4 row2">
                        <p>
                            <%-- read from DB --%>
                   50 کیلومتر
                        </p>
                    </div>

                    <div class="col-sm-12 col-md-4 row2">
                        <label>
                            حداکثر مسافت:
                        </label>
                    </div>


                    <br />

                    <div class="col-sm-12 col-md-4 row2">
                        <p>
                            <%-- read from DB --%>
                  70 تا 100 هزار تومان
                        </p>
                    </div>

                    <div class="col-sm-12 col-md-4 row2">
                        <label>
                            میزان درامد روزانه:
                        </label>
                    </div>

                </div>
            </div>


            <div class="row">

                <div class="col-md-12 col-md-6">
                    <%--map--%>


                    <div id="googleMap" style="width: 100%; height: 200px;"></div>
                </div>

                <div id="listview2Button" class="col-sm-12 col-md-5">
                    <asp:Button ID="btn" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
                </div>
            </div>

        </div>
    </div>



    <%--for list view 3--%>

    <div class="CampainRow row">

        <div class="col-sm-11 col-md-11 CampainBorder">

            <div class="col-sm-12 col-md-4 CampainImage">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image2" />
            </div>

            <div class="col-sm-12 col-md-5 CampainText">

                <%-- تم --%>
                <div class="col-sm-12 col-md-4">
                    <p>
                        <%-- read from DB --%>
                 تم
                    </p>
                </div>
                <div class="col-sm-12 col-md-4">

                    <label>
                        نوع کمپین
                    </label>
                </div>

                <div class="col-sm-12 col-md-4">
                    <p>
                        <%-- read from DB --%>
                   70 تا 100 هزار تومان
                    </p>
                </div>
                <div class="col-sm-12 col-md-4">

                    <label>
                        میزان درامد روزانه
                    </label>
                </div>

                <br />

                <div class="col-sm-12 col-md-7 buttonRow3">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
                </div>
            </div>


            <div class="col-sm-12 col-md-4 CampainImage">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image3" />
            </div>

            <div class="col-sm-12 col-md-5 CampainText">

                <div class="col-sm-12 col-md-4">
                    <p>
                        <%-- read from DB --%>
                 نیمه خودرو
                    </p>
                </div>
                <div class="col-sm-12 col-md-4">

                    <label>
                        نوع کمپین
                    </label>
                </div>

                <div class="col-sm-12 col-md-4">
                    <p>
                        <%-- read from DB --%>
                  50 تا 70 هزار تومان
                    </p>
                </div>
                <div class="col-sm-12 col-md-4">

                    <label>
                        میزان درامد روزانه
                    </label>
                </div>

                <br />

                <div class="col-sm-12 col-md-7 buttonRow3">
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
                </div>
            </div>


            <div class="col-sm-12 col-md-4 CampainImage">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image4" />
            </div>

            <div class="col-sm-12 col-md-5 CampainText">

                <div class="col-sm-12 col-md-4">
                    <p>
                        <%-- read from DB --%>
                 باکس
                    </p>
                </div>
                <div class="col-sm-12 col-md-4">

                    <label>
                        نوع کمپین
                    </label>
                </div>

                <div class="col-sm-12 col-md-4">
                    <p>
                        <%-- read from DB --%>
                   30 تا 50 هزار تومان
                    </p>
                </div>
                <div class="col-sm-12 col-md-4">

                    <label>
                        میزان درامد روزانه
                    </label>
                </div>

                <br />

                <div class="col-sm-12 col-md-7 buttonRow3">
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
                </div>
            </div>


        </div>
    </div>











    <asp:ListView ID="ProductsListView"
        runat="server">
        <LayoutTemplate>
            <table cellpadding="2" width="640px" runat="server" id="tblProducts">
                <tr runat="server" class="header">
                    <th runat="server" colspan="3">PRODUCTS LIST</th>
                </tr>
                <tr runat="server" id="groupPlaceholder" />
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr runat="server" id="ProductsRow">
                <td runat="server" id="itemPlaceholder" />
            </tr>
        </GroupTemplate>
        <GroupSeparatorTemplate>
            <tr runat="server">
                <td colspan="3">
                    <hr />
                </td>
            </tr>
        </GroupSeparatorTemplate>
        <ItemTemplate>
            <td align="center" style="width: 300px" runat="server">

                <b>Price:</b>
            </td>
        </ItemTemplate>
        <ItemSeparatorTemplate>
            <td class="separator" runat="server">&nbsp;</td>
        </ItemSeparatorTemplate>
    </asp:ListView>
    <br />

    <asp:DataPager runat="server" ID="ProductsDataPager"
        PagedControlID="ProductsListView">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button"
                ShowFirstPageButton="true"
                ShowNextPageButton="false"
                ShowPreviousPageButton="false" />
            <asp:NumericPagerField ButtonCount="10" />
            <asp:NextPreviousPagerField ButtonType="Button"
                ShowLastPageButton="true"
                ShowNextPageButton="false"
                ShowPreviousPageButton="false" />
        </Fields>
    </asp:DataPager>

    <ul>
        <asp:ListView ID="ListView1" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" runat="server">
            <LayoutTemplate>
                <div id="itemPlaceholder" runat="server"></div>

            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <%--            <asp:HyperLink NavigateUrl='<%# CreateLink(Eval("ID")) %>' ID="hpr" runat="server">


                        <div class="sermon-box">
                            <div class="frame">
                                <asp:Image ImageUrl='<%# DataBinder.Eval( Container.DataItem,"VirtualAddress") %>' ID="imgShahid" runat="server" alt="img"></asp:Image></div>
                            <div class="text-box">
                                <h2><%#  DataBinder.Eval(Container.DataItem, "Name") %>&nbsp<%# DataBinder.Eval( Container.DataItem, "Family")  %></h2>
                                <div class="detail-row">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-map-pin"></i>متولد: <%#  DataBinder.Eval(Container.DataItem, "NameShahrestan") %></a></li>
                                        <li><a href="#"><i class="fa fa-calendar"></i>تاریخ تولد: <%# MyClass.GetFarsiDate(Eval("TarikheTavalod")) %></a></li>
                                        <li><a href="#"><i class="fa fa-map-marker"></i>شغل: <%#  DataBinder.Eval(Container.DataItem, "Shoghl") %></a></li>
                                        <li><a href="#"><i class="fa fa-tint"></i>تاریخ شهادت: <%# MyClass.GetFarsiDate(Eval("TarikheShahadat")) %></a></li>
                                    </ul>
                                </div>
                                <asp:HyperLink NavigateUrl='<%# CreateLink(Eval("ID")) %>' ID="HyperLink1" runat="server" CssClass="readmore">بیشتر بدانید</asp:HyperLink>
                            </div>
                        </div>
                    </asp:HyperLink>--%>
                    
                </li>
            </ItemTemplate>
        </asp:ListView>
    </ul>
    <!--Pagination Start-->
    <div class="pagination-all pagination text-center">

        <asp:DataPager ID="dataPager" runat="server" PagedControlID="ListView1">
            <Fields>
                <asp:NextPreviousPagerField PreviousPageText="قبلی" ButtonType="Button" FirstPageText="اولین" ShowPreviousPageButton="true"
                    ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false"
                    ButtonCssClass="btn btn-info fa-angle-left" RenderDisabledButtonsAsLabels="false" />
                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-danger disabled" RenderNonBreakingSpacesBetweenControls="false"
                    NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                <asp:NextPreviousPagerField NextPageText="بعدی" LastPageText="آخرین" ShowNextPageButton="true"
                    ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                    ButtonCssClass="btn btn-info" RenderDisabledButtonsAsLabels="false" />
            </Fields>

        </asp:DataPager>


        <script>
            function myMap() {
                var mapProp = {
                    center: new google.maps.LatLng(32.6546, 51.6680),
                    zoom: 15,
                };
                var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            }
        </script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU&callback=myMap"></script>
</asp:Content>


