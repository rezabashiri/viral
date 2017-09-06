<%@ Page Title="" Language="C#" MasterPageFile="~/Design/MasterPages/Administrator.Master" AutoEventWireup="true" CodeBehind="DriverPackage.aspx.cs" Inherits="CMS.Viralme.Driver.DriverPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPH" runat="server">

    <style>

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
    </style>


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

            <article class="col-sm-12 col-md-12 col-lg-6">


                <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false" data-widget-custombutton="false">

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
                                    <section class="col col-6">
                                        <label>
                                            نوع خودرو
                                        </label>
                                    </section>
                                    <section class="col col-6">
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
                            <%--</form>--%>
                        </div>
                        <!-- end widget content -->

                    </div>
                    <!-- end widget div -->

                </div>
            </article>



            <article class="col-sm-12 col-md-12 col-lg-6">

                <!-- Widget ID (each widget will need unique ID)-->
                <div class="jarviswidget" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">

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
                                        <%--maps--%>
                                        <div id="Map"></div>
                                    </section>
                                </div>
                            </fieldset>


                            <footer>
                                <button type="submit" class="btn btn-primary">
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


    <div>
        <h1>Enter Your Location Details</h1>
    </div>
    <div>
        <asp:TextBox ID="txt_location" TextMode="MultiLine" Width="400px" Height="70px" runat="server"></asp:TextBox>
    </div>
    <div>
        <input type="button" value="Search" onclick="getmap()">
    </div>
    <div id="map_populate" style="width: 100%; height: 500px; border: 5px solid #5E5454;">
    </div>


 

</asp:Content>

