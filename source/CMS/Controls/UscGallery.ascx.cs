using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;
namespace CMS.Controls
{
    public partial class UscGallery : System.Web.UI.UserControl
    {
        public object AttachID
        {
            get;
            set;
        }
        List<global::WebUtility.Model.Attachment> AttachList;
        CMS.CMSLogic.GalleryHelpers GalleryHelper = new CMSLogic.GalleryHelpers();
        private void Bind()
        {
            Nullable<Guid> _attachid = AttachID as Guid?;
            if (_attachid != null)
            {
                global::WebUtility.Helpers.FileUploadHelpers _fh = new WebUtility.Helpers.FileUploadHelpers();
                AttachList = _fh.GetAttachByID(_attachid);
                var notimagelist = AttachList.Where(x => !x.ContentType.Contains("image"));//to exclude thumbnails
                var thumb = AttachList.Where(x => notimagelist.Any (  y=>y.FileName.Split('.')[0] == x.FileName.Split('.')[0] ) && x.ContentType.Contains("image"));//thumbnails
                attachView.DataSource = AttachList.Where(x=> !thumb.Any(y=>y.FileName == x.FileName))  ;
                attachView.DataBind();
            }
        }
        public string putThumbnail(object fileName)
        {
           return  GalleryHelper.putThumbnail(fileName, AttachList);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Bind();
        }
    }
}