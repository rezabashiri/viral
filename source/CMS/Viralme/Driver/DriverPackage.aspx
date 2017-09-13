<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="DriverPackage.aspx.cs" Inherits="CMS.Viralme.Driver.DriverPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link href="../../Design/js/jsgrid-1.5.3/jsgrid.min.css" rel="stylesheet" />
    <link href="../../Design/js/jsgrid-1.5.3/jsgrid-theme.min.css" rel="stylesheet" />

    <style>
        article > div {
            margin: 0 0 10px 0 !important;
        }

        .jarviswidget header {
            margin: 0;
        }

        .jarviswidget > header > .widget-icon {
            float: right;
            padding-right: 10px;
        }

        .jarviswidget > header > h2 {
            float: right !important;
        }

        .smart-form .col {
            text-align: right;
            float: right;
            line-height: 30px;
        }

        #divloadMap {
            height: 400px;
            width: 800px;
            margin: 0px;
            padding: 0px;
        }

        .apply {
            margin-top: 16px;
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        #txtsearch {
            background-color: #fff;
            padding: 0 11px 0 13px;
            width: 400px;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            text-overflow: ellipsis;
            direction: rtl;
            text-align: right;
            left: 200px !important;
        }

            #txtsearch:focus {
                border-color: #4d90fe;
                margin-left: -1px;
                padding-left: 14px;
                width: 401px;
            }

        .pac-container {
            font-family: Roboto;
        }

        #type-selector {
            color: #fff;
            background-color: #4d90fe;
            padding: 5px 11px 0px 11px;
        }

            #type-selector label {
                font-family: Roboto;
                font-size: 13px;
                font-weight: 300;
            }

        #area {
            display: none;
        }

        #areakm {
            direction: ltr;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">

    <div class="row">
        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
            <h1 class="page-title txt-color-blueDark">

                <i class="fa-fw fa fa-pencil-square-o"></i>
                تعیین نوع خودرو و پکیج تبلیغات
            </h1>
        </div>
    </div>


    <section id="widget-grid">


        <div class="row no-margin">

            <article class="col-sm-12 col-md-12 col-lg-10">


                <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false" data-widget-sortable="false">

                    <header>
                        <span class="widget-icon"><i class="fa fa-edit"></i></span>
                        <h2>فرم تعیین نوع خودرو </h2>

                    </header>

                    <div>

                        <div class="jarviswidget-editbox ">
                        </div>

                        <div class="widget-body no-padding no-margin">

                            <fieldset>
                                <div class="row">
                                    <section class="col col-1 no-margin" style="padding: 0 10px 0 0;">
                                        <label>
                                            نوع خودرو
                                        </label>
                                    </section>
                                    <section class="col col-5">
                                        <label class="input">
                                            <i class="icon-prepend fa fa-car"></i>
                                            <asp:TextBox ID="txtCarType" placeholder="نوع خودرو" CssClass="comment-input form-control" runat="server"></asp:TextBox>
                                        </label>
                                    </section>
                                </div>

                            </fieldset>

                            <fieldset>

                                <div class="row">
                                    <section class="col col-1">
                                        <label>
                                            پکیج
                                        </label>
                                    </section>

                                    <section class="col col-5">
                                        <label class="select">
                                            <asp:DropDownList ID="cmbPackage" CssClass="form-control" AutoPostBack="true" runat="server">
                                                <asp:ListItem Text="انتخاب کنید" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </label>
                                    </section>

                                    <section class="col col-5">
                                        <label class="input">
                                            <i class="icon-prepend fa fa-usd"></i>
                                            <asp:TextBox ID="txtPricePackage" placeholder="قیمت پکیج پیشنهادی " CssClass="comment-input form-control" runat="server"></asp:TextBox>
                                        </label>
                                    </section>
                                    <section class="col col-1">
                                        <a href="#"><span class="btn btn-lg glyphicon glyphicon-plus-sign no-padding no-margin"></span></a>
                                    </section>
                                </div>

                                <div class="row">
                                    <section class="col col-12">
                                        <asp:GridView runat="server" ID="gridShowPrice">
                                        </asp:GridView>
                                    </section>
                                </div>

                            </fieldset>

                            <footer>
                                <button type="submit" class="btn btn-primary">
                                    ذخیره
                                </button>
                            </footer>
                        </div>
                        <!-- end widget content -->

                    </div>
                    <!-- end widget div -->

                </div>
                <%-- </article>

            <article class="col-sm-12 col-md-12 col-lg-10">--%>

                <!-- Widget ID (each widget will need unique ID)-->
                <div class="jarviswidget" id="wid-id-2" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false" data-widget-sortable="false">

                    <header>
                        <span class="widget-icon"><i class="fa fa-edit"></i></span>
                        <h2>فرم تعیین ناحیه </h2>

                    </header>

                    <div>

                        <div class="jarviswidget-editbox">
                        </div>

                        <div class="widget-body no-padding no-margin">

                            <fieldset>
                                <div class="row">
                                    <section class="col col-12">
                                        <label>
                                            مکان های مورد نظر را در نقشه انتخاب کنید
                                        </label>
                                    </section>
                                </div>

                                <div class="row">

                                    <section class="col col-12">

                                        <%--  <input id="txtsearch" class="apply" type="text" placeholder="لطفا مکان مورد نظر خود را وارد نمائید" autocomplete="on" />
                                        <div id="divloadMap"></div>--%>

                                        <div id="map_canvas" style="width: 800px; height: 350px"></div>
                                    </section>

                                </div>


                                <div class="row">
                                    <section class="col col-5">
                                        <label>
                                            مساحت ناحیه انتخاب شده 
                                        </label>
                                    </section>
                                    <section class="col col-4">

                                        <div id="area">0 m&sup2;</div>
                                        <div id="areakm">0 km&sup2;</div>
                                    </section>
                                </div>

                                <div class="row">

                                    <section class="col col-3">
                                        <label>
                                            گزینه های انتخابی 
                                        </label>
                                    </section>

                                    <section class="col col-2">
                                        <input type="button" value="حذف اخرین نقطه" onclick="DeleteLastPoint();" class="btn btn-info" />
                                    </section>

                                    <section class="col col-2">
                                        <input type="button" value="حذف تمامی نقاط" onclick="ClearAllPoints();" class="btn btn-danger" />
                                    </section>
                                </div>

                            </fieldset>

                            <fieldset>


                                <div class="row">
                                    <section class="col col-2">
                                        <label>
                                            زمان رانندگی
                                        </label>
                                    </section>

                                    <section class="col col-2">
                                        <label class="select">
                                            <select id="select_drivingTime">
                                                <option value="صبح">صبح</option>
                                                <option value="ظهر">ظهر</option>
                                                <option value="عصر">عصر</option>
                                                <option value="شب">شب</option>
                                                <option value="نیمه هشب">نیمه شب</option>
                                            </select>
                                        </label>
                                    </section>


                                    <section class="col col-1">
                                        <span onclick="insertintoAreaJSGrid();" class="btn btn-lg glyphicon glyphicon-plus-sign no-padding no-margin"></span>
                                    </section>
                                </div>

                                <div class="row">
                                    <section class="col col-12">

                                        <%--div for grid--%>
                                        <div id="jsAreaGrid"></div>

                                    </section>
                                </div>
                            </fieldset>



                            <footer>
                                <button type="button" class="btn btn-primary" onclick="saveIntoAreaJSGrid();">
                                    تعیین ناحیه
                                </button>
                            </footer>

                        </div>
                        <!-- end widget content -->

                    </div>
                    <!-- end widget div -->
                </div>

            </article>
        </div>

    </section>




    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4TupoqAxEOde_5OuBLLgdWmyPP10nSSU&v=3.exp&libraries=places"></script>
    <script src="../../Design/js/sandbox-google-maps-marker-lasso-search-tool.js"></script>
    <script> initialize();</script>



    <script src="../../Design/js/jsgrid-1.5.3/jsgrid.min.js"></script>


    <script>

        //    var clients = [
        //    { "Name": "Otto Clay", "Age": 25, "Country": 1, "Address": "Ap #897-1459 Quam Avenue", "Married": false },
        //    { "Name": "Connor Johnston", "Age": 45, "Country": 2, "Address": "Ap #370-4647 Dis Av.", "Married": true },
        //    { "Name": "Lacey Hess", "Age": 29, "Country": 3, "Address": "Ap #365-8835 Integer St.", "Married": false },
        //    { "Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true },
        //    { "Name": "Ramona Benton", "Age": 32, "Country": 3 },
        //    { "Name": "مقداد", "Age": 30, "Country": 4, "Address": "شهرک ولیعصر", "Married": false }
        //];

        //var countries = [
        //    { Name: "", Id: 0 },
        //    { Name: "United States", Id: 1 },
        //    { Name: "Canada", Id: 2 },
        //    { Name: "United Kingdom", Id: 3 },
        //    { Name: "Iran", Id: 4 }
        //];

        var clients = [
             //{ id: "0", drivingTime: "ss", drivingArea: [] }
        ];



        $("#jsAreaGrid").jsGrid({
            width: "100%",
            height: "400px",


            editing: false,
            sorting: true,
            paging: true,


            deleteConfirm: function () {
                return "آیا از حذف اطمینان دارید؟ ";
            },


            //data: clients,
            controller:
            {
                loadData: function (filter) {
                    return clients;
                }
            },

            fields: [
                { name: "drivingTime", type: "text", title: "زمان رانندگی", width: 200, align: "center" },
                //{ name: "drivingArea", type: "text", title: "ناحیه انتخابی", width: 150, align: "center", validate: "required" },
                { type: "control", editButton: false }
            ]
        });


        var i = 0;
        var area;

        function insertintoAreaJSGrid() {
            var e = document.getElementById("select_drivingTime");
            var selected_drivingTime = e.options[e.selectedIndex].value;
      
            //$("#jsAreaGrid").jsGrid("insertItem", { drivingTime: String(selected_drivingTime), drivingArea: 25 }).done(function () {
            //    alert(routeMarkers[0].position.lat());
            //});

            i++;
            var positions_area = [];


            for (var j = 0; j < routeMarkers.length; j++) {
                positions_area.push(routeMarkers[j].position.lat(), routeMarkers[j].position.lng());
            }

            clients.push(
                { id: i, drivingTime: String(selected_drivingTime), drivingArea: routeMarkers }
            );

            $("#jsAreaGrid").jsGrid("loadData");

            ClearAllPoints();
        }


        function saveIntoAreaJSGrid() {
        }


    </script>




    <%--  <script type="text/javascript">



        //creating function to load initial MAP when page loading 
        function LoadGoogleMAP() {

            var markers = [];
            var map = new google.maps.Map(document.getElementById('divloadMap'), {
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            var defaultBounds = new google.maps.LatLngBounds(
              new google.maps.LatLng(-33.8902, 151.1759),
              new google.maps.LatLng(-33.8474, 151.2631));
            map.fitBounds(defaultBounds);

            // Create the search box and link it to the UI element.
            var input = (document.getElementById('txtsearch'));
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

            var searchBox = new google.maps.places.SearchBox((input));


            // Listen for the event fired when the user selects an item from the
            // pick list. Retrieve the matching places for that item.
            google.maps.event.addListener(searchBox, 'places_changed', function () {
                var places = searchBox.getPlaces();

                if (places.length == 0) {
                    return;
                }
                for (var i = 0, marker; marker = markers[i]; i++) {
                    marker.setMap(null);
                }

                // For each place, get the icon, place name, and location.
                markers = [];
                var bounds = new google.maps.LatLngBounds();
                for (var i = 0, place; place = places[i]; i++) {
                    var image = {
                        url: place.icon,
                        size: new google.maps.Size(71, 71),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(17, 34),
                        scaledSize: new google.maps.Size(25, 25)
                    };

                    // Create a marker for each place.
                    var marker = new google.maps.Marker({
                        map: map,
                        icon: image,
                        title: place.name,
                        position: place.geometry.location
                    });

                    markers.push(marker);

                    bounds.extend(place.geometry.location);
                }

                map.fitBounds(bounds);
            });



            // current map's viewport.
            google.maps.event.addListener(map, 'bounds_changed', function () {
                var bounds = map.getBounds();
                searchBox.setBounds(bounds);
            });
        }

        google.maps.event.addDomListener(window, 'load', LoadGoogleMAP);

    </script>--%>
</asp:Content>

