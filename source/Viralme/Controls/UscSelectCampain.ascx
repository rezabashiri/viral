<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSelectCampain.ascx.cs" Inherits="Viralme.Controls.UscSelectCampain" %>

    <style>
        .CampainBorder {
            margin: 10px 40px;
        }

        .Campain-padding-top-text {
            padding-top: 37px;
        }

        .Campain-padding-top-button {
            padding-top: 50px;
        }

        .center {
            text-align: center;
        }
    </style>

    <div class="row">
        <div class="col-sm-12 col-md-12 center">
            <h3>انتخاب کمپین
            </h3>
        </div>
    </div>


    <%--for list view 2--%>

    <div class="row well CampainBorder">

        <div class="row">
            <div class="col-sm-12 col-md-4 col-md-offset-1 Campain-padding-top-text">

                <div class="row">

                    <div class="col-sm-12 col-md-6">

                        <label>
                            نام تبلیغ دهنده:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                   شرکت پگاه
                        </p>
                    </div>

                </div>
                <div class="row">

                    <div class="col-sm-12 col-md-6">
                        <label>
                            مدت زمان:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                   سه ماه
                        </p>
                    </div>
                </div>

                <div class="row">

                    <div class="col-sm-12 col-md-6">

                        <label>
                            حداکثر مسافت در روز:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                  100 کیلومتر
                        </p>
                    </div>

                </div>
                <div class="row">

                    <div class="col-sm-12 col-md-6">
                        <label>
                            میزان درامد روزانه:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
70 تا 100 هزار تومان
                        </p>
                    </div>
                </div>
            </div>

            <%--image--%>
            <div class="col-sm-12 col-md-5 no-padding">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image5" />
            </div>

            <div class="col-sm-12 col-md-1 Campain-padding-top-button">
                <asp:Button ID="Button4" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
            </div>

        </div>

        <div class="row">

            <div class="col-md-12 col-md-12">
                <%--map--%>
                <div id="googleMap" style="width: 100%; height: 200px;"></div>
            </div>

        </div>

    </div>



    <%--for list view 3--%>

    <div class="row well CampainBorder">

        <div class="row">

            <div class="col-sm-12 col-md-4 col-md-offset-1 Campain-padding-top-text">

                <div class="row">

                    <div class="col-sm-12 col-md-6">

                        <label>
                            نوع کمپین:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                   تم
                        </p>
                    </div>

                </div>
                <div class="row">

                    <div class="col-sm-12 col-md-6">
                        <label>
                            میزان درامد روزانه: 
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                  70 تا 100 هزار تومان
                        </p>
                    </div>
                </div>
            </div>

            <%--image--%>
            <div class="col-sm-12 col-md-4 no-padding">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image1" />
            </div>

            <div class="col-sm-12 col-md-2 Campain-padding-top-button">
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-info" Text="ملحق شدن به کمپین"></asp:Button>
            </div>

        </div>

        <div class="row">

            <div class="col-sm-12 col-md-4 col-md-offset-1 Campain-padding-top-text">

                <div class="row">

                    <div class="col-sm-12 col-md-6">

                        <label>
                            نوع کمپین:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                   نیمه خودرو
                        </p>
                    </div>

                </div>
                <div class="row">

                    <div class="col-sm-12 col-md-6">
                        <label>
                            میزان درامد روزانه: 
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                 50 تا 100 هزار تومان
                        </p>
                    </div>
                </div>
            </div>

            <%--image--%>
            <div class="col-sm-12 col-md-4 no-padding">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image6" />
            </div>

            <div class="col-sm-12 col-md-2 Campain-padding-top-button">
                <asp:Button ID="Button6" runat="server" CssClass="btn btn-info" Text="ملحق شدن به کمپین"></asp:Button>
            </div>

        </div>

        <div class="row">

            <div class="col-sm-12 col-md-4 col-md-offset-1 Campain-padding-top-text">

                <div class="row">

                    <div class="col-sm-12 col-md-6">

                        <label>
                            نوع کمپین:
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                   باکس
                        </p>
                    </div>

                </div>
                <div class="row">

                    <div class="col-sm-12 col-md-6">
                        <label>
                            میزان درامد روزانه: 
                        </label>
                    </div>

                    <div class="col-sm-12 col-md-6">
                        <p>
                            <%-- read from DB --%>
                50 تا 70 هزار تومان
                        </p>
                    </div>
                </div>
            </div>

            <%--image--%>
            <div class="col-sm-12 col-md-4 no-padding">
                <%-- read from DB --%>
                <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image7" />
            </div>

            <div class="col-sm-12 col-md-2 Campain-padding-top-button">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="ملحق شدن به کمپین"></asp:Button>
            </div>

        </div>
    </div>


    <ul>
        <asp:ListView ID="ListView_showlistofcampain" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" runat="server">
            <LayoutTemplate>
                <div id="itemPlaceholder" runat="server"></div>

            </LayoutTemplate>
            <ItemTemplate>

                <%--for list view 1--%>

                <div class="row well CampainBorder">

                    <div class="col-sm-12 col-md-4 col-md-offset-1 Campain-padding-top-text">

                        <div class="row">

                            <div class="col-sm-12 col-md-6">

                                <label>
                                    نام تبلیغ دهنده:
                                </label>
                            </div>

                            <div class="col-sm-12 col-md-6">
                                <p>
                                    <%-- read from DB --%>
                                    <%--شرکت پگاه--%>
                                    <%# Eval("Name") %>
                                </p>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-sm-12 col-md-6">
                                <label>
                                    تاریخ شروع:
                                </label>
                            </div>

                            <div class="col-sm-12 col-md-6">
                                <p>
                                    <%-- read from DB --%>
                                    <%# Eval("StartDate") %>
                                </p>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-12 col-md-6">
                                <label>
                                    تاریخ پایان:
                                </label>
                            </div>

                            <div class="col-sm-12 col-md-6">
                                <p>
                                    <%-- read from DB --%>
                                    <%# Eval("EndDate") %>
                                </p>
                            </div>
                        </div>
                    </div>

                    <%--image--%>
                    <div class="col-sm-12 col-md-5 no-padding">
                        <%-- read from DB --%>
                        <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="img" />
                    </div>

                    <div class="col-sm-12 col-md-1 Campain-padding-top-button">
                        <asp:Button ID="btnCampainSelect" runat="server" CssClass="btn btn-info" Text="انتخاب"></asp:Button>
                    </div>

                </div>

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
    </div>

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


