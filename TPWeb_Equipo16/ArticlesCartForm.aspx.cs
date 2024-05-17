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
    public partial class ArticlesCartForm : System.Web.UI.Page
    {
        // ATTRIBUTES

        private Article _article;
        private ArticlesManager _articlesManager;
        private CartManager _cartManager;

        // PROPERTIES

        public CartManager ArticlesCart
        {
            get { return _cartManager; }
            set { _cartManager = value; }
        }

        // CONSTRUCT

        public ArticlesCartForm()
        {
            _articlesManager = new ArticlesManager();
            _cartManager = new CartManager();
        }

        // METHODS

        private void RequestAddedArticle()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                _article = _articlesManager.Read(id);
                _cartManager.Add(_article);
            }
        }

        private void BindGridView()
        {
            List<ArticleSet> articleSets = new List<ArticleSet>();
            ArticleSet a1 = new ArticleSet();
            ArticleSet a2 = new ArticleSet();
            a1.Amount = 4;
            a2.Amount = 5;
            a1.Name = "uno";
            a2.Name = "dos";
            articleSets.Add(a1);
            articleSets.Add(a2);

            CartGridView.DataSource = _cartManager.List();
            CartGridView.DataBind();
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            RequestAddedArticle();
            BindGridView();
        }
    }
}