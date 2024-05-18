using System;
using System.Collections.Generic;
using Domain;

namespace TPWeb_Equipo16
{
    public partial class Master : System.Web.UI.MasterPage
    {
        public List<ArticleSet> _articleSets;

        public Master()
        {
            _articleSets = new List<ArticleSet>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentArticleSets"] != null)
            {
                _articleSets = (List<ArticleSet>)Session["CurrentArticleSets"];
            }
        }
    }
}
