using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.CMSLogic
{
    public class GalleryHelpers
    {
        public string putThumbnail(object fileName,List< global::WebUtility.Model.Attachment> _attaches)
        {
            if (fileName != null)
            {
                string _file = fileName.ToString();
                string name = _file.Split('.')[0];

                var thumb = _attaches.Where(x => x.FileName.Contains(name) && x.ContentType.Contains("image")).FirstOrDefault();
                return thumb != null ? thumb.VirtualAddress : string.Empty;
            }
            return string.Empty;
        }
        public string putCss(object fileurl)
        {
            string tag = string.Empty;
            if (fileurl != null)
            {
                string url = fileurl.ToString();
                var ext = System.IO.Path.GetExtension(url);
                switch (ext)
                {
                    case ".mp4":
                    case ".mkv":
                    case ".avi":
                        return "video";
                    case ".mp3":
                    case ".wav":
                        return "voice";
                    default:
                        return "photography";
                }
            }
            return tag;
        }
        public string PutFile(object fileurl, object filename)
        {
            string tag = string.Empty;
            if (fileurl != null)
            {
                string url = fileurl.ToString();
                string rel = string.Empty, classes = string.Empty;
                string file = filename != null ? string.Format("{0}='{1}'","title", CMS.CMSLogic.StringHeplers.RemoveExtension( filename.ToString())) : string.Empty;
                switch (putCss(fileurl))
                {
                    case "video":
                    case "voice":
                        classes = "class='popup-youtube'";
                        break;
                    default:
                        rel = "data-rel='prettyPhoto[pp_gal]'";
                        break;
                }
                if (!string.IsNullOrEmpty(url))
                    tag = "<a " + classes + " " + rel  +" "+file + " href='" + CMS.CMSLogic.TItem.GetImageClientPath(fileurl) + " '><i class='fa fa-2x fa-youtube-play'></i></a>";
            }
            return tag;
        }
        public string PutFile(object fileurl)
        {
          return  PutFile(fileurl, string.Empty);
        }
        public  string PutFileName(object filename)
        {
            switch (putCss(filename))
            {
                case "video":
                    return "فیلم";
                case "voice":
                    return "صوت";
                default:
                case "photography":
                    return "عکس";
            }
        }
    }
}