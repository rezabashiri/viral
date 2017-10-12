<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscCampains.ascx.cs" Inherits="Viralme.Controls.UscCampains" ClassName="Viralme.Controls.Campains" %>

<%@ Register Assembly="JQControls" Namespace="JQControls" TagPrefix="jq" %>

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

    #map_canvas {
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

 <div class="row">
	<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
		<h1 class="page-title txt-color-blueDark">
			
			<!-- PAGE HEADER -->
			<i class="fa-fw fa fa-pencil-square-o"></i> 
				کمپین های تبلیغاتی
			 
		</h1>
	</div>
     </div>
 


<section id="widget-grid">

    <div class="row ">

        <article  class="col-sm-12 col-md-12"  >

            <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false" data-widget-sortable="false">

                <header>
                    <span class="widget-icon"><i class="fa fa-cubes"></i></span>
                    <h2>  Checkout Form </h2>

                </header>

                <div>

                    <div class="jarviswidget-editbox ">
                    </div>

                    <div class="widget-body no-padding no-margin">
  

                        <fieldset>

                            <div class="row">
                                <section class="col col-sm-12">

                                    <%--grid for show prices--%>
                                    <div id="jsCampainGrid"></div>

                                </section>
                            </div>

                        </fieldset>

                        <footer>
                            <%-- <button type="button" class="btn btn-primary">
                                    ذخیره
                                </button>--%>
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
                    <h2>فرم ساخت کمپین </h2>

                </header>

                <div>

                    <div class="jarviswidget-editbox">
                    </div>

                    <div class="widget-body no-padding no-margin">
                        <div class="smart-form">
                        <fieldset>
                            <div class="row">
                                <section class="col-sm-12 col-md-2">
                                    <label>
                                        نام کمپین
                                    </label>
                                </section>


                                <section class="col-sm-12 col-md-4">
                                    <label class="input">
                                        <i class="icon-prepend fa fa-cubes"></i>
                                        <input type="text" id="txtCampainName" placeholder="نام کمپین " class="comment-input form-control" />
                                    </label>
                                </section>
                            </div>

                            <div class="row">
                                <section class="col-sm-12 col-md-2">
                                    <label>
                                        تاریخ شروع
                                    </label>
                                </section>


                                <section class="col-sm-12 col-md-3">

                                    <%--js data picker--%>
                                    <label class="input">
                                        <%--<i class="icon-prepend fa fa-calendar"></i>--%>
                                        <jq:jqloader id="loader" runat="server" loadjqscript="false" loaduiscript="false" loaduicorestyles="true" theme="Flick"></jq:jqloader>
                                        <jq:jqdatepicker id="dteStartDate" runat="server" changemonth="true" changeyear="true" regional="fa" dateformat="YMD" calendartype="Jalali"></jq:jqdatepicker>
                                    </label>
                                </section>


                                <section class="col-sm-12 col-md-2">
                                    <label>
                                        مدت کمپین (ماه)
                                    </label>
                                </section>


                                <section class="col-sm-12 col-md-3">
                                    <label class="input">
                                        <i class="icon-prepend fa fa-calendar-o"></i>
                                        <input type="text" id="txtCampainLenghTime" placeholder="مدت کمپین " class="comment-input form-control" />
                                    </label>
                                </section>


                            </div>

                        </fieldset>



                        <fieldset>
                            <div class="row">
                                <section class="col-sm-12 col-md-2">
                                    <label>
                                        قیمت پکیج
                                    </label>
                                </section>

                                <section class="col-sm-12 col-md-3">
                                    <label class="select">
                                        <select id="cmbPackageType">
                                            <option value="باکس">باکس</option>
                                            <option value="نیمه خودرو">نیمه خودرو</option>
                                            <option value="تم">تم</option>
                                        </select>
                                    </label>
                                </section>

                                <section class="col-sm-12 col-md-2">
                                    <label class="input">
                                        <i class="icon-prepend fa fa-usd"></i>
                                        <input type="text" id="txtPackagePriceMin" placeholder="حداقل قیمت پکیج " class="comment-input form-control" />
                                    </label>
                                </section>

                                <section class="col-sm-12 col-md-2">
                                    <label class="input">
                                        <i class="icon-prepend fa fa-usd"></i>
                                        <input type="text" id="txtPackagePriceMax" placeholder="حداکثر قیمت پکیج " class="comment-input form-control" />
                                    </label>
                                </section>

                                <section class="col col-1">
                                    <span onclick="insertIntoJsPackageGrid();" class="btn btn-lg glyphicon glyphicon-plus-sign no-padding no-margin"></span>
                                </section>
                            </div>

                            <div class="row">
                                <section class="col-sm-12 col-md-12">

                                    <%--grid for show prices--%>
                                    <div id="jsPackagGrid"></div>

                                </section>
                            </div>
                        </fieldset>


                        <fieldset>
                            <div class="row">
                                <section class="col-sm-12 col-md-12">
                                    <label>
                                        مکان های مورد نظر را در نقشه انتخاب کنید
                                    </label>
                                </section>
                            </div>

                            <div class="row">

                                <section class="col-sm-12 col-md-12">

                                    <input id="txtsearch" class="apply" type="text" placeholder="لطفا مکان مورد نظر خود را وارد نمائید" autocomplete="on" />
                                    <%--<div id="divloadMap"></div>--%>
                                    <div id="map_canvas" style="width:100%"></div>
                                </section>

                            </div>


                            <div class="row">
                                <section class="col-sm-12 col-md-5">
                                    <label>
                                        مساحت ناحیه انتخاب شده 
                                    </label>
                                </section>
                                <section class="col-sm-12 col-md-4">

                                    <div id="area">0 m&sup2;</div>
                                    <div id="areakm">0 km&sup2;</div>
                                </section>
                            </div>

                            <div class="row">

                                <section class="col-sm-12 col-md-3">
                                    <label>
                                        گزینه های انتخابی 
                                    </label>
                                </section>

                                <section class="col-sm-12 col-md-2">
                                    <input type="button" value="حذف اخرین نقطه" onclick="DeleteLastPoint();" class="btn btn-info" />
                                </section>

                                <section class="col-sm-12 col-md-2">
                                    <input type="button" value="حذف تمامی نقاط" onclick="ClearAllPoints();" class="btn btn-danger" />
                                </section>
                            </div>

                        </fieldset>
                        <%--our analys has been changed , we dont need driving time any more--%>
                    <%--    <fieldset>


                            <div class="row">
                                <section class="col col-2">
                                    <label>
                                        زمان رانندگی
                                    </label>
                                </section>

                                <section class="col col-2">
                                    <label class="select">
                                        <select id="cmbDrivingTime">
                                            <option value="صبح">صبح</option>
                                            <option value="ظهر">ظهر</option>
                                            <option value="عصر">عصر</option>
                                            <option value="شب">شب</option>
                                            <option value="نیمه هشب">نیمه شب</option>
                                        </select>
                                    </label>
                                </section>


                                <section class="col col-1">
                                    <span onclick="insertIntoJsAreaGrid();" class="btn btn-lg glyphicon glyphicon-plus-sign no-padding no-margin"></span>
                                </section>
                            </div>

                            <div class="row">
                                <section class="col col-12">

                                     div for grid 
                                    <div id="jsAreaGrid"></div>

                                </section>
                            </div>
                        </fieldset>--%>


                        <footer>
                            <div class="col-sm-12 center-block" >
                        <button type="button" class="btn btn-primary" onclick="saveIntoAreaJSGrid();">
                                اضافه کردن کمپین
                            </button>
                            </div>
                          
                        </footer>
                            </div>
                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->
            </div>

        </article>
    </div>

