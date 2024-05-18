using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using Domain;

namespace TPWeb_Equipo16
{
    public partial class ArticleRegisterForm : System.Web.UI.Page
    {
        // ATTRIBUTES

        public Article _article;
        ArticlesManager _articlesManager = new ArticlesManager();

        // CONSTRUCT

        public ArticleRegisterForm()
        {
            _article = new Article();
        }

        // METHODS

        private void RequestOpenArticle()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int articleId = Convert.ToInt32(Request.QueryString["Id"].ToString());
                _article = _articlesManager.Read(articleId);
            }
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            RequestOpenArticle();
        }
    }
}
