using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using CMS.CMSLogic;
namespace CMS.Pages
{
    public partial class Default : System.Web.UI.Page
    {
        private TItem _titem = new TItem();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                _titem = _titem.SearchItem("100", string.Empty);
                FillSlideShow();
                FillAboutUs();
                FillService();
                FillDownload();
                FillBrand();
                FillDriver();
                FillPortFolioItems();
                FillUpperportfolio();
            }

            //LoginControl.OnLoggedIn += LoginControl_OnLoggedIn;

            //UscSignUp.OnSendVerificationCode += UscSignUp_OnSendVerificationCode;
            //UscSignUp.OnVerificationComplete += UscSignUp_OnVerificationComplete;

        }

        void LoginControl_OnLoggedIn(AccessManagementService.Model.User user)
        {
            CMSLogic.SessionHelpers.SetUser(user);
        }

        private void UscSignUp_OnVerificationComplete(AccessManagementService.Access.UserActiveStatus status)
        {
            switch (status)
            {
                case AccessManagementService.Access.UserActiveStatus.Active:
                    //Server.TransferRequest("~/LoginUser.aspx");
                    break;
                case AccessManagementService.Access.UserActiveStatus.NotActive:
                    break;

            }
        }

        private void UscSignUp_OnSendVerificationCode(AccessManagementService.Helpers.VerificationStatus Status)
        {
        }


        private void FillDriver()
        {
            Driverlvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.DriverGroupName);
            Driverlvw.DataBind();
        }
        public void FillUpperportfolio()
        {
            UpperGallery.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.UpperGalleryGroupName);
            UpperGallery.DataBind();
        }
        public void FillPortFolioItems()
        {
            var group = new TGroup();
            var fathergroup = group.SearchGroupByName(TGroup.GalleryGroupName).FirstOrDefault();
            if (fathergroup != null)
            {
                List<TItem> _subitem = new List<TItem>();
                var childsource = group.SearchGroupByFatherID(fathergroup.GrpID);
                foreach (var item in childsource)
                {
                    _subitem.AddRange(_titem.Titems.Where(x => x.GrpName == item.GrpName));
                }
                Gallarylvw.DataSource = _subitem;
                GallaryFilterslvw.DataSource = childsource;
                GallaryFilterslvw.DataBind();
                Gallarylvw.DataBind();
            }
        }
        private void FillBrand()
        {
            Brandlvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.BrandGroupName);
            Brandlvw.DataBind();
        }
        private void FillSlideShow()
        {
            sliderlvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.SlideShowGroupName);
            sliderlvw.DataBind();
        }
        private void FillAboutUs()
        {
            Aboutlvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.UnderSliderGroupName);
            Aboutlvw.DataBind();
        }
        public void FillDownload()
        {
            Downloadlvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.DownloadGroupName).Take(1);
            Downloadlvw.DataBind();

        }
        public void FillService()
        {
            ServiceHeadlvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.ServiceGroupName);
            SubServiceTitlelvw.DataSource = SubServiceBodylvw.DataSource = _titem.Titems.Where(x => x.GrpName == TGroup.ServicesGroupName);
            SubServiceBodylvw.DataBind();
            SubServiceTitlelvw.DataBind();
            ServiceHeadlvw.DataBind();
        }

        private static int slidernum = 0;
        public string CreateLink(object title)
        {
            var items = _titem.Titems.Where(x => x.GrpName == TGroup.ServicesGroupName).Count();
            string css = string.Empty;
            string divtag = "<div class= ";
            string _title = title != null ? title.ToString() : string.Empty;
            string atag = "<a name=" + slidernum.ToString() + " class='animbox'>" + _title + "</a>";
            if (items % 2 == 0)
            {
                var mid = items / 2;
                if (slidernum == mid)
                {
                    css = "actser";
                }
            }
            else
            {
                var mid = items / 2;
                if (slidernum == mid)
                {
                    css = "actser";
                }
            }
            css += " service_box animaper ";
            divtag += "'" + css + "'";
            divtag += " > ";
            divtag += atag;
            divtag += "</div>";
            slidernum++;
            if (slidernum == items)
                slidernum = 0;
            return divtag;
        }

        protected void btntest_Click(object sender, EventArgs e)
        {
            msg.ShowMessage("test",WebUtility.Controls.MessageBox.MessageType.danger);
        }
    }
}
