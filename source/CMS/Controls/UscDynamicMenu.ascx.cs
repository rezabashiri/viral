using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
namespace CMS.Controls
{
    public partial class UscDynamicMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                FillMenues();
        }
        public string MenuID
        {
            get;
            set;
        }
        public string MenuClass
        {
            get;
            set;
        }
        public string SubMenuClass
        {
            get;
            set;
        }
        public string LinksClass
        {
            get;
            set;
        }
        MyClass mc = new MyClass();
        private DataSet MenuSource
        {
            get
            {
                return ViewState["_MenuSource"] as DataSet;
            }
            set
            {
                ViewState["_MenuSource"] = value;
            }
        }
        private void FillMenues()
        {
            DataSet ds =MenuSource;
            if (ds == null)
            {
                string sql = "Select * from TMenu";
                sql = string.Format(sql, mc.GetCustomer());
                mc.connect();
                ds = mc.selectDataSet(sql);
                ds.DataSetName = "Menus";
                ds.Tables[0].TableName = "Menu";
                DataRelation relation = new DataRelation("ParentChild",
                 ds.Tables["Menu"].Columns["MenuItemID"],
                 ds.Tables["Menu"].Columns["FatherID"], true);

                relation.Nested = true;
                MenuSource = ds;
                // ds.Relations.Add(relation);
            }
       
            var menu=RecursiveCreate("0",null,ds);
            if (menu.Attributes.Count > 0)
            {
                menu.Attributes["class"] = MenuClass;
            }
            else
                menu.Attributes.Add("class", MenuClass);
            this.Controls.Add(menu);
            //Response.Write(menu.InnerHtml);
            //Panel1.Controls.Add(menu);
            
        }

        private HtmlGenericControl RecursiveCreate(string ParrentID,HtmlGenericControl menu,  DataSet ds)
        {
            DataRow []drs= ds.Tables[0].Select(string.Format("FatherID={0}", ParrentID ));
            if (drs.Count() == 0)
                return null ;
            HtmlGenericControl ul=UList(ParrentID);
            foreach (DataRow dr in drs)
            {
                var  child = RecursiveCreate(dr["MenuItemID"].ToString(),null, ds);

                var li = LIList(dr["MenuTitle"].ToString(), dr["MenuItemID"].ToString(), dr["LinkAddress"].ToString());
                if (child != null)
                    li.Controls.Add(child);
                ul.Controls.Add(li);
            }

            return ul;
        }
        private HtmlGenericControl UList(string id )
        {

            HtmlGenericControl ul = new HtmlGenericControl("ul");
            if (id != "0")
            {
                ul.ID = MenuID + id.ToString();
            }
            else
                ul.ID = MenuID;
            ul.ClientIDMode = System.Web.UI.ClientIDMode.Static;
            ul.Attributes.Add("class", SubMenuClass);

            return ul;

        }

        private HtmlGenericControl LIList(string innerHtml, string rel, string url)
        {

            HtmlGenericControl li = new HtmlGenericControl("li");

            li.Attributes.Add("rel", rel);
            string hrefclass = LinksClass != string.Empty ? string.Format("class={0}", LinksClass) : string.Empty;
            li.InnerHtml = "<a "+ hrefclass +" href=" + string.Format("'{0}'", url) + ">" + innerHtml + "</a>";

            return li;

        }
    }
}