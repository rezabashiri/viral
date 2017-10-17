<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSelectCampains.ascx.cs" Inherits="Viralme.Controls.UscSelectCampains" ClassName="Viralme.Controls.SelectCampains" %>

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


<div class="modal fade" id="modalDetailCampain">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h3 class="modal-title" style="text-align: center;">
                    <span class="label label-primary">انتخاب پکیج</span></h3>
            </div>
            <div class="modal-body">

                <asp:ListView ID="ListView1" OnPagePropertiesChanging="ListView_showlistofcampain_PagePropertiesChanging" runat="server">
                    <LayoutTemplate>
                        <div id="itemPlaceholder" runat="server"></div>

                    </LayoutTemplate>
                    <ItemTemplate>

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
                                    <asp:Button ID="Button12" runat="server" CssClass="btn btn-info" Text="ملحق شدن به کمپین"></asp:Button>
                                </div>

                            </div>
                        </div>


                    </ItemTemplate>
                </asp:ListView>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
                <button type="button" class="btn btn-success">ذخیره</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<%--for list view 3--%>

<%--<div class="row well CampainBorder">

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

                  70 تا 100 هزار تومان
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-4 no-padding">

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

                 50 تا 100 هزار تومان
                    </p>
                </div>
            </div>
        </div>


        <div class="col-sm-12 col-md-4 no-padding">

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

                50 تا 70 هزار تومان
                    </p>
                </div>
            </div>
        </div>


        <div class="col-sm-12 col-md-4 no-padding">

            <asp:Image ImageUrl="~/images/car.jpg" runat="server" ID="Image7" />
        </div>

        <div class="col-sm-12 col-md-2 Campain-padding-top-button">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="ملحق شدن به کمپین"></asp:Button>
        </div>

    </div>
</div>--%>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU"></script>

<asp:UpdatePanel runat="server" ID="UpdatePnl1" UpdateMode="Conditional">
    <ContentTemplate>

        <script type="text/javascript">

            function myMap(element) {

                var mapProp = {
                    center: new google.maps.LatLng(32.6546, 51.6680),
                    zoom: 15,
                };
                var map = new google.maps.Map(element, mapProp);
            }
        </script>
        <asp:ListView ID="ListView_showlistofcampain" OnPagePropertiesChanging="ListView_showlistofcampain_PagePropertiesChanging" runat="server">
            <LayoutTemplate>
                <div id="itemPlaceholder" runat="server"></div>

            </LayoutTemplate>
            <ItemTemplate>

                <%--for list view 1--%>

                <div class="row well CampainBorder">

                    <div class="col-sm-12 col-md-5 col-md-offset-1 Campain-padding-top-text">

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
                                    70 تا 100 هزار تومان
                                </p>
                            </div>
                        </div>

                    </div>

                    <%--image--%>
                    <div class="col-sm-12 col-md-5 no-padding">

                        <%--map--%>

                        <input type="hidden" id="Json_Statistics" data-json=<%# Eval("Json_Statistics") %> />

                        <div id="googleMap-<%# Eval("ID") %>" class="map-convas" style="width: 100%; height: 200px;"></div>
                        <asp:Literal ID="map" runat="server"></asp:Literal>
                        <script type="text/javascript">
                            myMap(document.getElementById('googleMap-<%# Eval("ID") %>'));
                        </script>
                    </div>

                    <div class="col-sm-12 col-md-1 Campain-padding-top-button">
                        <input type="button" ID="btnCampainSelect" class="btn btn-info" value="انتخاب" onclick="openPackageModel(this);" data-id="<%# Eval("ID") %>" />
                    </div>

                </div>

            </ItemTemplate>
        </asp:ListView>

    </ContentTemplate>
</asp:UpdatePanel>

<!--Pagination Start-->

<div class="text-center">

    <asp:DataPager ID="dataPager" runat="server" PagedControlID="ListView_showlistofcampain" PageSize="3">
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

    function openPackageModel(btn) {

        //alert('salam');
        var id = $(btn).data("id");
        alert(id);

        $('#modalDetailCampain').modal();
    }

    function Deserialize() {

        var Json_Statistics = doc.getElementById('Json_Statistics').value;

        $.ajax({
            type: "post",
            url: "/Viralme/ClientCalls.aspx/DeserializeCampagin",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: "{json:'" + Json_Statistics + "'}",
            success: function (msg) {
                alert('کمپین شما با موفقیت ایجاد شد');
            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);
            }
        });

        $(document).ready(function () {

            Deserialize();

        });
    }

</script>