</section>

<script type="text/javascript" src="<%= new tkv.Utility.ResourceHelpers().GetWebResourceUrl(this.Page, typeof(UscCampains),"Viralme.Resources.sandbox-google-maps-marker-lasso-search-tool.js")  %>"></script>
<script> initialize();</script>



<script>


    //Campain's Grid 

    i = 0;
    var Campains = [];

    $("#jsCampainGrid").jsGrid({
        width: "100%",
        editing: false,
        sorting: true,
        paging: true,


        deleteConfirm: "آیا از حذف اطمینان دارید؟ ",

        controller:
        {
            loadData: function (filter) {
                return Campains;
            }
        },

        fields: [
            { name: "campainName", type: "text", title: "نام کمپین", width: 200, align: "center" },
            { name: "campainName", type: "text", title: "تاریخ شروع کمپین", width: 200, align: "center" },
            { name: "campainName", type: "text", title: "مدت کمپین", width: 200, align: "center" },
            { name: "carCount", type: "text", title: "تعداد خودرو", width: 250, align: "center" },
            { type: "control", editButton: false }
        ]
    });


    //function insertIntoJsCampainGrid() {

    //    i++;
    //    Campains.push(
    //        { id: i, campainName: "name", carCount: "10" }
    //    );

    //    $("#jsCampainGrid").jsGrid("loadData");
    //}

    //package's Grid 

    i = 0;
    var packages = [];

    $("#jsPackagGrid").jsGrid({
        width: "100%",
        editing: false,
        sorting: true,
        paging: true,

        deleteConfirm: "آیا از حذف اطمینان دارید؟ ",

        controller:
        {
            loadData: function (filter) {
                return packages;
            }
        },

        fields: [
            { name: "PackageType", type: "text", title: "نوع پکیج", width: 200, align: "center" },
            { name: "MinPrice", type: "text", title: "حداقل قیمت پکیج", width: 250, align: "center" },
            { name: "MaxPrice", type: "text", title: "حداکثر قیمت پکیج", width: 250, align: "center" },
            { type: "control", editButton: false }
        ]
    });


    function insertIntoJsPackageGrid() {
        var e = document.getElementById("cmbPackageType");
        var Packagetype = e.options[e.selectedIndex].value;
        //var PackagePrice = document.getElementById("txtPackagePrice").value;
        var PackagePriceMin = $(txtPackagePriceMin).val();
        var PackagePriceMax = $(txtPackagePriceMax).val();

        if (PackagePriceMin.length > 0 && PackagePriceMax > 0) {

            i++;
            packages.push(
                { ID: i, PackageType: String(Packagetype), MinPrice: String(PackagePriceMin), MaxPrice: String(PackagePriceMax) }
            );

            $("#jsPackagGrid").jsGrid("loadData");
            $(txtPackagePriceMin).val('');
            $(txtPackagePriceMax).val('');
        }
        else {
            alert('لطفا مبلغ مورد نظر خود را وارد نمائید');
        }
    }


    var i = 0;
    var Areas_selected = [
         //{ id: "0", drivingTime: "ss", drivingArea: [] }
    ];



    $("#jsAreaGrid").jsGrid({
        width: "100%",
        //height: "400px",


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
                return Areas_selected;
            }
        },

        fields: [
            { name: "drivingTime", type: "text", title: "زمان رانندگی", width: 200, align: "center" },
            //{ name: "drivingArea", type: "text", title: "ناحیه انتخابی", width: 150, align: "center", validate: "required" },
            { type: "control", editButton: false }
        ]
    });


    function insertIntoJsAreaGrid() {
        var e = document.getElementById("cmbDrivingTime");
        var selected_drivingTime = e.options[e.selectedIndex].value;

        //$("#jsAreaGrid").jsGrid("insertItem", { drivingTime: String(selected_drivingTime), drivingArea: 25 }).done(function () {
        //    alert(routeMarkers[0].position.lat());
        //});


        var positions_area = [];

        if (routeMarkers.length >= 3) {

            for (var j = 0; j < routeMarkers.length; j++) {
                positions_area.push(routeMarkers[j].position.lat(), routeMarkers[j].position.lng());
            }

            i++;
            Areas_selected.push(
                { id: i, drivingTime: String(selected_drivingTime), drivingArea: routeMarkers }
            );

            $("#jsAreaGrid").jsGrid("loadData");

            ClearAllPoints();
        }
        else {
            alert('لطفا ناحیه مورد نظر خود را با حداقل سه کلیک بر روی نقشه انتخاب کنید.');
        }
    }


    function saveIntoAreaJSGrid() {
        var points =[];
        if (routeMarkers) {
            for (i in routeMarkers) {
                points.push({Lat: routeMarkers[i].getPosition().lat(),Lng:routeMarkers[i].getPosition().lng()});
            }
        }
        var packageobj = { PackagePrices: packages, CampainArea:  points   };
  
        SaveData(packageobj);
    }


</script>
