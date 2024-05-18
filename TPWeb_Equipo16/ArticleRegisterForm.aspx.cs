using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using Domain;
using static System.Net.Mime.MediaTypeNames;

namespace TPWeb_Equipo16
{
    public partial class ArticleRegisterForm : System.Web.UI.Page
    {
        public Article _article;

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticlesManager articlesManager = new ArticlesManager();
            int articleId = Convert.ToInt32(Request.QueryString["Id"].ToString());
            _article = new Article();
            _article = articlesManager.Read(articleId);
        }
    }
}
